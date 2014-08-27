namespace OpenXML
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.btnInsertTopLine = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.txtText = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.txtExcel = new System.Windows.Forms.TextBox();
            this.txtSQL = new System.Windows.Forms.TextBox();
            this.txtSQLConn = new System.Windows.Forms.TextBox();
            this.txtSheet = new System.Windows.Forms.TextBox();
            this.txtFileLocation = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(10, 11);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(67, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "File Location";
            // 
            // btnInsertTopLine
            // 
            this.btnInsertTopLine.Location = new System.Drawing.Point(991, 70);
            this.btnInsertTopLine.Margin = new System.Windows.Forms.Padding(2);
            this.btnInsertTopLine.Name = "btnInsertTopLine";
            this.btnInsertTopLine.Size = new System.Drawing.Size(56, 45);
            this.btnInsertTopLine.TabIndex = 2;
            this.btnInsertTopLine.Text = "Insert Lines";
            this.btnInsertTopLine.UseVisualStyleBackColor = true;
            this.btnInsertTopLine.Click += new System.EventHandler(this.btnInsertTopLine_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(10, 35);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(66, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Sheet Name";
            // 
            // txtText
            // 
            this.txtText.Location = new System.Drawing.Point(214, 59);
            this.txtText.Margin = new System.Windows.Forms.Padding(2);
            this.txtText.Name = "txtText";
            this.txtText.Size = new System.Drawing.Size(741, 20);
            this.txtText.TabIndex = 6;
            this.txtText.Text = "For internal use only. Do not fill in or change";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(10, 61);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(28, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "Text";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(10, 113);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(28, 13);
            this.label4.TabIndex = 8;
            this.label4.Text = "SQL";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(972, 11);
            this.button1.Margin = new System.Windows.Forms.Padding(2);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 45);
            this.button1.TabIndex = 9;
            this.button1.Text = "Insert Programme";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(10, 137);
            this.label5.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(28, 13);
            this.label5.TabIndex = 11;
            this.label5.Text = "SQL";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(10, 290);
            this.label6.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(33, 13);
            this.label6.TabIndex = 13;
            this.label6.Text = "Excel";
            // 
            // txtExcel
            // 
            this.txtExcel.DataBindings.Add(new System.Windows.Forms.Binding("Text", global::OpenXML.Properties.Settings.Default, "txtExcel_Text", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.txtExcel.Location = new System.Drawing.Point(214, 290);
            this.txtExcel.Margin = new System.Windows.Forms.Padding(2);
            this.txtExcel.Multiline = true;
            this.txtExcel.Name = "txtExcel";
            this.txtExcel.Size = new System.Drawing.Size(741, 79);
            this.txtExcel.TabIndex = 12;
            this.txtExcel.Text = global::OpenXML.Properties.Settings.Default.txtExcel_Text;
            // 
            // txtSQL
            // 
            this.txtSQL.DataBindings.Add(new System.Windows.Forms.Binding("Text", global::OpenXML.Properties.Settings.Default, "txtSQL_Text", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.txtSQL.Location = new System.Drawing.Point(214, 137);
            this.txtSQL.Margin = new System.Windows.Forms.Padding(2);
            this.txtSQL.Multiline = true;
            this.txtSQL.Name = "txtSQL";
            this.txtSQL.Size = new System.Drawing.Size(741, 149);
            this.txtSQL.TabIndex = 10;
            this.txtSQL.Text = global::OpenXML.Properties.Settings.Default.txtSQL_Text;
            // 
            // txtSQLConn
            // 
            this.txtSQLConn.DataBindings.Add(new System.Windows.Forms.Binding("Text", global::OpenXML.Properties.Settings.Default, "txtConn_Text", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.txtSQLConn.Location = new System.Drawing.Point(214, 113);
            this.txtSQLConn.Margin = new System.Windows.Forms.Padding(2);
            this.txtSQLConn.Name = "txtSQLConn";
            this.txtSQLConn.Size = new System.Drawing.Size(741, 20);
            this.txtSQLConn.TabIndex = 7;
            this.txtSQLConn.Text = global::OpenXML.Properties.Settings.Default.txtConn_Text;
            // 
            // txtSheet
            // 
            this.txtSheet.DataBindings.Add(new System.Windows.Forms.Binding("Text", global::OpenXML.Properties.Settings.Default, "txtSheet_Text", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.txtSheet.Location = new System.Drawing.Point(214, 33);
            this.txtSheet.Margin = new System.Windows.Forms.Padding(2);
            this.txtSheet.Name = "txtSheet";
            this.txtSheet.Size = new System.Drawing.Size(741, 20);
            this.txtSheet.TabIndex = 4;
            this.txtSheet.Text = global::OpenXML.Properties.Settings.Default.txtSheet_Text;
            // 
            // txtFileLocation
            // 
            this.txtFileLocation.DataBindings.Add(new System.Windows.Forms.Binding("Text", global::OpenXML.Properties.Settings.Default, "txtFileLocation_Text", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.txtFileLocation.Location = new System.Drawing.Point(214, 11);
            this.txtFileLocation.Margin = new System.Windows.Forms.Padding(2);
            this.txtFileLocation.Name = "txtFileLocation";
            this.txtFileLocation.Size = new System.Drawing.Size(741, 20);
            this.txtFileLocation.TabIndex = 0;
            this.txtFileLocation.Text = global::OpenXML.Properties.Settings.Default.txtFileLocation_Text;
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(214, 83);
            this.textBox1.Margin = new System.Windows.Forms.Padding(2);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(741, 20);
            this.textBox1.TabIndex = 15;
            this.textBox1.Text = "For internal use only. Do not fill in or change";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(10, 85);
            this.label7.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(145, 13);
            this.label7.TabIndex = 14;
            this.label7.Text = "Headings (comma separated)";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1069, 415);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtExcel);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txtSQL);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtSQLConn);
            this.Controls.Add(this.txtText);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtSheet);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnInsertTopLine);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtFileLocation);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtFileLocation;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnInsertTopLine;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtSheet;
        private System.Windows.Forms.TextBox txtText;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtSQLConn;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtSQL;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtExcel;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label7;
    }
}

