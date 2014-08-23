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
        SqlConnection srcConn;
        
        string sSQL = "SELECT CAST([p].[Programme_ID] AS NVARCHAR(MAX)),CAST([p].[BusinessKey] AS NVARCHAR(MAX)),CAST([p].[Code] AS NVARCHAR(MAX)),CAST([p].[LongName] AS NVARCHAR(MAX)),CAST([p].[ProgrammeSiteName] AS NVARCHAR(MAX)),CAST([p].[ShortName] AS NVARCHAR(MAX)),CAST([p].[TextDescription] AS NVARCHAR(MAX)) FROM  [app].[Programme] AS p ";
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
            
    

        
            
    }
}
