using api_chat.Models;
using Microsoft.AspNetCore.Mvc;

namespace api_chat.Models
{
    public class Usuario
    {
        public string cedula { get; set; }
        public string clave { get; set; }        
        



        //public bool Validarusuario(string _Cedula, string _Clave)
        //{
        //    cedula = _Cedula;
        //    clave = _Clave;

        //    //bool valida = Bd.Validarlogin("select count(*) from[dbo].[usuario] where cedula = '" + cedula + "' and contraseña = '" + clave + "'");

        //    return valida;
        //}
    }
}
