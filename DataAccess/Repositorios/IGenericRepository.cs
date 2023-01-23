using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using static Dapper.SqlMapper;

namespace DataAccess.Repositorios
{
    public  interface IGenericRepository<TEntity> where TEntity : BaseEntity
    {
        int Add(TEntity entidad);
        int Delete(int id, string usuario);
        int Update(TEntity entidad);
        TEntity FirstBy(Expression<Func<TEntity, bool>> filter);
        IEnumerable<TEntity> GetBy(Expression<Func<TEntity, bool>> filter);
    }
}
