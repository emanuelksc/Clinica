using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace DataAccess.Models
{
    public partial class ClinicaContext : DbContext
    {
        public ClinicaContext()
        {
        }

        public ClinicaContext(DbContextOptions<ClinicaContext> options)
            : base(options)
        {
        }

        public virtual DbSet<TAsignacionTratamiento> TAsignacionTratamiento { get; set; } = null!;
        public virtual DbSet<TErrorInterno> TErrorInterno { get; set; } = null!;
        public virtual DbSet<TEstadoCivil> TEstadoCivil { get; set; } = null!;
        public virtual DbSet<TPaciente> TPaciente { get; set; } = null!;
        public virtual DbSet<TPais> TPais { get; set; } = null!;
        public virtual DbSet<TSexo> TSexo { get; set; } = null!;
        public virtual DbSet<TTipoDocumento> TTipoDocumento { get; set; } = null!;
        public virtual DbSet<TTratamiento> TTratamiento { get; set; } = null!;
        public virtual DbSet<VPacienteDetalle> VPacienteDetalle { get; set; } = null!;
        public virtual DbSet<VTestadoCivilObtenerCombo> VTestadoCivilObtenerCombo { get; set; } = null!;
        public virtual DbSet<VTpacienteAutocompletado> VTpacienteAutocompletado { get; set; } = null!;
        public virtual DbSet<VTpaisObtenerCombo> VTpaisObtenerCombo { get; set; } = null!;
        public virtual DbSet<VTsexoObtenerCombo> VTsexoObtenerCombo { get; set; } = null!;
        public virtual DbSet<VTtipoDocumentoObtenerCombo> VTtipoDocumentoObtenerCombo { get; set; } = null!;
        public virtual DbSet<VTtratamientoObtenerCombo> VTtratamientoObtenerCombo { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=localhost; Initial Catalog=Clinica; Persist Security Info=False; User ID=emanuel; Password=abc1234++;MultipleActiveResultSets=False; Encrypt=True; TrustServerCertificate=True; Connection Timeout=30;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TAsignacionTratamiento>(entity =>
            {
                entity.ToTable("T_AsignacionTratamiento");

                entity.Property(e => e.Id).HasComment("Identificador de llave primaria de la tabla Asigacion de Tratamiento");

                entity.Property(e => e.Cantidad).HasComment("Cantidad de tratamientos");

                entity.Property(e => e.DescripcionTratamiento)
                    .IsUnicode(false)
                    .HasComment("Descripcion del tratamiento");

                entity.Property(e => e.FechaCreacion).HasColumnType("datetime");

                entity.Property(e => e.FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.FechaTratamiento)
                    .HasColumnType("datetime")
                    .HasComment("Fecha del trataminento del paciente");

                entity.Property(e => e.FotoTratamiento)
                    .IsUnicode(false)
                    .HasComment("Foto del tratamiento");

                entity.Property(e => e.IdPaciente).HasComment("Identificador de llave foranea de la tabla Paciente");

                entity.Property(e => e.IdTratamiento).HasComment("Identificador de la llave foranea de la tabla tratamiento");

                entity.Property(e => e.MontoTotal)
                    .HasColumnType("decimal(7, 2)")
                    .HasComment("Monto total a pagar por el paciente");

                entity.Property(e => e.Observaciones)
                    .HasMaxLength(250)
                    .IsUnicode(false)
                    .HasComment("Observacion del tratamiento");

                entity.Property(e => e.Precio)
                    .HasColumnType("decimal(7, 2)")
                    .HasComment("Precio del tratamiento");

                entity.Property(e => e.UsuarioCreacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.UsuarioModificacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdPacienteNavigation)
                    .WithMany(p => p.TAsignacionTratamiento)
                    .HasForeignKey(d => d.IdPaciente)
                    .HasConstraintName("FK_T_AsignacionTratamiento_T_Paciente");

                entity.HasOne(d => d.IdTratamientoNavigation)
                    .WithMany(p => p.TAsignacionTratamiento)
                    .HasForeignKey(d => d.IdTratamiento)
                    .HasConstraintName("FK_T_AsignacionTratamiento_T_Tratamiento");
            });

            modelBuilder.Entity<TErrorInterno>(entity =>
            {
                entity.ToTable("T_ErrorInterno");

                entity.Property(e => e.Id)
                    .HasMaxLength(10)
                    .IsFixedLength()
                    .HasComment("Identificador de llave primaria de la tabla Error Interno");

                entity.Property(e => e.ErrorStoredProcedure)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.FechaCreacion).HasColumnType("datetime");

                entity.Property(e => e.Parametros).IsUnicode(false);

                entity.Property(e => e.UsuarioCreacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.UsuarioSql)
                    .HasMaxLength(10)
                    .IsFixedLength();
            });

            modelBuilder.Entity<TEstadoCivil>(entity =>
            {
                entity.ToTable("T_EstadoCivil");

                entity.Property(e => e.Id).HasComment("Identificador de llave primaria de la tabla Estado Civil");

                entity.Property(e => e.FechaCreacion).HasColumnType("datetime");

                entity.Property(e => e.FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(15)
                    .IsUnicode(false)
                    .HasComment("Nombre del estado civil");

                entity.Property(e => e.UsuarioCreacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.UsuarioModificacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TPaciente>(entity =>
            {
                entity.ToTable("T_Paciente");

                entity.Property(e => e.Id).HasComment("Identificador de llave primaria de la tabla paciente");

                entity.Property(e => e.ApellidoMaterno)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasComment("Apellidos materno del paciente");

                entity.Property(e => e.ApellidoPaterno)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasComment("Apellido paterno del paciente");

                entity.Property(e => e.Celular)
                    .HasMaxLength(9)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("Numero de celular del paciente");

                entity.Property(e => e.CorreoElectronico)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasComment("Correo Electronico del paciente");

                entity.Property(e => e.Direccion)
                    .HasMaxLength(200)
                    .IsUnicode(false)
                    .HasComment("Direccion del domicilio del paciente");

                entity.Property(e => e.FechaCreacion).HasColumnType("datetime");

                entity.Property(e => e.FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.FechaNacimiento)
                    .HasColumnType("date")
                    .HasComment("Fecha de nacimiento del paciente");

                entity.Property(e => e.IdEstadoCivil).HasComment("Identificador de llave foranea de la tabla Estado Civil");

                entity.Property(e => e.IdPais).HasComment("Identificador de llave foranea de la tabla Pais");

                entity.Property(e => e.IdSexo).HasComment("Sexo del paciente");

                entity.Property(e => e.IdTipoDocumento).HasComment("Tipo de documento del paciente");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasComment("Nombres del paciente");

                entity.Property(e => e.NumeroDocumento)
                    .HasMaxLength(11)
                    .IsUnicode(false)
                    .HasComment("Numero de documento del paciente");

                entity.Property(e => e.UsuarioCreacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.UsuarioModificacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.IdEstadoCivilNavigation)
                    .WithMany(p => p.TPaciente)
                    .HasForeignKey(d => d.IdEstadoCivil)
                    .HasConstraintName("FK_T_Paciente_T_EstadoCivil1");

                entity.HasOne(d => d.IdPaisNavigation)
                    .WithMany(p => p.TPaciente)
                    .HasForeignKey(d => d.IdPais)
                    .HasConstraintName("FK_T_Paciente_T_Pais");

                entity.HasOne(d => d.IdSexoNavigation)
                    .WithMany(p => p.TPaciente)
                    .HasForeignKey(d => d.IdSexo)
                    .HasConstraintName("FK_T_Paciente_T_Sexo");

                entity.HasOne(d => d.IdTipoDocumentoNavigation)
                    .WithMany(p => p.TPaciente)
                    .HasForeignKey(d => d.IdTipoDocumento)
                    .HasConstraintName("FK_T_Paciente_T_TipoDocumento");
            });

            modelBuilder.Entity<TPais>(entity =>
            {
                entity.ToTable("T_Pais");

                entity.Property(e => e.Id).HasComment("Identificador de llave primaria de la tabla Pais");

                entity.Property(e => e.FechaCreacion).HasColumnType("datetime");

                entity.Property(e => e.FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasComment("Nombre del Pais");

                entity.Property(e => e.UsuarioCreacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.UsuarioModificacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TSexo>(entity =>
            {
                entity.ToTable("T_Sexo");

                entity.Property(e => e.Id).HasComment("Identificador de  llave primaria de la tabla sexo");

                entity.Property(e => e.FechaCreacion).HasColumnType("datetime");

                entity.Property(e => e.FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasComment("Nombre del sexo del paciente");

                entity.Property(e => e.UsuarioCreacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.UsuarioModificacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TTipoDocumento>(entity =>
            {
                entity.ToTable("T_TipoDocumento");

                entity.Property(e => e.Id).HasComment("Identificador de llave primaria de la tabla tipo de documento");

                entity.Property(e => e.FechaCreacion).HasColumnType("datetime");

                entity.Property(e => e.FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.UsuarioCreacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.UsuarioModificacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TTratamiento>(entity =>
            {
                entity.ToTable("T_Tratamiento");

                entity.Property(e => e.Id).HasComment("Identificador de llave primaria de la tabla tratamiento");

                entity.Property(e => e.FechaCreacion).HasColumnType("datetime");

                entity.Property(e => e.FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasComment("Nombre del Tratamiento");

                entity.Property(e => e.UsuarioCreacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.UsuarioModificacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<VPacienteDetalle>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("V_Paciente_Detalle");

                entity.Property(e => e.ApellidoMaterno)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ApellidoPaterno)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Celular)
                    .HasMaxLength(9)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.CorreoElectronico)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Direccion)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.FechaNacimiento).HasColumnType("date");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.NumeroDocumento)
                    .HasMaxLength(11)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<VTestadoCivilObtenerCombo>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("V_TEstadoCivil_ObtenerCombo");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Nombre)
                    .HasMaxLength(15)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<VTpacienteAutocompletado>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("V_TPaciente_Autocompletado");

                entity.Property(e => e.ApellidoPaterno)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<VTpaisObtenerCombo>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("V_TPais_ObtenerCombo");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<VTsexoObtenerCombo>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("V_TSexo_ObtenerCombo");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Nombre)
                    .HasMaxLength(10)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<VTtipoDocumentoObtenerCombo>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("V_TTipoDocumento_ObtenerCombo");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<VTtratamientoObtenerCombo>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("V_TTratamiento_ObtenerCombo");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
