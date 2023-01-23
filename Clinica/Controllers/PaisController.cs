using DataAccess.Models;
using DataAccess.UnitOfWork;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Clinica.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PaisController : ControllerBase
    {
        private IUnitOfWork _unitOfWork;


        public PaisController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [HttpGet("ObtenerPaisCombo")]
        public IActionResult ObtenerCombo()
        {
            try
            {
                var data = _unitOfWork.PaisRepository.ObtenerListadoCombo();

                return Ok(data);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


    }
}
