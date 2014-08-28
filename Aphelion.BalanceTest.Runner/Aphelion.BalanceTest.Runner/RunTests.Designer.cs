namespace Aphelion.BalanceTest.Runner
{
    partial class RunTests
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
            this.txtSrcConn = new System.Windows.Forms.TextBox();
            this.txtDestConnString = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtDestKeys = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtSrcKeys = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtMatchFields = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.txtDestQuery = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.txtSrcQuery = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.btnBalance = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(33, 27);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(169, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Source Connection String";
            // 
            // txtSrcConn
            // 
            this.txtSrcConn.Location = new System.Drawing.Point(217, 27);
            this.txtSrcConn.Name = "txtSrcConn";
            this.txtSrcConn.Size = new System.Drawing.Size(449, 22);
            this.txtSrcConn.TabIndex = 1;
            this.txtSrcConn.Text = "Data Source=.\\sql2012;Initial Catalog=Meerkat;Integrated Security=True";
            // 
            // txtDestConnString
            // 
            this.txtDestConnString.Location = new System.Drawing.Point(868, 27);
            this.txtDestConnString.Name = "txtDestConnString";
            this.txtDestConnString.Size = new System.Drawing.Size(449, 22);
            this.txtDestConnString.TabIndex = 3;
            this.txtDestConnString.Text = "Data Source=.\\sql2012;Initial Catalog=Meerkat;Integrated Security=True";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(684, 27);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(153, 17);
            this.label2.TabIndex = 2;
            this.label2.Text = "Dest Connection String";
            // 
            // txtDestKeys
            // 
            this.txtDestKeys.Location = new System.Drawing.Point(868, 69);
            this.txtDestKeys.Name = "txtDestKeys";
            this.txtDestKeys.Size = new System.Drawing.Size(449, 22);
            this.txtDestKeys.TabIndex = 7;
            this.txtDestKeys.Text = "PeopleReachedValuesID";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(684, 69);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(106, 17);
            this.label3.TabIndex = 6;
            this.label3.Text = "Dest Key Fields";
            // 
            // txtSrcKeys
            // 
            this.txtSrcKeys.Location = new System.Drawing.Point(217, 69);
            this.txtSrcKeys.Name = "txtSrcKeys";
            this.txtSrcKeys.Size = new System.Drawing.Size(449, 22);
            this.txtSrcKeys.TabIndex = 5;
            this.txtSrcKeys.Text = "IndicatorValues_ID";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(33, 69);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(122, 17);
            this.label4.TabIndex = 4;
            this.label4.Text = "Source Key Fields";
            // 
            // txtMatchFields
            // 
            this.txtMatchFields.Location = new System.Drawing.Point(217, 293);
            this.txtMatchFields.Multiline = true;
            this.txtMatchFields.Name = "txtMatchFields";
            this.txtMatchFields.Size = new System.Drawing.Size(1100, 134);
            this.txtMatchFields.TabIndex = 9;
            this.txtMatchFields.Text = "ActualValue, NumberReached";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(33, 293);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(123, 51);
            this.label6.TabIndex = 8;
            this.label6.Text = "Match Fields. \r\nComma separated\r\nOne pair per line";
            // 
            // txtDestQuery
            // 
            this.txtDestQuery.Location = new System.Drawing.Point(868, 113);
            this.txtDestQuery.Multiline = true;
            this.txtDestQuery.Name = "txtDestQuery";
            this.txtDestQuery.Size = new System.Drawing.Size(449, 159);
            this.txtDestQuery.TabIndex = 15;
            this.txtDestQuery.Text = "select * from rbm.PeopleReachedValues";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(684, 113);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(80, 17);
            this.label7.TabIndex = 14;
            this.label7.Text = "Dest Query";
            // 
            // txtSrcQuery
            // 
            this.txtSrcQuery.Location = new System.Drawing.Point(217, 113);
            this.txtSrcQuery.Multiline = true;
            this.txtSrcQuery.Name = "txtSrcQuery";
            this.txtSrcQuery.Size = new System.Drawing.Size(449, 159);
            this.txtSrcQuery.TabIndex = 13;
            this.txtSrcQuery.Text = "select * from RBM.IndicatorValues";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(33, 113);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(96, 17);
            this.label8.TabIndex = 12;
            this.label8.Text = "Source Query";
            // 
            // btnBalance
            // 
            this.btnBalance.BackColor = System.Drawing.Color.DarkSeaGreen;
            this.btnBalance.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBalance.Location = new System.Drawing.Point(36, 435);
            this.btnBalance.Name = "btnBalance";
            this.btnBalance.Size = new System.Drawing.Size(77, 66);
            this.btnBalance.TabIndex = 16;
            this.btnBalance.Text = "Balance";
            this.btnBalance.UseVisualStyleBackColor = false;
            this.btnBalance.Click += new System.EventHandler(this.btnBalance_Click);
            // 
            // RunTests
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1338, 513);
            this.Controls.Add(this.btnBalance);
            this.Controls.Add(this.txtDestQuery);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.txtSrcQuery);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.txtMatchFields);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.txtDestKeys);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtSrcKeys);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtDestConnString);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtSrcConn);
            this.Controls.Add(this.label1);
            this.Name = "RunTests";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtSrcConn;
        private System.Windows.Forms.TextBox txtDestConnString;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtDestKeys;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtSrcKeys;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtMatchFields;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtDestQuery;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txtSrcQuery;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button btnBalance;
    }
}

