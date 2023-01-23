using System;
using System.Collections.Generic;

namespace DataAccess.Models
{
    public partial class TPaciente
    {
        public TPaciente()
        {
            TAsignacionTratamiento = new HashSet<TAsignacionTratamiento>();
        }

        /// <summary>
        /// Identificador de llave primaria de la tabla paciente
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// Identificador de llave foranea de la tabla Pais
        /// </summary>
        public int IdPais { get; set; }
        /// <summary>
        /// Identificador de llave foranea de la tabla Estado Civil
        /// </summary>
        public int IdEstadoCivil { get; set; }
        /// <summary>
        /// Tipo de documento del paciente
        /// </summary>
        public int IdTipoDocumento { get; set; }
        /// <summary>
        /// Sexo del paciente
        /// </summary>
        public int IdSexo { get; set; }
        /// <summary>
        /// Numero de documento del paciente
        /// </summary>
        public string NumeroDocumento { get; set; } = null!;
        /// <summary>
        /// Apellido paterno del paciente
        /// </summary>
        public string ApellidoPaterno { get; set; } = null!;
        /// <summary>
        /// Apellidos materno del paciente
        /// </summary>
        public string ApellidoMaterno { get; set; } = null!;
        /// <summary>
        /// Nombres del paciente
        /// </summary>
        public string Nombre { get; set; } = null!;
        /// <summary>
        /// Fecha de nacimiento del paciente
        /// </summary>
        public DateTime FechaNacimiento { get; set; }
        /// <summary>
        /// Numero de celular del paciente
        /// </summary>
        public string Celular { get; set; } = null!;
        /// <summary>
        /// Correo Electronico del paciente
        /// </summary>
        public string? CorreoElectronico { get; set; }
        /// <summary>
        /// Direccion del domicilio del paciente
        /// </summary>
        public string? Direccion { get; set; }
        public bool Estado { get; set; }
        public string UsuarioCreacion { get; set; } = null!;
        public string UsuarioModificacion { get; set; } = null!;
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }

        public virtual TEstadoCivil IdEstadoCivilNavigation { get; set; } = null!;
        public virtual TPais IdPaisNavigation { get; set; } = null!;
        public virtual TSexo IdSexoNavigation { get; set; } = null!;
        public virtual TTipoDocumento IdTipoDocumentoNavigation { get; set; } = null!;
        public virtual ICollection<TAsignacionTratamiento> TAsignacionTratamiento { get; set; }
    }
}
