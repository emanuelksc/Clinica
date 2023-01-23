using System;
using System.Collections.Generic;

namespace DataAccess.Models
{
    public partial class VTpacienteAutocompletado
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = null!;
        public string ApellidoPaterno { get; set; } = null!;
    }
}
