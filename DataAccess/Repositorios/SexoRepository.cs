using AutoMapper;
using Dapper;
using DataAccess.Entidades;
using DataAccess.Infraestructure;
using DataAccess.Models;
using DTOs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositorios
{
    public  class SexoRepository : GenericRepository<TSexo>, ISexoRepository
    {
        private Mapper mapper;

        public SexoRepository(ClinicaContext context, IConnectionFactory connectionFactory) : base(context, connectionFactory)
        {
            var config = new MapperConfiguration(cfg => cfg.CreateMap<Pais, TPais>(MemberList.None).ReverseMap());
            mapper = new Mapper(config);
        }

        public TSexo Add(Sexo entidad)
        {
            try
            {
                var sexo = mapper.Map<TSexo>(entidad);
                base.Add(sexo);
                return sexo;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public TSexo Update(Sexo entidad)
        {
            try
            {
                var Sexo = mapper.Map<TSexo>(entidad);
                base.Update(Sexo);
                return Sexo;
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
                base.Delete(id, usuario);
                return id;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<SexoComboDTO> ObtenerListadoCombo()
        {
            try
            {
                var query = "SP_Obtener_ListaSexoEstado_Combo";
                using (var conn = connectionFactory.GetConnection)
                {
                    var rpta = SqlMapper.Query<SexoComboDTO>(conn, query, param: null, commandType: CommandType.StoredProcedure);
                    return rpta.ToList();
                }
            }
            catch (Exception ex)
            {
                //var error = new Error();
                //error.Message = "CategoriaRepository" + ex.Message;
                //error.Exception = ex;
                //error.Operation = "ObtenerListadoCombo";
                //error.Code = TiposError.NoInsertado;
                //error.Objeto = JsonConvert.SerializeObject(null);

                //LogErp.EscribirBaseDatos(error);
                throw ex;
            }
        }

        //public ComboDTO ObtenerPorId(int id)
        //{
        //    try
        //    {
        //        var query = "SP_Obtener_Categoria_PorId";
        //        DynamicParameters listadoParametros = new DynamicParameters();
        //        listadoParametros.Add("@Id", id);
        //        using (var conn = connectionFactory.GetConnection)
        //        {
        //            var rpta = SqlMapper.Query<ComboDTO>(conn, query, param: listadoParametros, commandType: CommandType.StoredProcedure);
        //            return rpta.FirstOrDefault();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
    }
}
