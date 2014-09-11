using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class XMLAKPI
    {

        public override string ToString()
        {
            return this.sMeasure;
        }
        /// <summary>
        /// Name: arbitrary name from EP, not used
        /// </summary>
        public string sName;
        /// <summary>
        /// Measure to attach to
        /// </summary>
        public string sMeasure;
        /// <summary>
        /// Goal value
        /// </summary>
        public string sGoal;
        /// <summary>
        /// Upper bound for middle indicator
        /// </summary>
        public string sLT;
        /// <summary>
        /// Lower bound for middle indicator
        /// </summary>
        public string sGT;
        /// <summary>
        /// Graphic to use
        /// </summary>
        public string sGraphic;

    }
}
