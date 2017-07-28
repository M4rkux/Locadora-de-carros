namespace Locadora_de_Carros.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class DataAccessContext : DbContext
    {
        public DataAccessContext()
            : base("name=DataAccessContext")
        {
        }

        public virtual DbSet<Cambios> Cambios { get; set; }
        public virtual DbSet<Carros> Carros { get; set; }
        public virtual DbSet<Combustiveis> Combustiveis { get; set; }
        public virtual DbSet<Marcas> Marcas { get; set; }
        public virtual DbSet<Modelos> Modelos { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Cambios>()
                .Property(e => e.Tipo)
                .IsUnicode(false);

            modelBuilder.Entity<Cambios>()
                .HasMany(e => e.Carros)
                .WithRequired(e => e.Cambios)
                .HasForeignKey(e => e.cambio_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Carros>()
                .Property(e => e.Cor)
                .IsUnicode(false);

            modelBuilder.Entity<Combustiveis>()
                .Property(e => e.Tipo)
                .IsUnicode(false);

            modelBuilder.Entity<Combustiveis>()
                .HasMany(e => e.Carros)
                .WithRequired(e => e.Combustiveis)
                .HasForeignKey(e => e.combustivel_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Marcas>()
                .Property(e => e.Nome)
                .IsUnicode(false);

            modelBuilder.Entity<Marcas>()
                .HasMany(e => e.Modelos)
                .WithRequired(e => e.Marcas)
                .HasForeignKey(e => e.marca_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Modelos>()
                .Property(e => e.Nome)
                .IsUnicode(false);

            modelBuilder.Entity<Modelos>()
                .HasMany(e => e.Carros)
                .WithRequired(e => e.Modelos)
                .HasForeignKey(e => e.modelo_id)
                .WillCascadeOnDelete(false);

        }
    }
}
