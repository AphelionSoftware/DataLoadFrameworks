using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;
using Aphelion.DW.StagingCreate.Schema;
using Aphelion.DW.Shared;

namespace Aphelion.DW.StagingCreate
{
    public class OLAPStarCreate
    {
        
        #region Properties

        public Dictionary<string, SchemaTable> lstTS = new Dictionary<string, SchemaTable>();

        public string srcDBConn;
        public string destDBConn;
        public string sSchema;
        public string sFactTablePrefix;
        public string sDimTablePrefix;
        public string sFieldExcl;
        public string sTableExcl;
        public string sFactFilter;
        public string sDimFilter;
        SqlConnection srcConn;
        SqlConnection srcFactConn;
        //SqlConnection srcDimConn;
        SqlConnection destConn;
        public string strFullCreate;

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
            string pDimFilter
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
        }

        public void RunScript()
        {
            string[] strCommands = this.strFullCreate.Split( new string[] {"GO"}, StringSplitOptions.None);
            SqlCommand comm = new SqlCommand(this.strFullCreate, this.destConn);
            foreach (string strComm in strCommands)
            {

                comm.CommandText = strComm;
                comm.ExecuteNonQuery();
            }
        }

        public string OutputScript()
        {
            this.strFullCreate = string.Format(QC.qryCreateSchema, this.sSchema);

            foreach (KeyValuePair<string, SchemaTable> kv in lstTS)
            {
                this.strFullCreate +=
                    kv.Value.CreateStatement;
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
            command.CommandText = string.Format(QC.qryTableQuery, this.sFactTablePrefix);

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
        }

        public string BuildFactTableCreate(string pSchemaTable, string pTableName, string pFieldExcl, string pFactFilter, string pDimFilter)
        {
            string strCreate;
            //List<TableColumn> tcLst = new List<TableColumn>();
            SqlCommand comm ;
            SqlDataReader drRefs ;
            string strColumnProps = "";
            //Build field list
            string strColumnList = "";
            comm = new SqlCommand(string.Format(QC.qryListColumns, pTableName, pSchemaTable, pFieldExcl), srcFactConn);
            drRefs = comm.ExecuteReader();
            drRefs.Read();
            strColumnList = string.Format("\n\t[{0}]", drRefs.GetString(0));
            //////drRefs.Read();
            while (drRefs.Read())
            {
                strColumnList += string.Format("\n\t,[{0}]", drRefs.GetString(0));
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
            strCreate = string.Format(QC.qryCreateFactView,
                this.sSchema
                , pTableName
                , strColumnList
                , pSchemaTable
                , pFactFilter
                );
            drRefs.Close();

            //Build related tables 
            comm = new SqlCommand(string.Format(QC.qryReferenceQuery, pSchemaTable, pTableName), srcFactConn);
            drRefs = comm.ExecuteReader();
            
            //drRefs.Read();
            string sDimTable = "";
            string sDimSchema = "";
            while (drRefs.Read())
            {
                if (drRefs.GetString(6).Contains("Driver"))
                {
                }
                #region References
                if (sDimTable != drRefs.GetString(6) || 
                    sDimSchema != drRefs.GetString(5)) {
                    
                    sDimTable = drRefs.GetString(6);
                    sDimSchema = drRefs.GetString(5);


                    if (!lstTS.ContainsKey(sDimSchema + "." + sDimTable))
                    {
                        lstTS.Add(sDimSchema + "." + sDimTable
                            , new SchemaTable(
                                sDimSchema
                                , sDimTable

                                , BuildDimensionTableCreate(sDimSchema, sDimTable, pFieldExcl, pDimFilter)));
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
                strCreate += @"
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

            strCreate += strColumnProps;    

            return strCreate;

        }

        public string BuildDimensionTableCreate(string pDimSchema, string pDimName, string pFieldExcl, string pDimFilter)
        {
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
            comm.CommandText = string.Format(QC.qryDimColumns, pDimName, this.sDimTablePrefix, pFieldExcl, pDimSchema, this.sDimTablePrefix);
            drRefs = comm.ExecuteReader();
            //drRefs.Read();

            //strColumnList = string.Format("\n\t{0}", drRefs.GetString(0));

            //drRefs.Read();
            while (drRefs.Read())
            {
                if (!tcList.Exists(item => item.TableName == pDimName && item.ColumnName == drRefs.GetString(0)))
                {
                    tcList.Add(new TableColumn(pDimName, drRefs.GetString(0), drRefs.GetString(1)));
                }
                //strColumnList += string.Format("\n\t,{0}", drRefs.GetString(0));
                //drRefs.Read();
            }

            drRefs.Close();
            //Build related tables 
            #region Related Tables
            comm = srcDimConn.CreateCommand();
            comm.CommandText = string.Format(QC.qryReferenceQuery, pDimSchema, pDimName);
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
            string sSourceAlias = "";
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
                    strJoins += strChildJoins;
                    strChildJoins = "";
                    strJoins += strAddJoins;
                    strAddJoins = "";
                    sDimSchema = drRefs.GetString(2);
                    sDimTable = drRefs.GetString(3);
                    sColumnName = drRefs.GetString(4);
                    
                    sJoinSchema = drRefs.GetString(5);
                    sJoinTable = drRefs.GetString(6);
                    sConstraintSchema = drRefs.GetString(0);
                    sConstraintName = drRefs.GetString(1);
                    sJoinAlias = sJoinTable + "_" + sColumnName;

                    foreach (TableColumn TC in tcList.FindAll(item => item.TableName == sJoinTable
                            && item.ColumnName == sColumnName
                            ))
                    {
                        tcList[tcList.FindIndex(item => item.ColumnName == TC.ColumnName
                            && item.TableName == sJoinTable
                            )].TableAlias = sJoinAlias;
                    }

                    sSourceAlias = tcList.First(item => item.TableName == drRefs.GetString(3)).TableAlias;
                    
                    strJoins += string.Format(QC.qryJoins
                        , drRefs.GetString(2)
                        , /*drRefs.GetString(3)*/ sSourceAlias
                        , drRefs.GetString(4)
                        , drRefs.GetString(6)
                        , drRefs.GetString(7)
                        , sJoinAlias //Table Alias
                        );
                    
                    //AddDimensionFields(sJoinSchema, sJoinTable, sDimFilter, pFieldExcl, ref tcList, ref strChildJoins, ref strExProps, pDimName);
                    AddDimensionFields(sJoinSchema, sJoinTable, sJoinAlias,  sDimFilter, pFieldExcl, ref tcList, ref strChildJoins, ref strExProps, pDimName);
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
                        , sJoinAlias
                        , drRefs.GetString(4) //Ref Column
                        , drRefs.GetString(6) //Unique Table
                        , drRefs.GetString(7) //Unique Column
                        );

                    
                }

                //drRefs.Read();
            } 
            #endregion

            //strColumnList = string.Format("\n\t[{0}].[{1}] AS [{2}]", tcList[0].TableName, tcList[0].ColumnName, tcList[0].Alias);
            strColumnList = string.Format("\n\t[{0}].[{1}] AS [{2}]", tcList[0].TableAlias, tcList[0].ColumnName, tcList[0].Alias);
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
                strColumnList += string.Format("\n\t,[{0}].[{1}] AS [{2}]", tcList[iLoop].TableAlias, tcList[iLoop].ColumnName, tcList[iLoop].Alias);

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
                        , tcList[0].ColumnName
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
            //Close up
            strJoins += strChildJoins;
            strJoins += strAddJoins;
            drRefs.Close();
            srcDimConn.Close();
            strCreate = string.Format(QC.qryCreateDimView,
                this.sSchema
                , pDimName
                , strColumnList
                , pDimSchema
                , strJoins
                , pDimFilter
                );

            SqlConnection srcPropConn = new SqlConnection(this.srcDBConn);
            srcPropConn.Open();
            if (pDimName.Contains("Driver"))
            {
            }
            SqlCommand commProp = new SqlCommand(string.Format(QC.qryGetExtendedProperties, pDimName, pFieldExcl), srcPropConn);
            SqlDataReader drProps;

            drProps = commProp.ExecuteReader();
            while (drProps.Read())
            {
                #region Extended Properties
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
                #endregion
            }
            drProps.Close();


            strCreate += strExProps;

            strCreate += strColumnProps;
            return strCreate ;
        }


        public void AddDimensionFields(string pDimSchema, string pDimTable,string pDimAlias,  string pDimFilter, string pFieldExcl, ref List<TableColumn> tcList, ref string strJoins, ref string strExProps, string pRootDimName, int pHierarchyLevel = 1)
        {

            if (pDimTable.Contains("Excl"))
            {
            }
            #region Cols
            SqlCommand comm;
            SqlDataReader drRefs;

            //Build field list
            SqlConnection srcDimConn = new SqlConnection(this.srcDBConn);
            
            srcDimConn.Open();
            comm = srcDimConn.CreateCommand();
            comm.CommandText = string.Format(QC.qryDimColumns, pDimTable, this.sDimTablePrefix, pFieldExcl, pDimSchema, this.sDimTablePrefix);
            if (pDimTable.Contains("Region"))
            {
            }
            drRefs = comm.ExecuteReader();
            if (drRefs.HasRows)
            {
                while (drRefs.Read())
                {
                    if(!(tcList.Exists(item => item.ColumnName == drRefs.GetString(0)
                            && item.TableName == drRefs.GetString(2)
                        )))
                    {
                        if (!tcList.Exists(item => item.ColumnName == drRefs.GetString(1)))
                        {
                            TableColumn TC = new TableColumn(pDimTable, drRefs.GetString(0), drRefs.GetString(1), pHierarchyLevel);
                            TC.TableAlias = pDimAlias;
                            tcList.Add(TC);
                        }
                    }
                    //strColumnList += string.Format("\n\t,{0}", drRefs.GetString(0));
                    //drRefs.Read();
                }

            }

            drRefs.Close();
            
            #endregion

            #region refs
            //Build related tables 
            comm = srcDimConn.CreateCommand();

            comm.CommandText = string.Format(QC.qryReferenceQuery, pDimSchema, pDimTable);
            drRefs = comm.ExecuteReader();
            //drRefs.Read();
            string sColumnName = "";
            string sDimTable = "";
            string sDimSchema = "";
            string sJoinTable = "";
            string sJoinSchema = "";
            string strChildJoins = "";
            string strAddJoins = "";
            string sJoinAlias = "";
            string sConstraintSchema = "";
            string sConstraintName = "";
            string sSourceAlias = "";

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
                    strJoins += strChildJoins;
                    strChildJoins = "";
                    strJoins += strAddJoins;
                    strAddJoins = "";
                    sDimSchema = drRefs.GetString(2);
                    sDimTable = drRefs.GetString(3);
                    sColumnName = drRefs.GetString(4);
                    sJoinSchema = drRefs.GetString(5);
                    sJoinTable = drRefs.GetString(6);
                    sConstraintSchema = drRefs.GetString(0);
                    sConstraintName = drRefs.GetString(1);
                    sJoinAlias = sJoinTable + "_" + sColumnName;

                    foreach (TableColumn TC in tcList.FindAll(item => item.TableName == sJoinTable
                        && item.ColumnName == sColumnName
                            ))
                    {
                        tcList[tcList.FindIndex(item => item.ColumnName == TC.ColumnName
                            && item.TableName == sJoinTable
                            )].TableAlias = sJoinAlias;
                    }

                    sSourceAlias = tcList.First(item => item.TableName == drRefs.GetString(3)).TableAlias;
                    strJoins += string.Format(QC.qryJoins
                        , drRefs.GetString(2)
                        , /*drRefs.GetString(3)*/ sSourceAlias
                        , drRefs.GetString(4)
                        , drRefs.GetString(6)
                        , drRefs.GetString(7)
                        , sJoinAlias //Table Alias
);

                    //AddDimensionFields(sJoinSchema, sJoinTable, sDimFilter, pFieldExcl, ref tcList, ref strChildJoins, ref strExProps, pRootDimName, pHierarchyLevel + 1);
                    AddDimensionFields(sJoinSchema, sJoinTable, sJoinAlias, sDimFilter, pFieldExcl, ref tcList, ref strChildJoins, ref strExProps, pRootDimName, pHierarchyLevel + 1);
                }
                else
                {
                    strAddJoins += string.Format(QC.qryJoinsAnd
                        , drRefs.GetString(3)
                        , drRefs.GetString(4)
                        , drRefs.GetString(6)
                        , drRefs.GetString(7)
                        );
                    
                }

                //drRefs.Read();
            }
            //Close up
            strJoins += strChildJoins;
            strJoins += strAddJoins;
            drRefs.Close();
            srcDimConn.Close();

            #endregion
            SqlConnection srcPropConn = new SqlConnection(this.srcDBConn);
            srcPropConn.Open();
            SqlCommand commProp = new SqlCommand(string.Format(QC.qryGetExtendedProperties, pDimTable, pFieldExcl), srcPropConn);
            SqlDataReader drProps;

            if (pDimTable.Contains("Manu"))
            {
            }

            drProps = commProp.ExecuteReader();
            while (drProps.Read())
            {
                #region Extended Properties
                string sAlias = tcList.Find(item => item.TableName == pDimTable
                    && item.ColumnName == drProps.GetString(2)).Alias;

                strExProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                    , drProps.GetString(0)
                    , drProps.GetString(1)
                    , this.sSchema
                    , pRootDimName
                    , sAlias
                    );
                #endregion
            }
            drProps.Close();
            srcPropConn.Close();
            
        }

    }
}
