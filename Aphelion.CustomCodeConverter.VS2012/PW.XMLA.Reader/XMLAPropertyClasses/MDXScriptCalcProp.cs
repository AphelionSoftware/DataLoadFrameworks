using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class MDXScriptCalcProp
    {

        //public Dictionary<string, string> dctAdditionalAnnotations = new Dictionary<string, string>();

        public override string ToString()
        {
            return this.sID;
        }
        public string sID;
        public string sName
        {
            get { return sID; }
            set { sID = value; }
        }

        public string sMainObjectName { get; set; }

        public string sCalculationReference
        {
            get { return sID; }
            set { sID = value; }
        }

        public  MDXScriptCalcProp()
        {
        }
        public MDXScriptCalcProp(string pName)
        {
            this.sID = pName;
        }

        public MDXScriptCalcProp(string pCalculationReference, string pCalculationType, string pFormatString)
        {
            this.sID = pCalculationReference;
            this.sCalculationType = pCalculationType;
            this.sFormatString = pFormatString;
        }
        public MDXScriptCalcProp(string pCalculationReference, string pCalculationType, string pFormatString, string pFormat)
        {
            this.sID = pCalculationReference;
            this.sCalculationType = pCalculationType;
            this.sFormatString = pFormatString;
        }


        public string sFormat = "General";
        public string sFormatString = "''";
        public string sCalculationType = "Member";
        public string sType = "User";
    }
}
