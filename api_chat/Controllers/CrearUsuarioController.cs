using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using api_chat.Models;
using System.Data;
using System.Data.SqlClient;
namespace api_chat.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CrearUsuarioController : ControllerBase
    {
        private readonly string cadenaSQL;
        public CrearUsuarioController(IConfiguration config)
        {
            cadenaSQL = config.GetConnectionString("CadenaSQL");
        }

        [HttpPost]
        [Route("Guardar")]
        public IActionResult Guardar([FromBody] Usuario objeto)
        {
            try
            {

                using (var conexion = new SqlConnection(cadenaSQL))
                {
                    conexion.Open();
                    var cmd = new SqlCommand("sp_guardar_usuario", conexion);
                    cmd.Parameters.AddWithValue("cedula", objeto.cedula);              
                    cmd.Parameters.AddWithValue("clave", objeto.clave);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                }

                return StatusCode(StatusCodes.Status200OK, new { mensaje = "Usuario Creado" });
            }
            catch (Exception error)
            {

                return StatusCode(StatusCodes.Status500InternalServerError, new { mensaje = error.Message });

            }
        }

    }

}

