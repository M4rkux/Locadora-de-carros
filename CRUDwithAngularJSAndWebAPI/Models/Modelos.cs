namespace Locadora_de_Carros.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Modelos
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Modelos()
        {
            Carros = new HashSet<Carros>();
        }

        [Required]
        [StringLength(50)]
        public string Nome { get; set; }

        public int marca_id { get; set; }

        public int ID { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Carros> Carros { get; set; }

        [ForeignKey("marca_id")]
        public virtual Marcas Marcas { get; set; }
    }
}
