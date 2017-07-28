namespace Locadora_de_Carros.ViewModels
{
    using Locadora_de_Carros.Models;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public class CarrosViewModel
    {
        public Modelos Modelo { get; set; }
        public int Ano { get; set; }
        public string Cor { get; set; }
        public long KM { get; set; }
        public Cambios Cambio { get; set; }
        public Combustiveis Combustivel { get; set; }
        public double Valor { get; set; }
        public string Imagem { get; set; }
        public int ID { get; set; }

        public int modelo_id { get; set; }
        public int cambio_id { get; set; }
        public int combustivel_id { get; set; }
    }
}
