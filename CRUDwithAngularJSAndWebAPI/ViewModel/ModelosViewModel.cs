namespace Locadora_de_Carros.ViewModels
{
    using Locadora_de_Carros.Models;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public class ModelosViewModel
    {
        public string Nome { get; set; }
        public int ID { get; set; }
        public int marca_id { get; set; }
        public virtual Marcas Marcas { get; set; }
    }
}
