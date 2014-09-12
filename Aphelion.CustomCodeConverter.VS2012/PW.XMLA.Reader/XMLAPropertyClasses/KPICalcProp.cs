using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class KPICalcProp: MDXScriptCalcProp
    {
        /*/// 3  is Goal Type
        /// 4  is Goal Value
        /// 5  is Status Type
        /// 6  is Threshold Type
        /// 7  is Threshold Ordering
        /// 8  is Threshold count
        /// 9  is Threshold 0
        /// 10 is Threshold 1
        */
        public string sGoalType  = "StaticValue" ;
        public string sGoalValue;
        public string sStatusType = "Linear";
        public string sThresholdType = "Absolute";
        public string sThresholdOrdering = "Ascending";
        public string sThresholdCount = "2";
        public string sThreshold0;
        public string sThreshold1;

        public KPICalcProp(string pCalculationReference, string pCalculationType, string pFormatString, string pGoalValue, string pThreshold0, string pThreshold1)
        {
            sCalculationReference = pCalculationReference;
            sCalculationType = pCalculationType;
            sFormatString = pFormatString;
            sGoalValue = pGoalValue;
            sThreshold0 = pThreshold0;
            sThreshold1 = pThreshold1;
        }

    }
}
