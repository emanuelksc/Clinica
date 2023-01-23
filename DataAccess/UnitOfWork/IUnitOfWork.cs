using DataAccess.Repositorios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.UnitOfWork
{
    public  interface IUnitOfWork
    {
        IPaisRepository PaisRepository { get; }
        ISexoRepository SexoRepository { get; }

        ITipoDocumentoRepository TipoDocumentoRepository { get; }

        IEstadoCivilRepository EstadoCivilRepository { get; }

        ITratamientoRepository TratamientoRepository { get; }
        IPacienteRepository PacienteRepository { get; }
        void Commit();
    }
}
