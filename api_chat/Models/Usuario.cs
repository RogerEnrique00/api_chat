using api_chat.Models;
using Datos;
using Microsoft.AspNetCore.Mvc;

namespace api_chat.Models
{
    public class Usuario
    {
        public string cedula { get; set; }
        public string clave { get; set; }
        public bool Validarusuario(string _Cedula, string _clave)
        {
            cedula = _Cedula;
            clave= _clave;

            Datos.ConexionSQL Bd = new ConexionSQL();
            bool valida = Bd.Validarusuario("select count(*) from[dbo].[usuario] where cedula = '" + cedula + "' and clave = '" + clave + "'");

            return valida;
        }

    }
}
