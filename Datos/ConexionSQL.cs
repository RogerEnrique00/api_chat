using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlTypes;
using System.Collections;
using System.Data;

namespace Datos
{
    public class ConexionSQL
    {
        static string cnxstring = "Server=DESKTOP-4T5F7FT; Database=BDCHAT; Trusted_Connection=True;";
        SqlConnection con = new SqlConnection(cnxstring);

        public bool Validarusuario(string Query )
        {
            con.Open();            
            SqlCommand cmd = new SqlCommand(Query, con);
            bool valida = Convert.ToBoolean(cmd.ExecuteScalar());

            con.Close();
            return valida;
        }
       
    }
    



}
