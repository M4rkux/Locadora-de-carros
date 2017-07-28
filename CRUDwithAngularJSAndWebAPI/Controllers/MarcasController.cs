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
    public class MarcasController : ApiController
    {
        DataAccessContext context = new DataAccessContext();

        //Get All Marcas
        [HttpGet]
        public IEnumerable<MarcasViewModel> GetAllMarcas()
        {

            var data = context.Marcas.ToList().OrderBy(x => x.Nome);
            var result = data.Select(x => new MarcasViewModel()
            {
                ID = x.ID,
                Nome = x.Nome
            });
            return result.ToList();
        }

        //Get the single Marca data
        [HttpGet]
        public MarcasViewModel GetMarca(int Id)
        {
            var data = context.Marcas.Where(x => x.ID == Id).FirstOrDefault();
            if (data != null)
            {
                MarcasViewModel marca = new MarcasViewModel();
                marca.ID = data.ID;
                marca.Nome = data.Nome;

                return marca;
            }
            else
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }
        }

    }
}
