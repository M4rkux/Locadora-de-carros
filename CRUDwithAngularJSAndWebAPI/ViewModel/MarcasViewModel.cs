namespace Locadora_de_Carros.ViewModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public class MarcasViewModel
    {
        public string Nome { get; set; }
        public int ID { get; set; }
    }
}
