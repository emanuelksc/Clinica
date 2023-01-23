using System;
using System.Collections.Generic;

namespace DataAccess.Models
{
    public partial class TSexo
    {
        public TSexo()
        {
            TPaciente = new HashSet<TPaciente>();
        }

        /// <summary>
        /// Identificador de  llave primaria de la tabla sexo
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// Nombre del sexo del paciente
        /// </summary>
        public string Nombre { get; set; } = null!;
        public bool Estado { get; set; }
        public string UsuarioCreacion { get; set; } = null!;
        public string UsuarioModificacion { get; set; } = null!;
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }

        public virtual ICollection<TPaciente> TPaciente { get; set; }
    }
}
