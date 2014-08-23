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
            this.txtFileLocation = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnInsertTopLine = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.txtSheet = new System.Windows.Forms.TextBox();
            this.txtText = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // txtFileLocation
            // 
            this.txtFileLocation.Location = new System.Drawing.Point(286, 13);
            this.txtFileLocation.Name = "txtFileLocation";
            this.txtFileLocation.Size = new System.Drawing.Size(533, 22);
            this.txtFileLocation.TabIndex = 0;
            this.txtFileLocation.Text = "C:\\Dropbox (Data)\\Clients\\Meerkat\\CARE Somalia\\Data\\StagingTemplates\\Export\\Stagi" +
    "ng.Activity.xlsx";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(88, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "File Location";
            // 
            // btnInsertTopLine
            // 
            this.btnInsertTopLine.Location = new System.Drawing.Point(286, 119);
            this.btnInsertTopLine.Name = "btnInsertTopLine";
            this.btnInsertTopLine.Size = new System.Drawing.Size(75, 23);
            this.btnInsertTopLine.TabIndex = 2;
            this.btnInsertTopLine.Text = "Insert";
            this.btnInsertTopLine.UseVisualStyleBackColor = true;
            this.btnInsertTopLine.Click += new System.EventHandler(this.btnInsertTopLine_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(13, 43);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(86, 17);
            this.label2.TabIndex = 3;
            this.label2.Text = "Sheet Name";
            // 
            // txtSheet
            // 
            this.txtSheet.Location = new System.Drawing.Point(286, 41);
            this.txtSheet.Name = "txtSheet";
            this.txtSheet.Size = new System.Drawing.Size(533, 22);
            this.txtSheet.TabIndex = 4;
            this.txtSheet.Text = "Sheet1";
            // 
            // txtText
            // 
            this.txtText.Location = new System.Drawing.Point(286, 73);
            this.txtText.Name = "txtText";
            this.txtText.Size = new System.Drawing.Size(533, 22);
            this.txtText.TabIndex = 6;
            this.txtText.Text = "For internal use only. Do not fill in or change";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 75);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(35, 17);
            this.label3.TabIndex = 5;
            this.label3.Text = "Text";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(921, 253);
            this.Controls.Add(this.txtText);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtSheet);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnInsertTopLine);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtFileLocation);
            this.Name = "Form1";
            this.Text = "Form1";
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
    }
}

