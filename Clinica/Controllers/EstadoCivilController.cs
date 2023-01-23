using DataAccess.UnitOfWork;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Clinica.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EstadoCivilController : ControllerBase
    {
        private IUnitOfWork _unitOfWork;


        public EstadoCivilController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [HttpGet("ObtenerEstadoCivilCombo")]
        public IActionResult ObtenerCombo()
        {
            try
            {
                var data = _unitOfWork.EstadoCivilRepository.ObtenerListadoCombo();

                return Ok(data);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
