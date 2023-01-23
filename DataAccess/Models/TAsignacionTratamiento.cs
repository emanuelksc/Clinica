using System;
using System.Collections.Generic;

namespace DataAccess.Models
{
    public partial class TAsignacionTratamiento
    {
        /// <summary>
        /// Identificador de llave primaria de la tabla Asigacion de Tratamiento
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// Identificador de llave foranea de la tabla Paciente
        /// </summary>
        public int IdPaciente { get; set; }
        /// <summary>
        /// Identificador de la llave foranea de la tabla tratamiento
        /// </summary>
        public int IdTratamiento { get; set; }
        /// <summary>
        /// Precio del tratamiento
        /// </summary>
        public decimal Precio { get; set; }
        /// <summary>
        /// Cantidad de tratamientos
        /// </summary>
        public int Cantidad { get; set; }
        /// <summary>
        /// Fecha del trataminento del paciente
        /// </summary>
        public DateTime FechaTratamiento { get; set; }
        /// <summary>
        /// Descripcion del tratamiento
        /// </summary>
        public string? DescripcionTratamiento { get; set; }
        /// <summary>
        /// Monto total a pagar por el paciente
        /// </summary>
        public decimal MontoTotal { get; set; }
        /// <summary>
        /// Foto del tratamiento
        /// </summary>
        public string? FotoTratamiento { get; set; }
        /// <summary>
        /// Observacion del tratamiento
        /// </summary>
        public string? Observaciones { get; set; }
        public bool Estado { get; set; }
        public string UsuarioCreacion { get; set; } = null!;
        public string UsuarioModificacion { get; set; } = null!;
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }

        public virtual TPaciente IdPacienteNavigation { get; set; } = null!;
        public virtual TTratamiento IdTratamientoNavigation { get; set; } = null!;
    }
}
