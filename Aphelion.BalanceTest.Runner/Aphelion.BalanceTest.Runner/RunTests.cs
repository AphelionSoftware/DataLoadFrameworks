using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Collections;
using Aphelion.BalanceTest;

namespace Aphelion.BalanceTest.Runner
{
    public partial class RunTests : Form
    {
        public RunTests()
        {
            InitializeComponent();
        }

        private void btnBalance_Click(object sender, EventArgs e)
        {
            List<string> lstSrcKeys = new List<string>();
            foreach (string s in this.txtSrcKeys.Text.Split(','))
            {
                lstSrcKeys.Add(s.Trim());
            }
            List<string> lstDestKeys = new List<string>();
            foreach (string s in this.txtDestKeys.Text.Split(','))
            {
                lstDestKeys.Add(s.Trim());
            }

            Dictionary<string, string> dictValues = new Dictionary<string, string>();
            string sKey;
            string sVal;
            foreach (string s in this.txtMatchFields.Text.Split('\n'))
            {
                sKey = s.Split(',')[0];
                sVal = s.Split(',')[1];
                dictValues.Add(sKey.Trim(), sVal.Trim());
            }
            BalanceTest bt = new BalanceTest(this.txtSrcConn.Text, this.txtDestConnString.Text, this.txtSrcQuery.Text, this.txtDestQuery.Text, lstSrcKeys, lstDestKeys, dictValues);
            bt.RunTests();
        }
    }
}
