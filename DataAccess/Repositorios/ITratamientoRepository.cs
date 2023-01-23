using DataAccess.Entidades;
using DataAccess.Models;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositorios
{
    public  interface ITratamientoRepository
    {
        TTratamiento Add(Tratamiento entidad);
        int Delete(int id, string usuario);
        TTratamiento Update(Tratamiento entidad);

        List<TratamientoComboDTO> ObtenerListadoCombo();
    }
}
