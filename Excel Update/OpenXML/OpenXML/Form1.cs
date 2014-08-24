using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.Sql;
using System.Data.SqlClient;

using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;



namespace OpenXML
{
    public partial class Form1 : Form
    {
        public string srcDBConn = "Data Source=.\\sql2012;Initial Catalog=Meerkat;Integrated Security=True";
        SqlConnection srcConn = new SqlConnection();
        
        string strSQL = "SELECT CAST([p].[Programme_ID] AS NVARCHAR(MAX)),CAST([p].[BusinessKey] AS NVARCHAR(MAX)),CAST([p].[Code] AS NVARCHAR(MAX)),CAST([p].[LongName] AS NVARCHAR(MAX)),CAST([p].[ProgrammeSiteName] AS NVARCHAR(MAX)),CAST([p].[ShortName] AS NVARCHAR(MAX)),CAST([p].[TextDescription] AS NVARCHAR(MAX)) FROM  [app].[Programme] AS p ";
        public Form1()
        {
            InitializeComponent();
        }

        private void btnInsertTopLine_Click(object sender, EventArgs e)
        {
            this.InsertLine(this.txtFileLocation.Text, this.txtSheet.Text, this.txtText.Text);
        }


        private void InsertLine(string pFileLocation, string pSheetName, string pText)
        {

            // Open the document for editing.
            using (SpreadsheetDocument document = SpreadsheetDocument.Open(pFileLocation, true))
            {
                IEnumerable<Sheet> sheets = document.WorkbookPart.Workbook.Descendants<Sheet>().Where(s => s.Name == pSheetName);
                if (sheets.Count() == 0)
                {
                    return;
                }

                WorksheetPart worksheetPart = (WorksheetPart)document.WorkbookPart.GetPartById(sheets.First().Id);
                Worksheet worksheet = worksheetPart.Worksheet;

                IEnumerable<Row> rows = worksheet.Descendants<Row>();
                uint newRowIndex = 0;
                foreach (Row row in rows)
                {
                    newRowIndex = System.Convert.ToUInt32(row.RowIndex.Value + 1);

                    foreach (Cell cell in row.Elements<Cell>())
                    {
                        // Update the references for reserved cells.
                        string cellReference = cell.CellReference.Value;
                        cell.CellReference = new StringValue(cellReference.Replace(row.RowIndex.Value.ToString(), newRowIndex.ToString()));
                    }
                    // Update the row index.
                    row.RowIndex = new UInt32Value(newRowIndex);
                }


               // Cell cellA1 = InsertCellInWorksheet("A", 1, worksheetPart);
                //cellA1.CellValue = new CellValue(pText);
                //cellA1.DataType = new EnumValue<CellValues>(CellValues.SharedString);

                worksheet.Save();
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            InsertIntoExcel(this.txtSQLConn.Text, this.txtFileLocation.Text, this.txtSQL.Text, this.txtExcel.Text, this.txtSheet.Text, 3);
        }

        #region Ugly code from SDK
        private static int InsertSharedStringItem(string text, SharedStringTablePart shareStringPart)
        {

            // If the part does not contain a SharedStringTable, create one.
            if (shareStringPart.SharedStringTable == null)
            {
                shareStringPart.SharedStringTable = new SharedStringTable();
            }
            int i = 0;

            // Iterate through all the items in the SharedStringTable. If the text already exists, return its index.
            foreach (SharedStringItem item in shareStringPart.SharedStringTable.Elements<SharedStringItem>())
            {
                if (item.InnerText == text)
                {
                    return i;
                }
                i++;
            }

            // The text does not exist in the part. Create the SharedStringItem and return its index.
            shareStringPart.SharedStringTable.AppendChild(new SharedStringItem(new DocumentFormat.OpenXml.Spreadsheet.Text(text)));
            shareStringPart.SharedStringTable.Save();
            return i;
        } 
      
#endregion

        private int InsertIntoExcel(string pConn, string pFileLocation, string pSQL, string pExcelQuery, string pSheetName, int pRow)
        {
            DateTime dTime = DateTime.Now;
            if (srcConn.ConnectionString != pConn)
            {
                if (srcConn.State == ConnectionState.Open)
                {
                    srcConn.Close();
                }
            }
            
            if (srcConn.State != ConnectionState.Open)
            {
                srcConn.ConnectionString = pConn;
                srcConn.Open();
            }
            SqlCommand comm = new SqlCommand(pSQL);
            comm.Connection = srcConn;
            DataTable dt = new DataTable();
            dt.Load(comm.ExecuteReader());

            string cl = "";
            uint iRow = (uint)pRow;
            int index;
            Cell cell;
           
            using (SpreadsheetDocument document = SpreadsheetDocument.Open(pFileLocation, true))
            {
                IEnumerable<Sheet> sheets = document.WorkbookPart.Workbook.Descendants<Sheet>().Where(s => s.Name == pSheetName);
                if (sheets.Count() == 0)
                {
                    return -1;
                }

                WorksheetPart worksheetPart = (WorksheetPart)document.WorkbookPart.GetPartById(sheets.First().Id);
                Worksheet worksheet = worksheetPart.Worksheet;
                SheetData sheetData = worksheet.GetFirstChild<SheetData>();
                string cellReference ;

                foreach (DataRow dr in dt.Rows)
                {

                    Row row;
                    if (sheetData.Elements<Row>().Where(r => r.RowIndex == iRow).Count() != 0)
                    {
                        row = sheetData.Elements<Row>().Where(r => r.RowIndex == iRow).First();
                    }
                    else
                    {
                        row = new Row() { RowIndex = iRow };
                        sheetData.Append(row);
                    }
                    for (int idx = 0; idx < dt.Columns.Count; idx++)
                    {
                        #region Get data
                        SharedStringTablePart shareStringPart;
                        if (document.WorkbookPart.GetPartsOfType<SharedStringTablePart>().Count() > 0)
                        {
                            shareStringPart = document.WorkbookPart.GetPartsOfType<SharedStringTablePart>().First();
                        }
                        else
                        {
                            shareStringPart = document.WorkbookPart.AddNewPart<SharedStringTablePart>();
                        }

                        if (idx >= 26)
                        {
                            cl = "A" + Convert.ToString(Convert.ToChar(65 + idx - 26));
                        }
                        else
                        {
                            cl = Convert.ToString(Convert.ToChar(65 + idx));
                        }

                        #endregion


                        // Insert the text into the SharedStringTablePart.

                        /*
                        index = InsertSharedStringItem(Convert.ToString(dr[idx]), shareStringPart);
                        */

                        index = shareStringPart.SharedStringTable.Count();
                        shareStringPart.SharedStringTable.AppendChild(new SharedStringItem(new DocumentFormat.OpenXml.Spreadsheet.Text(Convert.ToString(dr[idx]))));
                        shareStringPart.SharedStringTable.Save();
                        

                        cellReference = cl + iRow;
                        //cell = InsertCellInWorksheet(cl, iRow, worksheetPart);

                        // If there is not a cell with the specified column name, insert one. 
                        /*if (row.Elements<Cell>().Where(c => c.CellReference.Value == cl + iRow).Count() > 0)
                        {
                            cell = row.Elements<Cell>().Where(c => c.CellReference.Value == cellReference).First();
                        }
                        else
                        {
                        */
                            // Cells must be in sequential order according to CellReference. Determine where to insert the new cell.
                            Cell refCell = null;

                            cell = new Cell() { CellReference = cellReference };
                            row.InsertBefore(cell, refCell);
                        //}
                        cell.CellValue = new CellValue(index.ToString());
                        cell.DataType = new EnumValue<CellValues>(CellValues.SharedString);
                        
                    }
                    iRow++;
                    if (iRow % 1000 == 0)
                    {
                        worksheet.Save();
                    }
                }
                worksheet.Save();
            }

            return (DateTime.Now - dTime).Seconds;
             
        }

       
    }
}
