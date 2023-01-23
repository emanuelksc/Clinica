using System;
using System.Collections.Generic;

namespace DataAccess.Models
{
    public partial class TTipoDocumento
    {
        public TTipoDocumento()
        {
            TPaciente = new HashSet<TPaciente>();
        }

        /// <summary>
        /// Identificador de llave primaria de la tabla tipo de documento
        /// </summary>
        public int Id { get; set; }
        public string Nombre { get; set; } = null!;
        public bool Estado { get; set; }
        public string UsuarioCreacion { get; set; } = null!;
        public string UsuarioModificacion { get; set; } = null!;
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }

        public virtual ICollection<TPaciente> TPaciente { get; set; }
    }
}
