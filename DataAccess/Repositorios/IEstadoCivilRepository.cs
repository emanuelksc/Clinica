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
    public  interface IEstadoCivilRepository
    {

        TEstadoCivil Add(EstadoCivil entidad);
        int Delete(int id, string usuario);
        TEstadoCivil Update(EstadoCivil entidad);

        List<EstadoCivilComboDTO> ObtenerListadoCombo();
        //ComboDTO ObtenerPorId(int id);
    }
}
