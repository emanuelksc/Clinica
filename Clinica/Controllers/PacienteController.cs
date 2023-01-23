using DataAccess.UnitOfWork;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Clinica.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PacienteController : ControllerBase
    {
        private IUnitOfWork _unitOfWork;


        public PacienteController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [HttpGet("AutocompletadoPaciente")]
        public IActionResult ObtenerCombo(string nombreCompleto)
        {
            try
            {
                var data = _unitOfWork.PacienteRepository.ObtenerListaPaciente(nombreCompleto);

                return Ok(data);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
