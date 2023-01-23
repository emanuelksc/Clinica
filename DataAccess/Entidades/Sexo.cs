using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Entidades
{
    public class Sexo
    {
        public int id { get; set; }
        public string Nombre { get; set; } = null!;
        public bool Estado { get; set; }
    }
}
