using System;
using System.Collections.Generic;

namespace DataAccess.Models
{
    public partial class TEstadoCivil
    {
        public TEstadoCivil()
        {
            TPaciente = new HashSet<TPaciente>();
        }

        /// <summary>
        /// Identificador de llave primaria de la tabla Estado Civil
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// Nombre del estado civil
        /// </summary>
        public string? Nombre { get; set; }
        public bool Estado { get; set; }
        public string UsuarioCreacion { get; set; } = null!;
        public string UsuarioModificacion { get; set; } = null!;
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }

        public virtual ICollection<TPaciente> TPaciente { get; set; }
    }
}
