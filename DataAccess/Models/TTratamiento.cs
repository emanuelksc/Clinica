using System;
using System.Collections.Generic;

namespace DataAccess.Models
{
    public partial class TTratamiento
    {
        public TTratamiento()
        {
            TAsignacionTratamiento = new HashSet<TAsignacionTratamiento>();
        }

        /// <summary>
        /// Identificador de llave primaria de la tabla tratamiento
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// Nombre del Tratamiento
        /// </summary>
        public string Nombre { get; set; } = null!;
        public bool Estado { get; set; }
        public string UsuarioCreacion { get; set; } = null!;
        public string UsuarioModificacion { get; set; } = null!;
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }

        public virtual ICollection<TAsignacionTratamiento> TAsignacionTratamiento { get; set; }
    }
}
