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
    public class CombustiveisController : ApiController
    {
        DataAccessContext context = new DataAccessContext();

        //Get All Combustiveis
        [HttpGet]
        public IEnumerable<CombustiveisViewModel> GetAllCombustiveis()
        {

            var data = context.Combustiveis.ToList().OrderBy(x => x.Tipo);
            var result = data.Select(x => new CombustiveisViewModel()
            {
                ID = x.ID,
                Tipo = x.Tipo
            });
            return result.ToList();
        }

        //Get the single Combustiveis data
        [HttpGet]
        public CombustiveisViewModel GetCombustivel(int Id)
        {
            var data = context.Combustiveis.Where(x => x.ID == Id).FirstOrDefault();
            if (data != null)
            {
                CombustiveisViewModel combustivel = new CombustiveisViewModel();
                combustivel.ID = data.ID;
                combustivel.Tipo = data.Tipo;

                return combustivel;
            }
            else
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }
        }
    }
}
