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
    public  interface ISexoRepository
    {
        TSexo Add(Sexo entidad);
        int Delete(int id, string usuario);
        TSexo Update(Sexo entidad);

        List<SexoComboDTO> ObtenerListadoCombo();
    }
}
