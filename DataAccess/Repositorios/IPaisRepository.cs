using DataAccess.Entidades;
using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTOs;
namespace DataAccess.Repositorios
{
    public  interface IPaisRepository
    {

        TPais Add(Pais entidad);
        int Delete(int id, string usuario);
        TPais Update(Pais entidad);

        List<PaisComboDTO> ObtenerListadoCombo();
        //ComboDTO ObtenerPorId(int id);
    }
}
