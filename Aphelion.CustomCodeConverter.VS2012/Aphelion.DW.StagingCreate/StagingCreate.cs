using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Sql;
using System.Data.SqlClient;
using Aphelion.DW.StagingCreate.Schema;
using Aphelion.DW.Shared;
using System.ComponentModel;

namespace Aphelion.DW.StagingCreate
{
    public class StagingCreate
    {

#region Properties

        public BackgroundWorker backWorker { get; set; }

        public Dictionary<string, SchemaTable> lstTS = new Dictionary<string, SchemaTable>();

        public string srcDBConn;
        public string sStageDB;
        public string sSchema;
        public string sFactTablePrefix;
        public string sDimTablePrefix;
        public string sFieldExcl;
        public string sTableExcl;
        public string sFactFilter;
        public string sDimFilter;
        SqlConnection srcConn;
        SqlConnection srcFactConn;
        SqlConnection srcDimConn;
        //SqlConnection destConn;
        public string strFullCreate;
        public string strFullResult;
        public bool bDropStage;
        public bool bInclKeys;
        public bool bInclRefKeys;
        public string strTableExcl;
        public string strSchemaExcl;
        public string strSrcKeyName = "SourceKey";
        public bool bPrefixWithSchema = false;
            



#endregion
       

        public StagingCreate(
            string pSrcDBConn,
            string pStageDB,
         string pSchema,
         string pFactTablePrefix,
        string pDimTablePrefix,
         string pFieldExcl
            ,string pSrcKey
            , bool pDropStage
                )
        {
             srcDBConn = pSrcDBConn;
             sStageDB = pStageDB;
             sSchema = pSchema;
             sFactTablePrefix = pFactTablePrefix;
             sDimTablePrefix = pDimTablePrefix;
             sFieldExcl = pFieldExcl;
             bDropStage = pDropStage;
            bInclKeys = true;
            bInclRefKeys = false;
            strTableExcl = "";
            strSchemaExcl = "";
            strSrcKeyName = pSrcKey;
        
             }


        public StagingCreate(
            string pSrcDBConn,
            string pStageDB,
         string pSchema,
         string pFactTablePrefix,
        string pDimTablePrefix,
         string pFieldExcl
            , bool pDropStage
            , bool pInclKeys
            , bool pInclRefKeys
            , string pTableExcl
            , string pSchemaExcl
             , string pSrcKey
           
                )
        {
            srcDBConn = pSrcDBConn;
            sStageDB = pStageDB;
            sSchema = pSchema;
            sFactTablePrefix = pFactTablePrefix;
            sDimTablePrefix = pDimTablePrefix;
            sFieldExcl = pFieldExcl;
            bDropStage = pDropStage;
            bInclKeys = pInclKeys;
            bInclRefKeys = pInclRefKeys;
            strTableExcl = pTableExcl;
            strSchemaExcl = pSchemaExcl;
            strSrcKeyName = pSrcKey;
        
        
        }

        public void RunScript()
        {
            string[] strCommands = this.strFullCreate.Split(new string[] { "GO" }, StringSplitOptions.None);
            if (backWorker != null)
            {
                backWorker.ReportProgress(0, new ProgressReport(string.Format("Running {0} scripts", strCommands.Length.ToString())));
            }
            int iLoop = 0;
            string sErr = "";
            SqlCommand comm = new SqlCommand(this.strFullCreate, this.srcConn);
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
            this.strFullResult = sErr + "\n\n\n" + this.strFullCreate;

        }
        public void CreateScript()
        {
            if (backWorker != null)
            {
                backWorker.ReportProgress(0, new ProgressReport(string.Format("Creating scripts")));
            }
            this.strFullResult = "";
            srcConn = new SqlConnection(this.srcDBConn);
            srcConn.Open();
            srcFactConn = new SqlConnection(this.srcDBConn);
            srcFactConn.Open();
            srcDimConn = new SqlConnection(this.srcDBConn);
            srcDimConn.Open();
            
            
            SqlCommand command = srcConn.CreateCommand();

            if (this.strTableExcl == "") this.strTableExcl = "''";
            if (this.strSchemaExcl == "") this.strSchemaExcl = "''";

            if (this.sFactTablePrefix == "" )
            {
                command.CommandText = string.Format(QC.qryTableQueryExclSchema_EP, this.strTableExcl, this.strSchemaExcl, "Staging");
                /*command.CommandText = @"SELECT table_schema, table_name FROM 
information_schema.tables
WHERE table_name = 'FactFinancialTransaction'
AND Table_type = 'BASE TABLE' 
ORDER BY table_schema, table_name";*/
            }
            else 
            {
                command.CommandText = string.Format(QC.qryTableQueryExclEP, this.sFactTablePrefix, "Staging");
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
                if (backWorker != null)
                {
                    backWorker.ReportProgress(0, new ProgressReport(string.Format("Building {0}.{1} ", sSchemaTable, sTableName)));
                }

                List<TableColumn> lstTC = new List<TableColumn>();
                sCreate = BuildTableCreate(sSchemaTable, sTableName, sFieldExcl, sFactFilter, sDimFilter, ref lstTC);
                lstTS.Add(sSchemaTable + "." + sTableName, new SchemaTable(sSchemaTable, sTableName, sCreate, lstTC));
            
                //drFacts.Read();

            }
            drFacts.Close();

            //If we ignore prefixes, we just need the fact build
            if (this.sFactTablePrefix != "" || this.sDimTablePrefix != "")
            {
                command.CommandText = string.Format(QC.qryTableQuery, this.sDimTablePrefix);

                SqlDataReader drDims = command.ExecuteReader();
                //drFacts.Read();
                while (drDims.Read())
                {
                    sSchemaTable = drDims.GetString(0);
                    sTableName = drDims.GetString(1);
                    List<TableColumn> lstTC = new List<TableColumn>();
                    if (!lstTS.Any(item => item.Key == sSchemaTable + "." + sTableName))
                    {
                        sCreate = BuildTableCreate(sSchemaTable, sTableName, sFieldExcl, sFactFilter, sDimFilter, ref lstTC);
                        lstTS.Add(sSchemaTable + "." + sTableName, new SchemaTable(sSchemaTable, sTableName, sCreate, lstTC));
                    }
                }
                drDims.Close();
            }
            this.strFullCreate = "";
            if (this.bDropStage)
            {
                this.strFullCreate += string.Format(QC.qryDropDB, this.sStageDB);    
            }
            this.strFullCreate += string.Format(QC.qryCreateDB, this.sStageDB);

            this.strFullCreate += string.Format(QC.qryUse, this.sStageDB);

            this.strFullCreate += string.Format(QC.qryCreateSchema, this.sSchema);

            foreach( KeyValuePair<string, SchemaTable> st in lstTS)
            {
                if (st.Value.lstTC != null &&  st.Value.lstTC.Count > 0)
                {
                    this.strFullCreate += st.Value.CreateStatement;
                }
            }

        }

        public string OutputScript()
        {
            this.strFullResult = this.strFullCreate;
            return this.strFullCreate;
        }

        public string BuildTableCreate(string pSchemaTable, string pTableName, string pFieldExcl, string pFactFilter, string pDimFilter, ref List<TableColumn> lstTC)
        {
            string strCreate;
            SqlCommand comm;
            SqlDataReader drRefs;
            //Build field list
            string strColumnList = "";
            comm = new SqlCommand(string.Format(QC.qryListColumns, pTableName, pSchemaTable, pFieldExcl, "BASE TABLE", "Staging"), srcFactConn);
            drRefs = comm.ExecuteReader();
            while (drRefs.Read())
            {
                if (drRefs.GetBoolean(11) != true)
                {

                    SC.AddTC(pTableName, ref lstTC, drRefs);
                }
            }
            drRefs.Close();

            #region Remove Keys
            if (!bInclKeys)
            {
                SqlCommand comm2 = new SqlCommand(string.Format(QC.qryPrimaryColumns, pSchemaTable, pTableName), srcDimConn);
                SqlDataReader drKeys = comm2.ExecuteReader();
                while (drKeys.Read())
                {
                    lstTC.RemoveAll(item =>
                    item.TableName == drKeys.GetString(1) //Table name
                                && item.ColumnName == drKeys.GetString(2)); //column name

                }
                drKeys.Close();

            }
            //Otherwise make them nullable to allow for inserts
            else
            {

                SqlCommand comm2 = new SqlCommand(string.Format(QC.qryPrimaryColumns, pSchemaTable, pTableName), srcDimConn);
                SqlDataReader drKeys = comm2.ExecuteReader();
                while (drKeys.Read())
                {
                    if (!lstTC.Exists(item =>
                    item.TableName == drKeys.GetString(1) //Table name
                                && item.ColumnName == drKeys.GetString(2))
                                )
                    {
                        //We removed the primary key due to a self-referencing relationship perhaps
                        lstTC.Add(new TableColumn(drKeys.GetString(1), drKeys.GetString(2)));
                    }

                    lstTC.Find(item =>
                    item.TableName == drKeys.GetString(1) //Table name
                                && item.ColumnName == drKeys.GetString(2))
                                .Nullable = "NULL"
                                ; //column name

                }
                drKeys.Close();
            }
            #endregion


            //Build related tables 
            #region Related tables
            if (backWorker != null)
            {
                backWorker.ReportProgress(0, new ProgressReport(string.Format("Building related tables for {0} ", pTableName)));
            }

            if (this.sFactTablePrefix == "")
            {
                comm = new SqlCommand(string.Format(QC.qryReferenceQueryExclWithKeyCol, pSchemaTable, pTableName, this.strTableExcl, this.strSchemaExcl,  this.strSrcKeyName), srcFactConn);
            
            }
            else
            {
               
                comm = new SqlCommand(string.Format(QC.qryReferenceQueryWithKeyCol, pSchemaTable, pTableName, this.strSrcKeyName), srcFactConn);
            }
            drRefs = comm.ExecuteReader();
            //drRefs.Read();
            string sDimTable = "";
            string sDimSchema = "";
            string sColumnName = "";
            string sDimColumnName = "";
            string sIsNullable = "";
            string sDataType = "";
            string sCharacterLength = "";
            while (drRefs.Read())
            {
                string sTableDel = drRefs.GetString(6);
                //Remove referential columns from list of columns
                if (!bInclRefKeys)
                {
                    lstTC.RemoveAll(item =>
                        item.TableName == drRefs.GetString(3)
                                    && item.ColumnName == drRefs.GetString(4));
                }

                //Remove primary keys from generated tables
                /*
                 * //Moving this to outside the ref loop - basically, each table should have it's primary keys removed, not just ref tables
                 * if (!bInclKeys)
                {
                    SqlCommand comm2 = new SqlCommand(string.Format(QC.qryPrimaryColumns, drRefs.GetString(2), drRefs.GetString(3)), srcDimConn);
                    SqlDataReader drKeys = comm2.ExecuteReader();
                    while (drKeys.Read())
                    {
                        lstTC.RemoveAll(item =>
                        item.TableName == drKeys.GetString(1) //Table name
                                    && item.ColumnName == drKeys.GetString(2)); //column name
                
                    }
                    drKeys.Close();
            
                }
                    //Otherwise make them nullable to allow for inserts
                else
                {
                    
                    SqlCommand comm2 = new SqlCommand(string.Format(QC.qryPrimaryColumns, drRefs.GetString(2), drRefs.GetString(3)), srcDimConn);
                    SqlDataReader drKeys = comm2.ExecuteReader();
                    while (drKeys.Read())
                    {
                        if (!lstTC.Exists(item =>
                        item.TableName == drKeys.GetString(1) //Table name
                                    && item.ColumnName == drKeys.GetString(2))
                                    )
                        {
                            //We removed the primary key due to a self-referencing relationship perhaps
                            lstTC.Add(new TableColumn(drKeys.GetString(1), drKeys.GetString(2)));
                        }

                        lstTC.Find(item =>
                        item.TableName == drKeys.GetString(1) //Table name
                                    && item.ColumnName == drKeys.GetString(2))
                                    .Nullable = "NULL"
                                    ; //column name

                    }
                    drKeys.Close();
                }
                 * */


                if (sDimTable != drRefs.GetString(6) ||
                    sDimSchema != drRefs.GetString(5) ||
                    sColumnName != drRefs.GetString(4))
                {

                    sDimTable = drRefs.GetString(6);
                    sDimSchema = drRefs.GetString(5);
                    sDimColumnName = drRefs.GetString(7);
                    sColumnName = drRefs.GetString(4);
                    sIsNullable = drRefs.GetString(8);
                    sDataType = drRefs.GetString(10);
                    sCharacterLength = drRefs.GetSqlInt32(11).ToString();

                    if (lstTC.Exists(item => item.ColumnName == sColumnName))
                    {
                        lstTC.Remove(lstTC.Find(item => item.ColumnName == sColumnName));

                    }

                    

                    string sStageColumnName;
                    if (sDimColumnName.Length == sColumnName.Length)
                    {
                        sStageColumnName = sDimTable.Replace(this.sDimTablePrefix, "", StringComparison.CurrentCultureIgnoreCase) + this.strSrcKeyName;
                    }
                    else
                    {
                        string sPrefix;
                        string sSuffix;
                        if (sColumnName.Length < sDimColumnName.Length)
                        {
                            this.strFullResult += string.Format("/*\nFact Table field related to dimension table field doesn't contain DimFieldName:\n {0} in table {1} \nrelated to {2} in table {3}\n*\\n", sColumnName, pTableName, sDimColumnName, sDimTable);
                            sStageColumnName = Extensions.ColumnNameFix(sColumnName,sDimColumnName, sDimTable, this.strSrcKeyName, out sPrefix, out sSuffix);
                        }
                        else
                        {
                            sStageColumnName = Extensions.ColumnNameFix(sDimColumnName, sColumnName, sDimTable, this.strSrcKeyName, out sPrefix, out sSuffix);
                        }
                    }
                    //lstTC.Add(new TableColumn(pTableName, sDimTable.Replace(this.sDimTablePrefix, "", StringComparison.CurrentCultureIgnoreCase) + "SourceKey", "NO", "varchar", "255"));
                    //lstTC.Add(new TableColumn(pTableName, sDimTable.Replace(this.sDimTablePrefix, "", StringComparison.CurrentCultureIgnoreCase) + this.strSrcKeyName, sIsNullable, "varchar", "255"));
                    lstTC.Add(new TableColumn(pTableName, sStageColumnName, sIsNullable, sDataType, sCharacterLength));
                    /*if (!lstTS.ContainsKey(sDimSchema + "." + sDimTable))
                    {
                        lstTS.Add(sDimSchema + "." + sDimTable
                            , new SchemaTable(
                                sDimSchema
                                , sDimTable

                                , BuildDimensionTableCreate(sDimSchema, sDimTable, pFieldExcl, pDimFilter)));
                    }*/

                }
               

                //drRefs.Read();
            }

            drRefs.Close();
            #endregion
            strColumnList = SC.AddColumn(lstTC, 0);
            for (int iLoop = 1; iLoop < lstTC.Count; iLoop++)
            {
                strColumnList += "\n\t," + SC.AddColumn(lstTC, iLoop);
            }

            #region Additional database wide columns
            //Get all columns, staging or stage
            comm = new SqlCommand(string.Format(QC.qryAdditionalColumnDefinitions, "Stag"), srcFactConn);
            drRefs = comm.ExecuteReader();
            while (drRefs.Read())
            {
                strColumnList += "\n\t," + drRefs.GetString(1);
            }
            drRefs.Close();
            #endregion
            


            if (this.bPrefixWithSchema) {
                strCreate = string.Format(QC.qryCreateStageTable,
                    this.sSchema
                    , pSchemaTable + "_" + pTableName
                    , strColumnList
                    );
            
            }
            else
            {
                strCreate = string.Format(QC.qryCreateStageTable,
                    this.sSchema
                    , pTableName
                    , strColumnList
                    );
            }
            

            return strCreate;

        }
        /*
        private static string AddColumn(List<TableColumn> lstTC, int iLoop)
        {
            if (iLoop >= lstTC.Count)
            {
                return "";
            }
            string strColumnList = "";
            switch (lstTC[iLoop].DataType)
            {
                case "datetime":
                case "datetime2":
                case "date":
                    strColumnList = string.Format("\n\t[{0}] {1} {2}", lstTC[iLoop].ColumnName, lstTC[iLoop].DataType, lstTC[iLoop].Nullable);
                    
                    break;
                case "char":
                case "nchar":
                case "varchar":
                case "nvarchar":
                    strColumnList = string.Format("\n\t[{0}] {1}({2}) {3}", lstTC[iLoop].ColumnName, lstTC[iLoop].DataType, lstTC[iLoop].CharacterLength, lstTC[iLoop].Nullable);
                    break;
                case "decimal":
                case "numeric":
                    strColumnList = string.Format("\n\t[{0}] {1}({2},{3}) {4}", lstTC[iLoop].ColumnName, lstTC[iLoop].DataType, lstTC[iLoop].NumericPrecision, lstTC[iLoop].NumericScale, lstTC[iLoop].Nullable);

                    break;


                case "tinyint":
                case "int":
                case "smallint":
                case "bigint":
                case "money":
                case "float":
                
                    strColumnList = string.Format("\n\t[{0}] {1} {2}", lstTC[iLoop].ColumnName, lstTC[iLoop].DataType, lstTC[iLoop].Nullable);

                    break;

            }
            return strColumnList;
        }
        */
        /*private static void AddTC(string pTableName, ref List<TableColumn> lstTC, SqlDataReader drRefs)
        {
            string sIsNullable;
            if (drRefs.GetString(12) == "YES" || drRefs.GetString(1) == "YES")
            {
                sIsNullable = "YES";
            }
            else
            {
                sIsNullable = "NO";
            }
            switch (drRefs.GetString(2))
            {
                case "datetime":
                case "datetime2":
                case "date":
                    lstTC.Add(new TableColumn(pTableName
                            , drRefs.GetString(0)
                            , sIsNullable
                            , drRefs.GetString(2)
                            ));
                    break;
                    ///TODO:Test dates
                case "char":
                case "nchar":
                case "varchar":
                case "nvarchar":

                    lstTC.Add(new TableColumn(pTableName
                            , drRefs.GetString(0)
                            , sIsNullable
                            , drRefs.GetString(2)
                            , drRefs.GetString(3)
                            ));
                    break;
                case "int":
                case "decimal":
                case "tinyint":
                case "smallint":
                case "bigint":
                case "money":
                case "numeric":

                    lstTC.Add(new TableColumn(pTableName
                            , drRefs.GetString(0)
                            , sIsNullable
                            , drRefs.GetString(2)
                            , drRefs.GetString(4)
                            , drRefs.GetString(5)
                            , drRefs.GetString(6)
                            ));
                    break;
                case "float":
                    lstTC.Add(new TableColumn(pTableName
                            , drRefs.GetString(0)
                            , sIsNullable
                            , drRefs.GetString(2)
                            , drRefs.GetString(4)
                            , drRefs.GetString(5)
                            , "0"
                            ));
                    break;
            }
        }*/
        public string BuildDimensionTableCreate(string pDimSchema, string pDimName, string pFieldExcl, string pDimFilter)
        {
            return "";
        }

    }
}
