﻿using System;
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
    public class ErrorDBCreate
    {
        public Dictionary<string, SchemaTable> lstTS = new Dictionary<string, SchemaTable>();
        public BackgroundWorker backWorker { get; set; }
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
        public string strFullResult;
        public bool bDropError;
        public string strTableExcl;
        public string strSchemaExcl;
        public string sFieldExcl;


        public ErrorDBCreate(
            string pStageDBConn,
            string pTableDBConn,
            string pErrorDB,
         string pStageSchema,
         string pErrorSchema,
            bool pDropError
            , string pFieldExcl
                )
        {
             strStageConn = pStageDBConn;
             strTableConn = pTableDBConn;
             sErrorDB = pErrorDB;
             sStageSchema = pStageSchema;
             sErrorSchema = pErrorSchema;
             bDropError = pDropError;
             sFieldExcl = pFieldExcl;
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

            srcConn = new SqlConnection(this.strStageConn);
            srcConn.Open();
            srcStageConn = new SqlConnection(this.strStageConn);
            srcStageConn.Open();
            srcTableConn = new SqlConnection(this.strTableConn);
            srcTableConn.Open();



            SqlCommand command = srcConn.CreateCommand();

            if (this.strTableExcl == "") this.strTableExcl = "''";
            if (this.strSchemaExcl == "") this.strSchemaExcl = "''";

            command.CommandText = string.Format(QC.qryTableQueryBySchema, string.Format("'{0}'", this.sStageSchema));
            SqlDataReader drStaging = command.ExecuteReader();
            string sStageSchemaTable;
            string sTableName;
            string sCreate;

            while (drStaging.Read())
            {
                sStageSchemaTable = drStaging.GetString(0);
                sTableName = drStaging.GetString(1);
                List<TableColumn> lstTC = new List<TableColumn>();
                if (backWorker != null)
                {
                    backWorker.ReportProgress(0, new ProgressReport(string.Format("Building fact {0}.{1}", sStageSchemaTable, sTableName)));
                }
            
                sCreate = BuildTableCreate(sStageSchemaTable, sTableName,  ref lstTC);
                lstTS.Add(sStageSchemaTable + "." + sTableName, new SchemaTable(sStageSchemaTable, sTableName, sCreate, lstTC));

            }
            drStaging.Close();

            //Build the create string
            this.strFullCreate = "";
            if (this.bDropError)
            {
                this.strFullCreate += string.Format(QC.qryDropDB, this.sErrorDB);
            }
            this.strFullCreate += string.Format(QC.qryCreateDB, this.sErrorDB);

            this.strFullCreate += string.Format(QC.qryUse, this.sErrorDB);

            this.strFullCreate += string.Format(QC.qryCreateSchema, this.sErrorSchema);

            foreach (KeyValuePair<string, SchemaTable> st in lstTS)
            {
                if (st.Value.lstTC != null && st.Value.lstTC.Count > 0)
                {
                    this.strFullCreate += st.Value.CreateStatement;
                }
            }

        }

        public string BuildTableCreate(string pSchemaTable, string pTableName,  ref List<TableColumn> lstTC)
        {
            string strCreate;
            SqlCommand comm;
            SqlDataReader drCols;
            //Build field list
            string strColumnList = "";

            lstTC.Add(new TableColumn(pTableName, "QueueID", "true", "int", ""));
            lstTC.Add(new TableColumn(pTableName, "SSISErrorCode", "true", "int", ""));
            lstTC.Add(new TableColumn(pTableName, "SSISErrorColumn", "true", "int", ""));
            lstTC.Add(new TableColumn(pTableName, "PackageName", "true", "varchar", "255"));
            lstTC.Add(new TableColumn(pTableName, "ErrorType", "true", "varchar", "255"));
            comm = new SqlCommand(string.Format(QC.qryListColumns, pTableName, "", this.sFieldExcl, "BASE TABLE", "Error"), srcStageConn);
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
            //Reading all table regardless of schema, that match the staging name
            comm = new SqlCommand(string.Format(QC.qryListColumns, pTableName, "", this.sFieldExcl, "BASE TABLE", "Error"), srcTableConn);
            drRefs = comm.ExecuteReader();
            while (drRefs.Read())
            {
                if (drRefs.GetBoolean(11) != true)
                {
                    if (!lstTC.Exists(item => item.TableName == pTableName && item.ColumnName == drRefs.GetString(0)))
                    {
                        SC.AddTC(pTableName, ref lstTC, drRefs, true);
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
