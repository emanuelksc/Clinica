using DataAccess.UnitOfWork;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Clinica.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TipoDocumentoController : ControllerBase
    {
        private IUnitOfWork _unitOfWork;


        public TipoDocumentoController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [HttpGet("ObtenerTipoDocumentoCombo")]
        public IActionResult ObtenerCombo()
        {
            try
            {
                var data = _unitOfWork.TipoDocumentoRepository.ObtenerListadoCombo();

                return Ok(data);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
