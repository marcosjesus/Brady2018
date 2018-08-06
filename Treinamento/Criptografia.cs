using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WebAgencia
{
    public class Criptografia
    {

        public static string Descrypta(string strConexao)
        {
            Byte[] a = Convert.FromBase64String(strConexao);

            string resultado = ASCIIEncoding.ASCII.GetString(a);

            return resultado;
        }

        public static string Encrypta(string senha)
        {
            Byte[] a = ASCIIEncoding.ASCII.GetBytes(senha);

            string resultado = Convert.ToBase64String(a);

            return resultado;
        }
    }
}
