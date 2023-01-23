using System;
using System.Collections.Generic;

namespace DataAccess.Models
{
    public partial class TErrorInterno
    {
        /// <summary>
        /// Identificador de llave primaria de la tabla Error Interno
        /// </summary>
        public string Id { get; set; } = null!;
        public string? UsuarioSql { get; set; }
        public int? ErrorNumero { get; set; }
        public int? ErrorEstado { get; set; }
        public int? ErrorSeveridad { get; set; }
        public int? ErrorLinea { get; set; }
        public string? ErrorStoredProcedure { get; set; }
        public string? ErrorMensaje { get; set; }
        public string? UsuarioCreacion { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public string? Parametros { get; set; }
    }
}
