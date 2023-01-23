using DataAccess.Infraestructure;
using DataAccess.Models;
using DataAccess.Repositorios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork, IDisposable
    {
        private IConnectionFactory _connectionFactory;
        public ClinicaContext _context;

        //private IPacientesRepository _pacienteRepository;
        //IOrigenPrestacionRepository IUnitOfWork.OrigenPrestacionRepository
        //{
        //    get
        //    {
        //        return _origenPrestacionRepository ?? new OrigenPrestacionRepository(_context, _connectionFactory);
        //    }
        //}

        private IPaisRepository _paisRepository;
        private ISexoRepository _sexoRepository;
        private ITipoDocumentoRepository _tipodocumentoRepository;
        private IEstadoCivilRepository _estadoCivilRepository;
        private ITratamientoRepository _tratamientoRepository;
        private IPacienteRepository _pacienteRepository;
        IPaisRepository IUnitOfWork.PaisRepository
        {
            get
            {
                return _paisRepository ?? new PaisRepository(_context, _connectionFactory);
            }
        }
        ISexoRepository IUnitOfWork.SexoRepository
        {
            get
            {
                return _sexoRepository ?? new SexoRepository(_context, _connectionFactory);
            }
        }
        ITipoDocumentoRepository IUnitOfWork.TipoDocumentoRepository
        {
            get
            {
                return _tipodocumentoRepository ?? new TipoDocumentoRepository(_context, _connectionFactory);
            }
        }
        IEstadoCivilRepository IUnitOfWork.EstadoCivilRepository
        {
            get
            {
                return _estadoCivilRepository ?? new EstadoCivilRepository(_context, _connectionFactory);
            }
        }
        ITratamientoRepository IUnitOfWork.TratamientoRepository
        {
            get
            {
                return _tratamientoRepository ?? new TratamientoRepository(_context, _connectionFactory);
            }
        }
        IPacienteRepository IUnitOfWork.PacienteRepository
        {
            get
            {
                return _pacienteRepository ?? new PacienteRepository(_context, _connectionFactory);
            }
        }
        public UnitOfWork(ClinicaContext context, IConnectionFactory connectionFactory)
        {
            _context = context;
            _connectionFactory = connectionFactory;
        }


        public void Commit()
        {
            try
            {
                _context.SaveChanges();
                //_context.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void Rollback()
        {
            try
            {

                _context.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
