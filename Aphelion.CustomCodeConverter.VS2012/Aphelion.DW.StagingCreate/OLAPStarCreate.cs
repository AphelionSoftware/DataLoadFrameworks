using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using Aphelion.DW.StagingCreate.Schema;
using Aphelion.DW.Shared;
using System.ComponentModel;

namespace Aphelion.DW.StagingCreate
{

    public class ProgressReport
    {
        public string Message = "";
        public ProgressReport(string pMsg)
        {
            this.Message = pMsg;
        }
        public override string ToString()
        {
            return this.Message;
        }
        
    }

    public class OLAPStarCreate
    {
        
        #region Properties

        public BackgroundWorker backWorker { get; set; }
        public Dictionary<string, SchemaTable> lstTS = new Dictionary<string, SchemaTable>();
        public Dictionary<string, string> lstViews = new Dictionary<string, string>();

        public string srcDBConn;
        public string destDBConn;
        public string sSchema;
        public string sFactTablePrefix;
        public string sDimTablePrefix;
        public string sFieldExcl;
        public string sTableExcl;
        public string sFactFilter;
        public string sDimFilter;
        public bool bUseSchemaFilter;
        SqlConnection srcConn;
        SqlConnection srcFactConn;
        SqlConnection srcDimConn;
        SqlConnection destConn;
        public int intMaxRecursion;
        public string strFullCreate;
        public string sErr  = "";
        public string strFullResult = "";
        #endregion

        public OLAPStarCreate(
            string pSrcDBConn,
            string pdestDBConn,
         string pSchema,
         string pFactTablePrefix,
        string pDimTablePrefix,
         string pFieldExcl,
         string pTableExcl,
            string pFactFilter,
            string pDimFilter,
            bool pUseSchemaFilter
                )
        {
             srcDBConn = pSrcDBConn;
             destDBConn = pdestDBConn;
             sSchema = pSchema;
             sFactTablePrefix = pFactTablePrefix;
             sDimTablePrefix = pDimTablePrefix;
             sFieldExcl = pFieldExcl;
             sTableExcl = pTableExcl;
             sFactFilter = pFactFilter;
             sDimFilter = pDimFilter;
             bUseSchemaFilter = pUseSchemaFilter;
        }

        public void RunScript()
        {
            
            sErr = "";
            string[] strCommands = this.strFullCreate.Split( new string[] {"GO"}, StringSplitOptions.None);
            if (backWorker != null)
            {
                backWorker.ReportProgress(0, new ProgressReport(string.Format("Running {0} scripts", strCommands.Length.ToString())));
            }
            int iLoop = 0;
            SqlCommand comm = new SqlCommand(this.strFullCreate, this.destConn);
            foreach (string strComm in strCommands)
            {
                try
                {
                    if (++iLoop % 100 == 0)
                    {
                        if (backWorker != null)
                        {
                            backWorker.ReportProgress(0, new ProgressReport(string.Format("Running script {0} of {1}", iLoop, strCommands.Length.ToString())));
                        }
                    }
                    comm.CommandText = strComm;
                    comm.ExecuteNonQuery();
                }
                catch (System.Exception ex)
                {
                    sErr += strComm + "\n errored with: \n " + ex.Message + "\n\n";
                    if (backWorker != null)
                    {
                        backWorker.ReportProgress(0, new ProgressReport(sErr));
                    }

                }
            }
            this.strFullResult = this.sErr + "\n\n\n" + this.strFullCreate;
        }

        public string OutputScript()
        {
            this.strFullCreate = string.Format(QC.qryCreateSchema, this.sSchema);

            //View Creation from tables
            foreach (KeyValuePair<string, SchemaTable> kv in lstTS)
            {
                this.strFullCreate +=
                    kv.Value.CreateStatement;
            }
            //Custom view additions
            foreach (KeyValuePair<string, string> kv in lstViews)
            {
                this.strFullCreate +=
                    kv.Value + @"
GO
";
            }
            return strFullCreate;
        }


        public void CreateScript()
        {
            srcConn = new SqlConnection(this.srcDBConn);
            srcConn.Open();
            srcFactConn = new SqlConnection(this.srcDBConn);
            srcFactConn.Open();
            destConn = new SqlConnection(this.destDBConn);
            destConn.Open();

            SqlCommand command = srcConn.CreateCommand();
            if (!bUseSchemaFilter)
            {
                command.CommandText = string.Format(QC.qryTableQuery, this.sFactTablePrefix);
            }
            else
            {
                command.CommandText = string.Format(QC.qryTableQueryBySchema, this.sFactTablePrefix);
            } 

            SqlDataReader drFacts = command.ExecuteReader();
            string sSchemaTable;
            string sTableName;
            string sCreate;
            //drFacts.Read();
            while (drFacts.Read())
            {
                sSchemaTable = drFacts.GetString(0);
                sTableName = drFacts.GetString(1);

                if (!lstTS.ContainsKey(sSchemaTable + "." + sTableName))
                {
                    sCreate = BuildFactTableCreate(sSchemaTable, sTableName, sFieldExcl, sFactFilter, sDimFilter);
                    lstTS.Add(sSchemaTable + "." + sTableName, new SchemaTable(sSchemaTable, sTableName, sCreate));
                }

                //drFacts.Read();
            }


            drFacts.Close();
            command.CommandText = QC.qryAdditionalViews;
            SqlDataReader drViews = command.ExecuteReader();
            string sPropertyName;
            string sViewDefinition;
            while (drViews.Read())
            {
                sPropertyName = drViews.GetString(0);
                sViewDefinition = drViews.GetString(1);

                if (!lstViews.ContainsKey(sPropertyName))
                {
                    lstViews.Add(sPropertyName, sViewDefinition);
                }

                //drFacts.Read();
            }
        }

        public string BuildFactTableCreate(string pSchemaTable, string pTableName, string pFieldExcl, string pFactFilter, string pDimFilter)
        {

            if (backWorker != null)
            {
                backWorker.ReportProgress(0, new ProgressReport(string.Format("Building fact {0}.{1}", pSchemaTable, pTableName)));
            }
            string strCreate;
            string strExProps = "";
            //List<TableColumn> tcLst = new List<TableColumn>();
            SqlCommand comm ;
            SqlDataReader drRefs ;
            string strColumnProps = "";
            //Build field list
            string strColumnList = "";
            string sAdditionalFields = "";
            string sAdditionalJoins = "";
            bool bCoalesce = false;
            comm = new SqlCommand(string.Format(QC.qryListColumns, pTableName, pSchemaTable, pFieldExcl, "BASE TABLE", "OLAPViews"), srcFactConn);
            drRefs = comm.ExecuteReader();
            drRefs.Read();
            strColumnList = string.Format("\n\t[{0}].[{1}] ", pTableName, drRefs.GetString(0));
            //////drRefs.Read();
            while (drRefs.Read())
            {
                strColumnList += string.Format("\n\t,[{0}].[{1}] ", pTableName, drRefs.GetString(0));
                #region Column Properties
                strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                    , "SrcSchema"
                    , pSchemaTable
                    , this.sSchema
                    , pTableName
                    , drRefs.GetString(0)
                    );

                strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                        , "SrcTable"
                        , pTableName
                        , this.sSchema
                        , pTableName
                        , drRefs.GetString(0)
                        );


                strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                        , "SrcColumn"
                        , drRefs.GetString(0)
                        , this.sSchema
                        , pTableName
                        , drRefs.GetString(0)
                        );
                #endregion
                //drRefs.Read();
            }
            drRefs.Close();

            comm = new SqlCommand(string.Format(QC.qryAdditionalFields, pSchemaTable, pTableName), srcFactConn);
            drRefs = comm.ExecuteReader();
            if (drRefs.Read())
            {
                sAdditionalFields = string.Format("\n\t,{0} ", drRefs.GetString(1));
                //////drRefs.Read();
                while (drRefs.Read())
                {
                    sAdditionalFields += string.Format("\n\t,{0} ", drRefs.GetString(1));
                }
            }
            drRefs.Close();

            comm = new SqlCommand(string.Format(QC.qryAdditionalJoins, pSchemaTable, pTableName), srcFactConn);
            drRefs = comm.ExecuteReader();
            if (drRefs.Read())
            {
                sAdditionalJoins = string.Format("\n\t{0} ", drRefs.GetString(1));
                //////drRefs.Read();
                while (drRefs.Read())
                {
                    sAdditionalJoins += string.Format("\n\t{0} ", drRefs.GetString(1));
                }
            }
            drRefs.Close();
            strCreate = string.Format(QC.qryCreateFactView,
                this.sSchema
                , pTableName
                , strColumnList
                , pSchemaTable
                , pFactFilter
                , sAdditionalFields
                , sAdditionalJoins
                );
            drRefs.Close();

            //Build related tables 
            if (sTableExcl != "") 
            {
                comm = new SqlCommand(string.Format(QC.qryReferenceQueryExcl, pSchemaTable, pTableName, sTableExcl, "''", "OLAPViews"), srcFactConn);
            
            } else {
                comm = new SqlCommand(string.Format(QC.qryReferenceQuery, pSchemaTable, pTableName, "OLAPViews"), srcFactConn);
            }
            drRefs = comm.ExecuteReader();
            
            //drRefs.Read();
            string sDimTable = "";
            string sDimSchema = "";
            while (drRefs.Read())
            {
                if (drRefs.GetString(6).Contains("Active"))
                {
                }
                #region References
                if (sDimTable != drRefs.GetString(6) || 
                    sDimSchema != drRefs.GetString(5)) {
                    
                    sDimTable = drRefs.GetString(6);
                    sDimSchema = drRefs.GetString(5);


                    if (!lstTS.ContainsKey(sDimSchema + "." + sDimTable))
                    {

                        System.Boolean.TryParse(drRefs.GetString(9), out bCoalesce);
                        lstTS.Add(sDimSchema + "." + sDimTable
                            , new SchemaTable(
                                sDimSchema
                                , sDimTable

                                , BuildDimensionTableCreate(sDimSchema, sDimTable, pFieldExcl, pDimFilter, bCoalesce)));
                    }

                    }
                #endregion

                //drRefs.Read();
            }

            drRefs.Close();
            SqlConnection srcPropConn = new SqlConnection(this.srcDBConn);
            srcPropConn.Open();
            SqlCommand commProp = new SqlCommand(string.Format(QC.qryGetExtendedProperties, pTableName, pFieldExcl), srcPropConn);
            SqlDataReader drProps;

            drProps = commProp.ExecuteReader();
            while (drProps.Read())
            {
                #region Extended Properties
                //string sAlias = 
                strExProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                    , drProps.GetString(0)
                    , drProps.GetString(1)
                    , this.sSchema
                    , pTableName
                    , drProps.GetString(2)
                    );
                #endregion
            }
            drProps.Close();

            commProp.CommandText = string.Format(QC.qryAdditionalProperties, pSchemaTable, pTableName) ;

            drProps = commProp.ExecuteReader();
            while (drProps.Read())
            {
                strExProps += drProps.GetString(1);
            }

            drProps.Close();

            strExProps += @"
    GO    
" + string.Format(QC.qryAddExtendedPropertyView
                    , "XMLATableType"
                    , "MeasureGroup"
                    , this.sSchema
                    , pTableName
                    );

            strCreate += strExProps;
            strCreate += strColumnProps;    

            return strCreate;

        }

        public string BuildDimensionTableCreate(string pDimSchema, string pDimName, string pFieldExcl, string pDimFilter, bool pCoalesceFields)
        {
            if (backWorker != null)
            {
                backWorker.ReportProgress(0, new ProgressReport(string.Format("Building dimension {0}.{1}", pDimSchema, pDimName)));
            }
            
            string strColumnProps = "";
            string strCreate = "";
            List<TableColumn> tcList = new List<TableColumn>();
            string strJoins = "";
            SqlCommand comm;
            SqlDataReader drRefs;
            
            //Build field list
            string strColumnList = "";
            SqlConnection srcDimConn = new SqlConnection(this.srcDBConn);
            srcDimConn.Open();
            comm = srcDimConn.CreateCommand();
            comm.CommandText = string.Format(QC.qryDimColumns, pDimName, this.sDimTablePrefix, pFieldExcl, pDimSchema, this.sDimTablePrefix, "OLAP");
            drRefs = comm.ExecuteReader();
             
            while (drRefs.Read())
            {
                ///TODO: This looks up a single table. Problem is that one table may be linked twice?
                ///Column should take care of that...
                if (!tcList.Exists(item => item.TableName == pDimName && item.ColumnName == drRefs.GetString(0)))
                {
                    tcList.Add(new TableColumn(pDimName, drRefs.GetString(0), drRefs.GetString(1)));
                }
 
            }

            drRefs.Close();
            //Build related tables 
            #region Related Tables
            comm = srcDimConn.CreateCommand();
            if (sTableExcl != "")
            {
                comm.CommandText =string.Format(QC.qryReferenceQueryExcl, pDimSchema, pDimName, sTableExcl, "''", "OLAP") ;

            }
            else
            {
                comm.CommandText = string.Format(QC.qryReferenceQuery, pDimSchema, pDimName, "OLAP");
            }
            drRefs = comm.ExecuteReader();
            //drRefs.Read();
            string sColumnName = "";
            string sConstraintSchema = "";
            string sConstraintName = "";
            string sDimTable = "";
            string sDimSchema = "";
            string sJoinTable = "";
            string sJoinSchema = "";
            string strChildJoins = "";
            string strExProps = "";
            string strAddJoins = "";
            string sJoinAlias = "";
            string sJoinAliasHash = "";
            string sSourceAlias = "";
            string sAltColumn = "";
            bool bCoalesce = false;
            //List<TableColumn> lstTC;
            while (drRefs.Read())
            {

                if (sDimSchema != drRefs.GetString(2) ||
                    sDimTable != drRefs.GetString(3) ||
                    sJoinSchema != drRefs.GetString(5) ||
                    sJoinTable != drRefs.GetString(6) ||
                    sConstraintSchema != drRefs.GetString(0) ||
                    sConstraintName != drRefs.GetString(1)

                    )
                {
                    //strJoins += strChildJoins; //Interleaving
                    strChildJoins = "";
                    strJoins += strAddJoins;
                    strAddJoins = "";
                    sDimSchema = drRefs.GetString(2);
                    sDimTable = drRefs.GetString(3);
                    sColumnName = drRefs.GetString(4);
                    
                    sJoinSchema = drRefs.GetString(5);
                    sJoinTable = drRefs.GetString(6);
                    sAltColumn = drRefs.GetString(7);
                    sConstraintSchema = drRefs.GetString(0);
                    sConstraintName = drRefs.GetString(1);
                    System.Boolean.TryParse(drRefs.GetString(9), out bCoalesce);
                    foreach (TableColumn TC in tcList.FindAll(item => item.TableName == sJoinTable
                            && item.ColumnName == sColumnName
                            ))
                    {
                        tcList[tcList.FindIndex(item => item.ColumnName == TC.ColumnName
                            && item.TableName == sJoinTable
                            )].TableAlias = sJoinAlias;
                    }

                    sSourceAlias = tcList.First(item => item.TableName == drRefs.GetString(3)).TableAlias;

                    List<TableColumn> test = tcList.FindAll(item => item.TableName == drRefs.GetString(3));

                    //Prefixing with the source alias we're joining from, for queries that may go to the same table multiple times, e.g. Active
                    sJoinAlias = sSourceAlias + "_" + sJoinTable + "_" + sColumnName;
 
                    sJoinAliasHash = sJoinTable + "_" + Extensions.HashFNV1a_64_ABS(sJoinAlias).ToString();


                    AddDimensionFields(sJoinSchema, sJoinTable, sJoinAlias, sDimFilter, pFieldExcl, ref tcList, ref strChildJoins, ref strExProps, pDimName);

                    if (drRefs.GetString(8) == "YES")
                    {
                        strJoins += string.Format(QC.qryInterLeftJoins
                            , sJoinSchema
                            , /*drRefs.GetString(3)*/ sSourceAlias + "_" + Extensions.HashFNV1a_64_ABS(sSourceAlias).ToString()
                            , sColumnName
                            , sJoinTable
                            , sAltColumn
                            , sJoinAliasHash //Table Alias
                            , strChildJoins
                            );
                    }
                    else
                    {
                        strJoins += string.Format(QC.qryInterJoins
                            , sJoinSchema
                            , /*drRefs.GetString(3)*/ sSourceAlias + "_" + Extensions.HashFNV1a_64_ABS(sSourceAlias).ToString()
                            , sColumnName
                            , sJoinTable
                            , sAltColumn
                            , sJoinAliasHash //Table Alias
                            , strChildJoins
                            );
                    }
                    
                }
                else
                {
                    /*strAddJoins += string.Format(QC.qryJoinsAnd
                        , drRefs.GetString(3) //Ref table
                        , drRefs.GetString(4) //Ref Column
                        , drRefs.GetString(6) //Unique Table
                        , drRefs.GetString(7) //Unique Column
                        );
                     */
                    strAddJoins += string.Format(QC.qryJoinsAnd
                        /*, drRefs.GetString(3) //Ref table*/
                        , sJoinAliasHash /*Reusing from prev calc*/
                        , drRefs.GetString(4) //Ref Column
                        , drRefs.GetString(6) //Unique Table
                        , drRefs.GetString(7) //Unique Column
                        );

                    
                }

                //drRefs.Read();
            }


            strJoins += strAddJoins;
            #endregion

            string sTableAlias;
            sTableAlias = tcList[0].TableName + "_" + Extensions.HashFNV1a_64_ABS(tcList[0].TableAlias).ToString();

            #region AddColumns
            //strColumnList = string.Format("\n\t[{0}].[{1}] AS [{2}]", tcList[0].TableName, tcList[0].ColumnName, tcList[0].Alias);
            strColumnList = string.Format("\n\t[{0}].[{1}] AS [{2}]", sTableAlias, tcList[0].ColumnName, tcList[0].Alias);
            #region Column Properties
            strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                , "SrcSchema"
                , pDimSchema
                , this.sSchema
                , pDimName
                , tcList[0].Alias
                );

            strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                    , "SrcTable"
                    , tcList[0].TableName
                    , this.sSchema
                    , pDimName
                    , tcList[0].Alias
                    );

            strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                    , "SrcColumn"
                    , tcList[0].ColumnName
                    , this.sSchema
                    , pDimName
                    , tcList[0].Alias
                    );
            #endregion

            for(int iLoop =1; iLoop < tcList.Count; iLoop++) 
            {
                //strColumnList += string.Format("\n\t,[{0}].[{1}] AS [{2}]", tcList[iLoop].TableName, tcList[iLoop].ColumnName, tcList[iLoop].Alias);
                //Substringing to left 128
                string sAlias;
                if (tcList[iLoop].Alias.Length > 128)
                {
 
                    sAlias = tcList[iLoop].Alias.Substring(0,127);
                } else {
                    sAlias = tcList[iLoop].Alias;
                }

                sTableAlias = tcList[iLoop].TableName + "_" + Extensions.HashFNV1a_64_ABS(tcList[iLoop].TableAlias).ToString();

                if (pCoalesceFields)
                {
                    if (tcList[iLoop].lstDuplicatedTableColumns.Count == 0)
                    {
                        strColumnList += string.Format("\n\t,[{0}].[{1}] AS [{2}]", sTableAlias, tcList[iLoop].ColumnName, sAlias);
                    }
                    else
                    {
                        string sAddColumns = "";
                        foreach (TableColumn TCInner in tcList[iLoop].lstDuplicatedTableColumns)
                        {

                            sAddColumns += string.Format(", [{0}].[{1}]",
                                TCInner.TableName + "_" + Extensions.HashFNV1a_64_ABS(TCInner.TableAlias).ToString()
                                , TCInner.ColumnName
                                );
                        }
                        strColumnList += string.Format("\n\t,COALESCE([{0}].[{1}] {2} ) AS [{3}]", sTableAlias, tcList[iLoop].ColumnName, sAddColumns, sAlias);
                    
                    }
                }
                else
                {
                    strColumnList += string.Format("\n\t,[{0}].[{1}] AS [{2}]", sTableAlias, tcList[iLoop].ColumnName, sAlias);
                }

                #region Column Properties
                strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                    , "SrcSchema"
                    , pDimSchema
                    , this.sSchema
                    , pDimName
                    , tcList[iLoop].Alias
                    );

                strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                        , "SrcTable"
                        , tcList[iLoop].TableName
                        , this.sSchema
                        , pDimName
                        , tcList[iLoop].Alias
                        );

                strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                        , "SrcColumn"
                        , tcList[iLoop].ColumnName
                        , this.sSchema
                        , pDimName
                        , tcList[iLoop].Alias
                        );
                strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                        , "HierarchyLevel"
                        , tcList[iLoop].HierarchyLevel
                        , this.sSchema
                        , pDimName
                        , tcList[iLoop].Alias
                        );
                #endregion

            }
            #endregion
            //For use in table aliasing
            sTableAlias = tcList[0].TableName + "_" + Extensions.HashFNV1a_64_ABS(tcList[0].TableAlias).ToString();

            //Close up
            //strJoins += strChildJoins;
            strJoins += strAddJoins;
            drRefs.Close();
            srcDimConn.Close();
            ///TODO: Check that assuming the first column is always part of the main table is correct
            /*strCreate = string.Format(QC.qryCreateDimView,
                this.sSchema
                , pDimName
                , strColumnList
                , pDimSchema
                , strJoins
                , pDimFilter
                );
*/
            strCreate = string.Format(QC.qryCreateDimViewAliased,
                this.sSchema
                , pDimName
                , strColumnList
                , pDimSchema
                , sTableAlias
                , strJoins
                , pDimFilter
                );
            SqlConnection srcPropConn = new SqlConnection(this.srcDBConn);
            srcPropConn.Open();

            SqlCommand commProp = new SqlCommand(string.Format(QC.qryGetExtendedProperties, pDimName, pFieldExcl), srcPropConn);
            SqlDataReader drProps;

            drProps = commProp.ExecuteReader();
            while (drProps.Read())
            {
                #region Extended Properties
                //Could be missing due to an exclusion property
                if (tcList.Exists(item => item.TableName == pDimName
                    && item.ColumnName == drProps.GetString(2)))
                {
                    string sAlias = tcList.Find(item => item.TableName == pDimName
                        && item.ColumnName == drProps.GetString(2)).Alias;

                    strExProps += @"
    GO    
" + string.Format(QC.qryAddExtendedProperty
                        , drProps.GetString(0)
                        , drProps.GetString(1)
                        , this.sSchema
                        , pDimName
                        , sAlias
                        );
                }
                #endregion
            }
            drProps.Close();


            strCreate += strExProps;

            strCreate += strColumnProps;
            return strCreate ;
        }


        public void AddDimensionFields(string pDimSchema, string pDimTable,string pDimAlias,  string pDimFilter, string pFieldExcl, ref List<TableColumn> tcList, ref string strJoins, ref string strExProps, string pRootDimName, int pHierarchyLevel = 1)
        {
            if (backWorker != null)
            {
                backWorker.ReportProgress(0, new ProgressReport(string.Format("Building dimension {0}.{1} at level ", pDimSchema, pDimTable, pHierarchyLevel)));
            }
            

            #region Cols
            SqlCommand comm;
            SqlDataReader drRefs;

            //Build field list
            //We are currently using multiple connections instead of pooling as data readers need their own connecton
            //Must replace with data tables
            /*SqlConnection srcDimConn = new SqlConnection(this.srcDBConn);
            srcDimConn.Open();
            */
            if (srcDimConn == null)
            {
                srcDimConn = new SqlConnection(this.srcDBConn);
                
            }

            if (srcDimConn.State == System.Data.ConnectionState.Closed)
            {
                srcDimConn.Open();
            }
            comm = srcDimConn.CreateCommand();
            comm.CommandText = string.Format(QC.qryDimColumns, pDimTable, this.sDimTablePrefix, pFieldExcl, pDimSchema, this.sDimTablePrefix, "OLAP");

            #region refs
            //drRefs = comm.ExecuteReader();
            SqlDataAdapter da = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                //while (drRefs.Read())
                foreach(DataRow dr in dt.Rows)
                {
                    var Zero = dr[0].ToString();
                    var One = dr[1].ToString();
                    var Two = dr[2].ToString();
                    string sColumn = dr[0].ToString();
                    string sNewTable = dr[2].ToString();
                    string sAlias = dr[1].ToString();
                    if (!(tcList.Exists(item => item.ColumnName == sColumn
                            && item.TableName == sNewTable
                        )))
                    {
                        if (!tcList.Exists(item => item.ColumnName == sAlias))
                        {
                            TableColumn TC = new TableColumn(pDimTable, sColumn, sAlias, pHierarchyLevel);
                            TC.TableAlias = pDimAlias;
                            tcList.Add(TC);
                        }
                        else
                        {
                            
                            //Adding to the list of columns we may want to coalesce in the view
                            if (!(tcList.Exists(item => item.ColumnName ==sColumn
                            && item.TableName == sNewTable
                            && item.TableAlias == pDimAlias
                            )))
                            {
                                TableColumn TC = new TableColumn(pDimTable,sColumn, sAlias, pHierarchyLevel);
                                TC.TableAlias = pDimAlias;

                                tcList.Find(item => item.ColumnName ==sColumn )
                                .lstDuplicatedTableColumns.Add(TC);

                                if (tcList.Exists(item => item.ColumnName == sColumn))
                                {
                                    //Here solely because watches can;t read lambas

                                    var x = tcList.Find(item => item.ColumnName == sColumn).lstDuplicatedTableColumns;
                                }
                            }
                        }
                    }
                    else
                    {
                        //Adding to the list of columns we may want to coalesce in the view
                        if (!(tcList.Exists(item => item.ColumnName == dr[0].ToString()
                            && item.TableName == dr[2].ToString()
                            && item.TableAlias == pDimAlias
                        )))
                        {
                            TableColumn TC = new TableColumn(pDimTable, dr[0].ToString(), dr[1].ToString(), pHierarchyLevel);
                            TC.TableAlias = pDimAlias;

                            tcList.Find(item => item.ColumnName == dr[0].ToString()
                            && item.TableName == dr[2].ToString())
                            .lstDuplicatedTableColumns.Add(TC);
                        }
                    }
                    //strColumnList += string.Format("\n\t,{0}", dr[0));
                    //drRefs.Read();
                }

            }
            #endregion

            //drRefs.Close();
            
            #endregion

            #region refs
            if (pHierarchyLevel <= this.intMaxRecursion && pDimTable != pRootDimName)
            {
                //Build related tables 
                comm = srcDimConn.CreateCommand();
                if (sTableExcl != "")
                {
                    comm.CommandText = string.Format(QC.qryReferenceQueryExcl, pDimSchema, pDimTable, sTableExcl, "''", "OLAP");
                }
                else
                {
                    comm.CommandText = string.Format(QC.qryReferenceQuery, pDimSchema, pDimTable, "OLAP");
                }

                da = new SqlDataAdapter(comm);
                dt = new DataTable();
                da.Fill(dt);
                //drRefs = comm.ExecuteReader();
                //drRefs.Read();
                string sColumnName = "";
                string sDimTable = "";
                string sDimSchema = "";
                string sJoinTable = "";
                string sJoinSchema = "";
                string strChildJoins = "";
                string strAddJoins = "";
                string sJoinAlias = "";
                string sJoinAliasHash = "";
                string sConstraintSchema = "";
                string sConstraintName = "";
                string sSourceAlias = "";
                string sAltColumn = "";

                //while (drRefs.Read())
                foreach (DataRow dr in dt.Rows)
                {

                    if (sDimSchema != dr[2].ToString() ||
                        sDimTable != dr[3].ToString() ||
                        sJoinSchema != dr[5].ToString() ||
                        sJoinTable != dr[6].ToString() ||
                        sConstraintSchema != dr[0].ToString() ||
                        sConstraintName != dr[1].ToString()
                        )
                    {
                        //strJoins += strChildJoins;
                        strChildJoins = "";
                        strJoins += strAddJoins;
                        strAddJoins = "";
                        sDimSchema = dr[2].ToString();
                        sDimTable = dr[3].ToString();
                        sColumnName = dr[4].ToString();
                        sJoinSchema = dr[5].ToString();
                        sJoinTable = dr[6].ToString();
                        sConstraintSchema = dr[0].ToString();
                        sConstraintName = dr[1].ToString();
                        sAltColumn = dr[7].ToString();

                        foreach (TableColumn TC in tcList.FindAll(item => item.TableName == sJoinTable
                            && item.ColumnName == sColumnName
                                ))
                        {

                            //Don't rename for root 
                            if (sJoinTable != pRootDimName && TC.TableAlias == sJoinTable)
                            {
                                tcList[tcList.FindIndex(item => item.ColumnName == TC.ColumnName
                                    && item.TableName == sJoinTable

                                    )].TableAlias = sJoinAlias;
                            }
                        }

                        sSourceAlias = tcList.First(item => item.TableName == dr[3].ToString()).TableAlias;

                        List<TableColumn> test = tcList.FindAll(item => item.TableName == dr[3].ToString());

                        //Prefixing with the source alias we're joining from, for queries that may go to the same table multiple times, e.g. Active
                        //sJoinAlias = sSourceAlias + "_" + sJoinTable + "_" + sColumnName;
                        ///TODO: Check that we're using the correct alias
                        sJoinAlias = pDimAlias + "_" + sJoinTable + "_" + sColumnName;

                        sJoinAliasHash = sJoinTable + "_" + Extensions.HashFNV1a_64_ABS(sJoinAlias).ToString();

                        /*if (pHierarchyLevel <= this.intMaxRecursion)
                        //{
                        */
                        //if (sJoinTable != pRootDimName && !sJoinAlias.Contains(sJoinTable)) { 
                        AddDimensionFields(sJoinSchema, sJoinTable, sJoinAlias, sDimFilter, pFieldExcl, ref tcList, ref strChildJoins, ref strExProps, pRootDimName, pHierarchyLevel + 1);
                        //}
                        //else
                        //{
                        //    var x = pHierarchyLevel;
                        //}

                        if (dr[8].ToString() == "YES")
                        {
                            strJoins += string.Format(QC.qryInterLeftJoins
                                , sJoinSchema
                                , /*drRefs.GetString(3)*/ /*sSourceAlias*/pDimTable + "_" + Extensions.HashFNV1a_64_ABS(pDimAlias).ToString()
                                , sColumnName
                                , sJoinTable
                                , sAltColumn
                                , sJoinAliasHash //Table Alias
                                , strChildJoins
                                );
                        }
                        else
                        {
                            strJoins += string.Format(QC.qryInterJoins
                                , sJoinSchema
                                , /*drRefs.GetString(3)*/ /*sSourceAlias*/pDimTable + "_" + Extensions.HashFNV1a_64_ABS(pDimAlias).ToString()
                                , sColumnName
                                , sJoinTable
                                , sAltColumn
                                , sJoinAliasHash //Table Alias
                                , strChildJoins
                                );
                        }

                    }
                    else
                    {
                        strAddJoins += string.Format(QC.qryJoinsAnd
                            , dr[3].ToString()
                            , dr[4].ToString()
                            , dr[6].ToString()
                            , dr[7].ToString()
                            );

                    }

                    //drRefs.Read();
                }
                //Close up
                //strJoins += strChildJoins;
                strJoins += strAddJoins;
                //drRefs.Close();
                srcDimConn.Close();
            } else
            {
                var x = pHierarchyLevel;
            }
            #endregion
            SqlConnection srcPropConn = new SqlConnection(this.srcDBConn);
            srcPropConn.Open();
            SqlCommand commProp = new SqlCommand(string.Format(QC.qryGetExtendedProperties, pDimTable, pFieldExcl), srcPropConn);
            SqlDataReader drProps;

            
            drProps = commProp.ExecuteReader();
            while (drProps.Read())
            {
                #region Extended Properties

                var tcItem = tcList.Find(item => item.TableName == pDimTable
                    && item.ColumnName == drProps.GetString(2));
                if (!(tcItem == null))
                {
                    string sAlias = tcItem.Alias;
                    strExProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                    , drProps.GetString(0)
                    , drProps.GetString(1)
                    , this.sSchema
                    , pRootDimName
                    , sAlias
                    );
                
                }
                else
                {
                }

                #endregion
            }
            drProps.Close();
            srcPropConn.Close();
            
        }

    }
}
