using Locadora_de_Carros.Models;
using Locadora_de_Carros.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Locadora_de_Carros.Controllers
{
    public class ModelosController : ApiController
    {
        DataAccessContext context = new DataAccessContext();

        //Get All Modelos
        [HttpGet]
        public IEnumerable<ModelosViewModel> GetAllModelos()
        {

            var data = context.Modelos.ToList().OrderBy(x => x.Nome);
            var result = data.Select(x => new ModelosViewModel()
            {
                ID = x.ID,
                Nome = x.Nome
            });
            return result.ToList();
        }

        //Get All Modelos by Marca
        [HttpGet]
        public IEnumerable<ModelosViewModel> GetAllModelosByMarca(int Id)
        {

            var data = context.Modelos.ToList().Where(x => x.marca_id == Id).OrderBy(x => x.Nome);
            var result = data.Select(x => new ModelosViewModel()
            {
                ID = x.ID,
                Nome = x.Nome
            });
            return result.ToList();
        }

        //Get the single Modelo data
        [HttpGet]
        public ModelosViewModel GetModelo(int Id)
        {
            var data = context.Modelos.Where(x => x.ID == Id).FirstOrDefault();
            if (data != null)
            {
                ModelosViewModel modelo = new ModelosViewModel();
                modelo.ID = data.ID;
                modelo.Nome = data.Nome;
                modelo.marca_id = data.marca_id;
                modelo.Marcas = data.Marcas;

                return modelo;
            }
            else
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }
        }
    }
}
