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
    public  interface ITipoDocumentoRepository
    {
        TTipoDocumento Add(TipoDocumento entidad);
        int Delete(int id, string usuario);
        TTipoDocumento Update(TipoDocumento entidad);

        List<TipoDocumentoComboDTO> ObtenerListadoCombo();
        //ComboDTO ObtenerPorId(int id);
    }
}
