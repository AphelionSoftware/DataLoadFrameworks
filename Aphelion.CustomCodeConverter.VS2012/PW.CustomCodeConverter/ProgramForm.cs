using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using PW.XMLA.Reader;
using PW.XMLA.Writer;
//using PW.ExcelCode.Writer;
using PW.ExcelCode.Writer;
using PW.PowerPivot.Writer;
using Aphelion.DW.StagingCreate;
using Aphelion.XMLA.FromMetadata;

namespace PW.CustomCodeConverter
{
    public partial class ProgramForm : Form
    {

        OLAPStarCreate scOLAP;
        StagingCreate scTables;
        ErrorDBCreate errTables;
        bool boolRunScriptStaging = false; //Really should be a property on the background thread but not interested in inheriting that class just for this.
        //Sometimes I really like prototype programming
        public TabularPopulateStarFromViews TPR;
        public MultiDimensionalReader mdrCube = new MultiDimensionalReader();
        public TabularXMLAWriter txwCube = new TabularXMLAWriter();
        public ExcelSrcCopyWriter excelCube = new ExcelSrcCopyWriter();
        public ProgramForm()
        {
            InitializeComponent();
        }

        private void tstConvert_Click(object sender, EventArgs e)
        {
            Properties.Settings.Default.Save();
            txwCube = new TabularXMLAWriter();
            mdrCube = new MultiDimensionalReader();
            mdrCube.connSrcConnection = this.txtsrcConnectionString.Text;
            mdrCube.sSrcDBName = this.txtsrcDatabase.Text;
            //Should do cube as well


            mdrCube.PopulateDefinitionFromMultiDimensional();

            txwCube.connDestConnection = txtdestConnectionString.Text;
            txwCube.sDBName = txtdestDatabase.Text;

            txwCube.srcCubeReader = mdrCube;
           // txwCube.CreateTabular();
            txwCube.BuildTabularXMLA();

            


        }

        private void btnCreateExcel_Click(object sender, EventArgs e)
        {
            excelCube = new ExcelSrcCopyWriter();

            mdrCube = new MultiDimensionalReader();
            mdrCube.connSrcConnection = this.txtTabularConnection.Text;
            mdrCube.sSrcDBName = this.txtTabularSrcDB.Text;
            mdrCube.isTabular = true;
            //Should do cube as well


            mdrCube.PopulateDefinitionFromMultiDimensional();

            //excelCube.connSrcConnection = txtdestConnectionString.Text;
            excelCube.connSrcConnection = this.txtTabularConnection.Text;
            excelCube.sTemplateFilename = txtTemplateFileName.Text;

            excelCube.sDBName = txtTabularSrcDB.Text;
            excelCube.sFilename = txtFilename.Text;
            excelCube.srcCubeReader = mdrCube;
            
            excelCube.CreateExcel();
             

        }

        private void btnInsert_Click(object sender, EventArgs e)
        {
            string sServer = this.txtExServer.Text;
            string sDB = this.txtExDB.Text;
            string sDest = this.txtExDest.Text;
            string sInsertPath = this.txtExInsertPath.Text;
            string sBackupPath = this.txtExBackupPath.Text;
            string sTemplate = this.txtExTemplate.Text;
            



            ExcelInsertBackupWriter excel = new ExcelInsertBackupWriter(sServer, sDB, sTemplate, sDest, sBackupPath, sInsertPath);
            excel.CreateExcel();
            //excel.CreateExcel();
        }

        private void btnSubset_Click(object sender, EventArgs e)
        {
            Properties.Settings.Default.Save(); 
            string sServer = this.txtExServer.Text;
            string sDB = this.txtExDB.Text;
            string stempDB = this.txtExDB.Text + "_TEMP";
            string sDest = this.txtExDest.Text;
            string sInsertPath = this.txtExInsertPath.Text;
            string sBackupPath = this.txtExBackupPath.Text;
            string sTemplate = this.txtExTemplate.Text;

            /*mdrCube = new MultiDimensionalReader();
            mdrCube.connSrcConnection = string.Format("Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source={0};Initial Catalog={1};", sServer, sDB);

            mdrCube.sSrcDBName = sDB;
            mdrCube.isTabular = true;
            mdrCube.isTabularSource = true;
            //Should do cube as well

            mdrCube.PopulateDefinitionFromMultiDimensional();


            TabularSubSet ts = new TabularSubSet();
            ts.xmlaReader = mdrCube;
            ts.CreateTabular(sServer, stempDB, sDB);
            //ts.xmlaWriter.CreateTabular();
            ts.sFilterTable = "Dates";
            ts.xmlaWriter.BuildTabularXMLA();
            ts.xmlaWriter.ProcessTabular();
             * */



            ExcelInsertBackupWriter excel = new ExcelInsertBackupWriter(sServer, sDB, sTemplate, sDest, sBackupPath, sInsertPath);
            //excel.CreateExcelFromSubset(sDB);
            excel.CreateExcelFromSubset(sDB, this.txtExDim.Text, this.txtExDimValue.Text, ">",true);
            //excel.CreateExcelFromSubset(sDB);
        }

        /// <summary>
        /// Actually btnOLAP
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnStage_Click(object sender, EventArgs e)
        {
            Properties.Settings.Default.Save();
            this.txtResults.Text = "Running in the background.....";
            backgroundWorkerOLAP.RunWorkerAsync();
            /*
             * OLAPStarCreate scOLAP = new OLAPStarCreate(
                this.txtSrcConn.Text
                , this.txtDestConn.Text
                , this.txtSchema.Text
                , this.txtFactPrefix.Text
                , this.txtDimPrefix.Text
                , this.txtFieldExcl.Text
                , this.txtTableExcl.Text
                , this.txtFactFilter.Text
                , this.txtDimFilter.Text
                , this.chkSchema.Checked
                );
            scOLAP.intMaxRecursion = (int)this.numMaxRecurse.Value;
            scOLAP.CreateScript();

            this.txtResults.Text = scOLAP.OutputScript();
            scOLAP.RunScript();
            */
        }

        private void btnStaging_Click(object sender, EventArgs e)
        {
            Properties.Settings.Default.Save();
            chkRunScript.Checked = false;
            SetupStagingWorker();
        }

        private void SetupStagingWorker()
        {
            this.btnStaging.Enabled = false;
            this.btnStgCreateDB.Enabled = false;

            Dictionary<string, string> dicArgs = new Dictionary<string, string>();
            if (this.chkIgnorePrefixes.Checked) {
                dicArgs.Add("UsePrefix", "false");
            
            }
            backgroundWorkerStaging.RunWorkerAsync();

        }

        private void btnTblCreateCube_Click(object sender, EventArgs e)
        {
            Properties.Settings.Default.Save();
            this.TPR = new TabularPopulateStarFromViews(
                txtTblCubeDB.Text
                , txtTblDSConn.Text
                , txtTblConnSecurity.Text
                , txtTblImpersonationMode.Text
                , txtTblUsername.Text
                , txtTblPwd.Text
                , txtTblImpersonationSecurity.Text
                , txtTblSrcConn.Text
                , txtTblDestConn.Text
                , txtTblSchema.Text
                , ""
                , ""
                );

            MultiDimensionalReader mdr = new MultiDimensionalReader();
            mdr.cbOriginalCube =
                TPR.ScanDB();

            TPR.CreateCube();

        }

        private void btnInsert_Click_1(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            SetupStagingWorker();    
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            Properties.Settings.Default.Save();
            btnStage_Click(sender, e);
            btnTblCreateCube_Click(sender, e);
            btnProcess_Click(sender, e);
        }

        private void btnProcess_Click(object sender, EventArgs e)
        {
            Properties.Settings.Default.Save();
            if (TPR == null)
            {
                btnTblCreateCube_Click(sender, e);
            }
            TPR.ProcessCube();
        }

        private void btnInsert_Click_2(object sender, EventArgs e)
        {
            Properties.Settings.Default.Save();
            string sServer = this.txtExServer.Text;
            string sDB = this.txtExDB.Text;
            string sDest = this.txtExDest.Text;
            string sInsertPath = this.txtExInsertPath.Text;
            string sBackupPath = this.txtExBackupPath.Text;
            string sTemplate = this.txtExTemplate.Text;




            ExcelInsertBackupWriter excel = new ExcelInsertBackupWriter(sServer, sDB, sTemplate, sDest, sBackupPath, sInsertPath);
            excel.CreateExcel();
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Properties.Settings.Default.Save();
            btnStage_Click(sender, e);
            btnTblCreateCube_Click(sender, e);
            btnProcess_Click(sender, e);
            btnInsert_Click_2(sender, e);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Properties.Settings.Default.Save(); 
            btnStage_Click(sender, e);
            btnTblCreateCube_Click(sender, e);
            btnProcess_Click(sender, e);
            btnInsert_Click_2(sender, e);
        }

        private void txtSrcKeyName_TextChanged(object sender, EventArgs e)
        {

        }

        private void tabPage6_Click(object sender, EventArgs e)
        {

        }

        private void btnGenerateErrors_Click(object sender, EventArgs e)
        {
            this.chkRunError.Checked = false;
            ErrorBackworkerSetup();
        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void btnStgCreateDB_Click(object sender, EventArgs e)
        {
            chkRunScript.Checked = true;
            SetupStagingWorker();
        }

        private void btnErrorCreate_Click(object sender, EventArgs e)
        {
            this.chkRunError.Checked = true;
            ErrorBackworkerSetup();
        }

        

        private void ProgramForm_Load(object sender, EventArgs e)
        {
        }
        /// <summary>
        /// Save the values of each of the text boxes away to a file to keep state for next time
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ProgramForm_FormClosing(object sender, FormClosingEventArgs e)
        {

            Properties.Settings.Default.Save(); 
        }

        private void btnCreateExcel_Click_1(object sender, EventArgs e)
        {
            Properties.Settings.Default.Save(); 
            
        }

        /// <summary>
        /// Creating OLAP Schema
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void backgroundWorkerOLAP_DoWork(object sender, DoWorkEventArgs e)
        {
            this.scOLAP = new OLAPStarCreate(
                this.txtSrcConn.Text
                , this.txtDestConn.Text
                , this.txtSchema.Text
                , this.txtFactPrefix.Text
                , this.txtDimPrefix.Text
                , this.txtFieldExcl.Text
                , this.txtTableExcl.Text
                , this.txtFactFilter.Text
                , this.txtDimFilter.Text
                , this.chkSchema.Checked
                );
            scOLAP.backWorker = this.backgroundWorkerOLAP;
            scOLAP.intMaxRecursion = (int)this.numMaxRecurse.Value;
            scOLAP.CreateScript();
            scOLAP.OutputScript();
            scOLAP.RunScript();

            
        }

        private void backgroundWorkerOLAP_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {

            this.txtResults.Text = scOLAP.strFullResult;
            
        }

        private void backgroundWorkerOLAP_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            //this.txtResults.Text = "Update";
            this.txtResults.Text = e.UserState.ToString();
        }

        private void btnCancelOLAP_Click(object sender, EventArgs e)
        {
            if (backgroundWorkerOLAP.IsBusy)
            {
                backgroundWorkerOLAP.CancelAsync();
            }
        }

        private void backgroundWorkerStaging_DoWork(object sender, DoWorkEventArgs e)
        {
            /*Dictionary<string, string> dicArgs = (Dictionary<string, string>)e.Argument;
            string sRunScript;
            dicArgs.TryGetValue("RunScript", out sRunScript);
            string sFactPrefix = "";
            string sDimPrefix = "";
            string sUsePrefixes;

            dicArgs.TryGetValue("UsePrefix", out sUsePrefixes);
            if (sUsePrefixes != "false")
            {
                dicArgs.TryGetValue("FactPrefix", out sFactPrefix);
                if (sFactPrefix == "") sFactPrefix = this.txtStgFactPrefix.Text;
                dicArgs.TryGetValue("DimPrefix", out sDimPrefix);
                if (sDimPrefix == "") sDimPrefix = this.txtStgDimPrefix.Text;
            }*/

            string sFactPrefix = "";
            string sDimPrefix = "";

            if (this.chkIgnorePrefixes.Checked == false)
            {
                sFactPrefix = sFactPrefix = this.txtStgFactPrefix.Text;
                sDimPrefix = this.txtStgDimPrefix.Text;
            }

            scTables = new StagingCreate(this.txtStgSrcConn.Text, this.txtStgDB.Text, this.txtStgSchema.Text,sFactPrefix ,sDimPrefix, this.txtStgFieldExcl.Text, this.txtSrcKeyName.Text, this.chkStageDrop.Checked);
            scTables.backWorker = this.backgroundWorkerStaging;
            scTables.CreateScript();
            scTables.OutputScript();
            if (this.chkRunScript.Checked == true) 
            {
                scTables.RunScript();
            }
        }

        private void backgroundWorkerStaging_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {

            this.txtStageScript.Text = scTables.strFullResult;
            this.btnStaging.Enabled = true;
            this.btnStgCreateDB.Enabled = true;
            
        
        }

        private void backgroundWorkerStaging_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {

            this.txtStageScript.Text = e.UserState.ToString();
        }

        private void ErrorBackworkerSetup()
        {
            Properties.Settings.Default.Save();
            this.btnErrorCreate.Enabled = false;
            this.btnGenerateErrors.Enabled = false;
            backgroundWorkerError.RunWorkerAsync();
        }

        private void backgroundWorkerError_DoWork(object sender, DoWorkEventArgs e)
        {
            errTables = new ErrorDBCreate(this.txtErrorStg.Text, this.txtErrorSrc.Text, this.txtErrorDB.Text, this.txtErrorStagingSchema.Text, this.txtErrorsSchema.Text, this.chkErrorsDropDB.Checked, this.txtErrorsFieldExcl.Text);
            errTables.backWorker = backgroundWorkerError;
            errTables.CreateScript();
            errTables.OutputScript();
            if (this.chkRunError.Checked )
            {
                errTables.RunScript();
            }
        }

        private void backgroundWorkerError_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {

            this.txtErrorResult.Text = e.UserState.ToString();
           
        }

        private void backgroundWorkerError_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            this.btnErrorCreate.Enabled = false;
            this.btnGenerateErrors.Enabled = false;

            this.txtErrorResult.Text = errTables.strFullResult;

        }

        private void tabPage2_Click(object sender, EventArgs e)
        {

        }

        private void btnCreateO_S_E_1_Click(object sender, EventArgs e)
        {
            btnStage_Click(sender, e);
            btnStgCreateDB_Click(sender, e);
            btnErrorCreate_Click(sender, e);
        }

        private void btnCreateO_S_E2_Click(object sender, EventArgs e)
        {
            btnStage_Click(sender, e);
            btnStgCreateDB_Click(sender, e);
            btnErrorCreate_Click(sender, e);
        
        }

        private void btnCreateO_S_E3_Click(object sender, EventArgs e)
        {
            btnStage_Click(sender, e);
            btnStgCreateDB_Click(sender, e);
            btnErrorCreate_Click(sender, e);
        
        }
       
    }
}
