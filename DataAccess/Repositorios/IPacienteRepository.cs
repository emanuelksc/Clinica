using DataAccess.Entidades;
using DataAccess.Models;
using DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositorios
{
    public  interface IPacienteRepository
    {
        TPaciente Add(Paciente entidad);
        int Delete(int id, string usuario);
        TPaciente Update(Paciente entidad);

        List<PacienteAutoCompletado> ObtenerListaPaciente(string nombrePaciente);
    }
}
