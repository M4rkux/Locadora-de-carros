namespace Locadora_de_Carros.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Carros
    {
        public int modelo_id { get; set; }

        public int Ano { get; set; }

        [Required]
        [StringLength(50)]
        public string Cor { get; set; }

        public long KM { get; set; }

        public int cambio_id { get; set; }

        public int combustivel_id { get; set; }

        public double Valor { get; set; }

        [Column(TypeName = "image")]
        public byte[] Imagem { get; set; }

        public int ID { get; set; }

        public virtual Cambios Cambios { get; set; }

        public virtual Combustiveis Combustiveis { get; set; }

        public virtual Modelos Modelos { get; set; }
    }
}
