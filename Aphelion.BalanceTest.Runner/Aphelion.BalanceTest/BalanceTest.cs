using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Collections;

namespace Aphelion.BalanceTest
{
    public class BalanceTest
    {
        private List<string> lstSrcKeys { get; set;} 
        private List<string> lstDestKeys { get; set;}

        private Dictionary<string, string> dictMatchFields { get; set; }

        private Dictionary<string, int> dictSrcKeys { get; set; }
        private Dictionary<string, int> dictDestKeys { get; set; }


        private string SQLConnStrSource { get; set ;}
        private string SQLConnStrDestionation { get; set; }

        private string strSrcCommand { get; set; }
        private string strDestCommand { get; set; }

        private SqlConnection sqlConnSrc;
        private SqlConnection sqlConnDest;

        public DataTable dtSrcUnmatched;
        public DataTable dtDestUnmatched;
        public DataTable dtMatched;
        public DataTable dtMatchedBalanced;
        public DataTable dtMatchedUnbalanced;

        /// <summary>
        /// Assume the first column is the key
        /// </summary>
        /// <param name="pSQLsrc">Connection string for source SQL</param>
        /// <param name="pSQLdest">Connection string for dest SQL</param>
        public BalanceTest(string pSQLsrc, string pSQLdest)
        {
            this.SQLConnStrSource = pSQLsrc;
            this.SQLConnStrDestionation = pSQLdest;
            
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="pSQLsrc"></param>
        /// <param name="pSQLdest"></param>
        /// <param name="pSrcKeys"></param>
        /// <param name="pDestKeys"></param>
        public BalanceTest(string pSQLsrc, string pSQLdest, List<string> pSrcKeys, List<string> pDestKeys)
        {
            this.SQLConnStrSource = pSQLsrc;
            this.SQLConnStrDestionation = pSQLdest;
            this.lstSrcKeys = pSrcKeys;
            this.lstDestKeys = pDestKeys;

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="pSQLsrc"></param>
        /// <param name="pSQLdest"></param>
        /// <param name="pSrcKeys"></param>
        /// <param name="pDestKeys"></param>
        public BalanceTest(string pSQLsrc, string pSQLdest, string pSrcCommand, string pDestCommand, List<string> pSrcKeys, List<string> pDestKeys)
        {
            this.SQLConnStrSource = pSQLsrc;
            this.SQLConnStrDestionation = pSQLdest;
            this.lstSrcKeys = pSrcKeys;
            this.lstDestKeys = pDestKeys;
            this.strSrcCommand = pSrcCommand;
            this.strDestCommand = pDestCommand;

        }

        public BalanceTest(string pSQLsrc, string pSQLdest, string pSrcCommand, string pDestCommand, List<string> pSrcKeys, List<string> pDestKeys, Dictionary<string, string> pDict)
        {
            this.SQLConnStrSource = pSQLsrc;
            this.SQLConnStrDestionation = pSQLdest;
            this.lstSrcKeys = pSrcKeys;
            this.lstDestKeys = pDestKeys;
            this.strSrcCommand = pSrcCommand;
            this.strDestCommand = pDestCommand;
            this.dictMatchFields = pDict;

        }
        public int RunTests()
        {
        #region Setup
            this.sqlConnSrc = new SqlConnection(this.SQLConnStrSource);
            this.sqlConnDest = new SqlConnection(this.SQLConnStrDestionation);

            this.sqlConnSrc.Open();
            this.sqlConnDest.Open();

            SqlCommand commSrc = new SqlCommand(this.strSrcCommand, this.sqlConnSrc);
            SqlCommand commDest = new SqlCommand(this.strDestCommand, this.sqlConnDest);

            SqlDataAdapter daSrc = new SqlDataAdapter(commSrc);
            SqlDataAdapter daDest = new SqlDataAdapter(commDest);
            DataTable dtSrc = new DataTable();
                daSrc.Fill(dtSrc);

            DataTable dtDest = new DataTable();
                daDest.Fill(dtDest);

                if (lstSrcKeys == null)
                {
                    lstSrcKeys.Add(dtSrc.Columns[0].ColumnName);
                }
                if (lstDestKeys == null)
                {
                    lstDestKeys.Add(dtDest.Columns[0].ColumnName);
                }
                dtSrc.Columns.Add("Hash", (typeof(Int64)));
                foreach (DataRow drSrc in dtSrc.Rows)
                {
                    string hshValue = "";
                    foreach (string sCol in lstSrcKeys)
                    {
                        hshValue += drSrc[sCol];
                    }
                    drSrc.SetField("Hash", Tools.HashFNV1a_64_ABS(hshValue));

                }
            //Adding the hash field
            DataColumn[] dcSrc = new DataColumn[1];
            dcSrc[0] = dtSrc.Columns["Hash"];
            dtSrc.PrimaryKey = dcSrc;

            dtDest.Columns.Add("Hash", (typeof(Int64)));
            //Surely there must be a vectorised way to do this?
                //Parallel.ForEach()
            //Or at least a parallel way. Do the parallel loop in next iteration
                foreach (DataRow drDest in dtDest.Rows)
                {
                    string hshValue = "";
                    foreach (string sCol in lstDestKeys)
                    {
                        hshValue += drDest[sCol];
                    }
                    drDest.SetField("Hash", Tools.HashFNV1a_64_ABS(hshValue));

                }
            DataColumn[] dcDest = new DataColumn[1];
            dcDest[0] = dtDest.Columns["Hash"];
            dtDest.PrimaryKey = dcDest;

            dtMatched = dtSrc.Clone();
            foreach (DataColumn dc in dtMatched.Columns)
            {
                dc.ColumnName = "Src" + dc.ColumnName;
            }
            foreach( DataColumn dcTmp in dtDest.Columns)
            {
                dtMatched.Columns.Add(
                    new DataColumn( "Dest" + dcTmp.ColumnName, dcTmp.DataType)
                    );
            }
            
            dtMatchedBalanced = dtMatched.Clone();
            dtMatchedUnbalanced = dtMatched.Clone();

            dtSrcUnmatched = dtSrc.Clone();
            dtDestUnmatched = dtDest.Clone();

            dictSrcKeys = new Dictionary<string, int>();
            dictDestKeys = new Dictionary<string, int>();
            if (dictMatchFields != null)
            {
                foreach (KeyValuePair<string, string> kvp in dictMatchFields)
                {
                    dictSrcKeys.Add( kvp.Key, dtSrc.Columns.IndexOf(kvp.Key));
                    dictDestKeys.Add( kvp.Value, dtDest.Columns.IndexOf(kvp.Value));
                }
            }

        #endregion
            foreach (DataRow drSrc in dtSrc.Rows)
            {
                #region SourceChecking

                DataRow drDest = dtDest.Rows.Find(drSrc["Hash"]);
                    if (drDest != null)
                    {
                        //Checking if we have a match - using the hash, so it's not perfect.....
                        //For next iteration, add a check for each key field in here. Will still be faster than searching by an arbitrary number of fields
                        object[] Values = new object[drSrc.ItemArray.Length + drDest.ItemArray.Length];
                        for (int i = 0; i < drSrc.ItemArray.Length; i++)
                        {
                            Values[i] = drSrc.ItemArray[i];
                        }
                        for (int i = 0; i < drDest.ItemArray.Length; i++)
                        {
                            Values[i + drSrc.ItemArray.Length] = drDest.ItemArray[i];
                        }

                        DataRow drMatched = dtMatched.Rows.Add(Values);

                        //Check the values
                        //If we have a list of fields to check
                        if (dictMatchFields != null)
                        {
                            foreach( KeyValuePair<string, string> item in dictMatchFields)
                            {
                                object[] BalancedValues = new object[drSrc.ItemArray.Length + drDest.ItemArray.Length];
                                for (int i = 0; i < drSrc.ItemArray.Length; i++)
                                {
                                    BalancedValues[i] = drSrc.ItemArray[i];
                                }
                                for (int i = 0; i < drDest.ItemArray.Length; i++)
                                {
                                    BalancedValues[i + drSrc.ItemArray.Length] = drDest.ItemArray[i];
                                }
                                //if (drSrc.ItemArray[] 
                                if (
                                    drSrc.ItemArray[dictSrcKeys[item.Key]]
                                    ==
                                    drDest.ItemArray[dictDestKeys[item.Value]]
                                    )
                                {
                                    dtMatchedBalanced.Rows.Add(BalancedValues);
                                }
                                else
                                {
                                    dtMatchedUnbalanced.Rows.Add(BalancedValues);
                                }
                            }

                        }
                        /*    //Otherwise check every source fields
                        else
                        {

                        }
                         * */
                        //For a later iteration

                    }
                    else
                    {
                        DataRow drSrcUnmatched = dtSrcUnmatched.Rows.Add(drSrc.ItemArray);
                    }
                #endregion

            }
            foreach (DataRow drDest in dtDest.Rows)
            {
                
                DataRow drSrc = dtDest.Rows.Find(drDest["Hash"]);
                if (drSrc == null)
                {
                    dtDestUnmatched.Rows.Add(drDest.ItemArray);
                }
            }

            


            return 0;
        }
    }
}
