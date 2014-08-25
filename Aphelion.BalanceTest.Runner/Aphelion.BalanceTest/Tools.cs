using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aphelion.BalanceTest
{

    public static class Tools
    {
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
