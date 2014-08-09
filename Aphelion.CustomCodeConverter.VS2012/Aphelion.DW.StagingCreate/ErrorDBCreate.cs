using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Sql;
using System.Data.SqlClient;
using Aphelion.DW.StagingCreate.Schema;
using Aphelion.DW.Shared;

namespace Aphelion.DW.StagingCreate
{
    public class ErrorDBCreate
    {
        public Dictionary<string, SchemaTable> lstTS = new Dictionary<string, SchemaTable>();

        public string strStageConn;
        public string strTableConn;
        public string sErrorDB;
        public string sStageSchema;
        public string sErrorSchema;
        SqlConnection srcConn;
        SqlConnection srcStageConn;
        SqlConnection srcTableConn;
        //SqlConnection destConn;
        public string strFullCreate;
        public bool bDropError;
        public string strTableExcl;
        public string strSchemaExcl;



        public ErrorDBCreate(
            string pStageDBConn,
            string pTableDBConn,
            string pErrorDB,
         string pStageSchema,
         string pErrorSchema,
            bool pDropError
                )
        {
             strStageConn = pStageDBConn;
             strTableConn = pTableDBConn;
             sErrorDB = pErrorDB;
             sStageSchema = pStageSchema;
             sErrorSchema = pErrorSchema;
             bDropError = pDropError;
            
             }
        public void RunScript()
        {
            string[] strCommands = this.strFullCreate.Split(new string[] { "GO" }, StringSplitOptions.None);
            SqlCommand comm = new SqlCommand(this.strFullCreate, this.srcStageConn);
            foreach (string strComm in strCommands)
            {

                comm.CommandText = strComm;
                comm.ExecuteNonQuery();
            }
        }
        public void CreateScript()
        {
            srcConn = new SqlConnection(this.strStageConn);
            srcConn.Open();
            srcStageConn = new SqlConnection(this.strStageConn);
            srcStageConn.Open();
            srcTableConn = new SqlConnection(this.strTableConn);
            srcTableConn.Open();


            SqlCommand command = srcConn.CreateCommand();

            if (this.strTableExcl == "") this.strTableExcl = "''";
            if (this.strSchemaExcl == "") this.strSchemaExcl = "''";

            command.CommandText = string.Format(QC.qryTableQueryExcl, this.strTableExcl, this.strSchemaExcl);
            SqlDataReader drStaging = command.ExecuteReader();
            string sStageSchemaTable;
            string sTableName;
            string sCreate;

            while (drStaging.Read())
            {
                sStageSchemaTable = drStaging.GetString(0);
                sTableName = drStaging.GetString(1);
                List<TableColumn> lstTC = new List<TableColumn>();
                sCreate = BuildTableCreate(sStageSchemaTable, sTableName,  ref lstTC);
                lstTS.Add(sStageSchemaTable + "." + sTableName, new SchemaTable(sStageSchemaTable, sTableName, sCreate, lstTC));

            }
            drStaging.Close();


        }

        public string BuildTableCreate(string pSchemaTable, string pTableName,  ref List<TableColumn> lstTC)
        {
            string strCreate;
            SqlCommand comm;
            SqlDataReader drCols;
            //Build field list
            string strColumnList = "";

            lstTC.Add(new TableColumn(pTableName, "QueueID", "True", "int", ""));
            lstTC.Add(new TableColumn(pTableName, "ErrorCode", "True", "int", ""));
            lstTC.Add(new TableColumn(pTableName, "ErrorColumnID", "True", "int", ""));
            lstTC.Add(new TableColumn(pTableName, "PackageName", "True", "varchar", "255"));
            comm = new SqlCommand(string.Format(QC.qryListColumns, pTableName, "", ""), srcStageConn);
            drCols = comm.ExecuteReader();
            while (drCols.Read())
            {
                if (drCols.GetBoolean(11) != true)
                {
                    SC.AddTC(pTableName, ref lstTC, drCols);
                }
            }
            drCols.Close();

            SqlDataReader drRefs;
            //Reading all table regardless of schema, 
            comm = new SqlCommand(string.Format(QC.qryListColumns, pTableName, "", ""), srcTableConn);
            drRefs = comm.ExecuteReader();
            while (drRefs.Read())
            {
                if (drRefs.GetBoolean(11) != true)
                {
                    if (!lstTC.Exists(item => item.TableName == pTableName && item.ColumnName == drRefs.GetString(0)))
                    {
                        SC.AddTC(pTableName, ref lstTC, drRefs);
                    }
                }
            }
            drRefs.Close();

            strColumnList = SC.AddColumn(lstTC, 0);
            for (int iLoop = 1; iLoop < lstTC.Count; iLoop++)
            {
                strColumnList += "," + SC.AddColumn(lstTC, iLoop);
            }

            strCreate = string.Format(QC.qryCreateStageTable,
                this.sErrorSchema
                , pTableName
                , strColumnList
                );


            return strCreate;

        }

        public string OutputScript()
        {
            return this.strFullCreate;
        }

    }
}
