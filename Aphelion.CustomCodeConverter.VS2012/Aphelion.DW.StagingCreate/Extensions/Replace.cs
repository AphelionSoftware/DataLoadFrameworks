using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aphelion.DW.StagingCreate
{
    public static class Extensions
    {

        public static string ColumnNameFix(string pInner, string pOuter, string sTable, string sSourceKey, out string Prefix, out string Suffix)
        {
            string sMid;
            //Optimising for full prefix/postfix
            if (pOuter.EndsWith(pInner))
            {
                Prefix = pOuter.Replace(pInner, "");
                Suffix = "";
                sMid = sTable;
            }
            else
                if (pOuter.StartsWith(pInner))
                {
                    Prefix = "";
                    Suffix = pOuter.Replace(pInner, "");
                    sMid = sTable;
                }
                else
                {
                    sMid = StringExtract(pInner, pOuter, out Prefix, out Suffix);
                }

            string sReplaceKey;
            if (pInner.StartsWith(sTable) || pInner.EndsWith(sTable))
            {
                sReplaceKey = pInner.Replace(sTable, "");
            }
            else
            {
                string pFix;
                string pSuf;
                try
                {
                    sReplaceKey = StringExtract(sTable, pInner, out pFix, out pSuf);
                }
                catch (System.Exception ex)
                {
                    sReplaceKey = StringExtract(sTable, pOuter, out pFix, out pSuf);
                    /*if (pOuter.Length <= pInner.Length)
                    {
                        sReplaceKey = StringExtract(pOuter, pInner, out pFix, out pSuf);
                    }
                    else
                    {
                        sReplaceKey = StringExtract(pInner, pOuter, out pFix, out pSuf);
                    }*/
                }
            }
            if (Suffix == "" || sReplaceKey == "")
            {
                return Prefix + sMid + sSourceKey;
            }
            else
            {
                return Prefix + sMid + Suffix.Replace(sReplaceKey, sSourceKey);
            }

        }

        public static string StringExtract(string pInner, string pOuter, out string Prefix, out string Suffix)
        {

            string cStr = "";
            char[] cInner = new char[pInner.Length];
            pInner.CopyTo(0, cInner, 0, pInner.Length);
            char[] cOuter = new char[pOuter.Length];
            pOuter.CopyTo(0, cOuter, 0, pOuter.Length);
            int iDiff = pOuter.Length - pInner.Length;
            int iStart = 0;

            char[] cResult = new char[pOuter.Length - pInner.Length];

            for (int iLoop = pOuter.Length - 1; iLoop >= 0; iLoop--)
            {
                int iPos = iLoop - iDiff;

                if (cOuter[iLoop] != cInner[iPos])
                {
                    cStr += cOuter[iLoop].ToString();
                    iDiff--;
                    if (iStart <= 0)
                    {
                        iStart = cInner.Length + iStart;
                    }
                }
                else
                {
                    if (iStart <= 0)
                    {
                        iStart--;
                    }

                }
            }
            cStr = new string(cStr.ToCharArray().Reverse().ToArray());
            Prefix = pOuter.Substring(0, iStart);
            if ((iStart + cStr.Length) < pOuter.Length)
            {
                Suffix = pOuter.Substring(iStart + cStr.Length);
            }
            else
            {
                Suffix = pOuter.Replace(Prefix, "");
            }
            return cStr;


        }
    
        public static string Replace(this string str, string oldValue, string newValue, StringComparison comparison)
        {
            if (oldValue == "")
            {
                return str;
            }
            StringBuilder sb = new StringBuilder();

            int previousIndex = 0;
            int index = str.IndexOf(oldValue, comparison);
            while (index != -1)
            {
                sb.Append(str.Substring(previousIndex, index - previousIndex));
                sb.Append(newValue);
                index += oldValue.Length;

                previousIndex = index;
                index = str.IndexOf(oldValue, index, comparison);
            }
            sb.Append(str.Substring(previousIndex));

            return sb.ToString();
        }

        public static long HashFNV1a_64_ABS(string value)
        {
            ulong offset64 = 0xcbf29ce484222325;
            ulong prime64 = 1099511628211;
            ulong hash = offset64;

            byte[] bytes = Encoding.UTF8.GetBytes(value.ToLower());

            for (int i = 0; i < bytes.Length; i++)
            {
                hash = (hash ^ bytes[i]) * prime64;
            }
            return Math.Abs((long)(hash - long.MaxValue));

        }
    
    }

    
}
