﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aphelion.DW.StagingCreate
{
    public static class Extensions
    {
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
    }
}
