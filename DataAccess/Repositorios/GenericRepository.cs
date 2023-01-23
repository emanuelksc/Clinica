using DataAccess.Infraestructure;
using DataAccess.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositorios
{
    public class GenericRepository<TEntity> : IGenericRepository<TEntity> where TEntity : BaseEntity
    {
        internal readonly IConnectionFactory connectionFactory;
        private ClinicaContext context;
        internal DbSet<TEntity> entities;

        public GenericRepository(ClinicaContext context, IConnectionFactory connectionFactory)
        {
            this.connectionFactory = connectionFactory;
            this.context = context;
            context.ChangeTracker.QueryTrackingBehavior = QueryTrackingBehavior.NoTracking;
            entities = context.Set<TEntity>();
        }

        public int Add(TEntity entidad)
        {
            try
            {
                entities.Add(entidad);
                return entidad.Id;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int Update(TEntity entidad)
        {
            try
            {
                entities.Update(entidad);
                return entidad.Id;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int Delete(int id, string usuario)
        {
            try
            {
                var entidad = FirstBy(w => w.Id == id && w.Estado == true);
                if (entidad == null)
                    throw new ArgumentNullException($"La Entidad id: {id}, es nula y/o ya fue eliminada");
                if (string.IsNullOrEmpty(usuario) || (usuario != null && usuario.Trim() == ""))
                    throw new ArgumentNullException("El nombre de usuario es nulo y/o no se proporcionó");

                if ((bool)typeof(TEntity).GetProperty("Estado").GetValue(entidad) == false)
                    throw new ArgumentNullException($"Elemento id: {id}, ya fue eliminado previamente");

                typeof(TEntity).GetProperty("Estado").SetValue(entidad, false);
                typeof(TEntity).GetProperty("UsuarioModificacion").SetValue(entidad, usuario);
                typeof(TEntity).GetProperty("FechaModificacion").SetValue(entidad, DateTime.UtcNow.AddHours(-5));

                entities.Update(entidad);
                return entidad.Id;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public TEntity FirstBy(Expression<Func<TEntity, bool>> filter)
        {
            try
            {
                return entities.AsNoTracking().Where(w => w.Estado == true).Where(filter).FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IEnumerable<TEntity> GetBy(Expression<Func<TEntity, bool>> filter)
        {
            try
            {
                return entities.AsNoTracking().Where(w => w.Estado == true).Where(filter).ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
