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
    public class CambiosController : ApiController
    {
        DataAccessContext context = new DataAccessContext();

        //Get All Cambios
        [HttpGet]
        public IEnumerable<CambiosViewModel> GetAllCambios()
        {

            var data = context.Cambios.ToList().OrderBy(x => x.Tipo);
            var result = data.Select(x => new CambiosViewModel()
            {
                ID = x.ID,
                Tipo = x.Tipo
            });
            return result.ToList();
        }

        //Get the single employee data
        [HttpGet]
        public CambiosViewModel GetCambio(int Id)
        {
            var data = context.Cambios.Where(x => x.ID == Id).FirstOrDefault();
            if (data != null)
            {
                CambiosViewModel cambio = new CambiosViewModel();
                cambio.ID = data.ID;
                cambio.Tipo = data.Tipo;

                return cambio;
            }
            else
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }
        }
    }
}
