namespace Locadora_de_Carros.ViewModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public class CombustiveisViewModel
    {
        public string Tipo { get; set; }
        public int ID { get; set; }
    }
}
