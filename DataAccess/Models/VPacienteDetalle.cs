using System;
using System.Collections.Generic;

namespace DataAccess.Models
{
    public partial class VPacienteDetalle
    {
        public int Id { get; set; }
        public int IdPais { get; set; }
        public int IdEstadoCivil { get; set; }
        public int IdTipoDocumento { get; set; }
        public int IdSexo { get; set; }
        public string NumeroDocumento { get; set; } = null!;
        public string ApellidoPaterno { get; set; } = null!;
        public string ApellidoMaterno { get; set; } = null!;
        public string Nombre { get; set; } = null!;
        public DateTime FechaNacimiento { get; set; }
        public string Celular { get; set; } = null!;
        public string? CorreoElectronico { get; set; }
        public string? Direccion { get; set; }
    }
}
