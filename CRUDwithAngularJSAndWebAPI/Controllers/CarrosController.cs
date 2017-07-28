using Locadora_de_Carros.Models;
using Locadora_de_Carros.ViewModels;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;


namespace Locadora_de_Carros.Controllers
{

    public class CarrosController : ApiController
    {

        DataAccessContext context = new DataAccessContext();

        //Get All Carros
        [HttpGet]
        public IEnumerable<CarrosViewModel> GetAllCarros()
        {

            var data = context.Carros.ToList();
            var result = data.Select(x => new CarrosViewModel()
            {
                ID = x.ID,
                Cor = x.Cor,
                Ano = x.Ano,
                Valor = x.Valor,
                KM = x.KM,
                Imagem = Convert.ToBase64String(x.Imagem),
                cambio_id = x.cambio_id,
                Cambio = GetCambio(x.cambio_id),
                combustivel_id = x.combustivel_id,
                Combustivel = GetCombustivel(x.combustivel_id),
                modelo_id = x.modelo_id,
                Modelo = GetModelo(x.modelo_id)
            });
            return result.ToList();
        }

        //Get the single Carro data
        [HttpGet]
        public CarrosViewModel GetCarro(int Id)
        {
            var data = context.Carros.Where(x => x.ID == Id).FirstOrDefault();
            if (data != null)
            {
                CarrosViewModel carro = new CarrosViewModel();
                carro.ID = data.ID;
                carro.Ano = data.Ano;
                carro.Cor = data.Cor;
                carro.KM = data.KM;
                carro.Valor = data.Valor;
                carro.Imagem = Convert.ToBase64String(data.Imagem);
                carro.cambio_id = data.cambio_id;
                carro.Cambio = GetCambio(data.cambio_id);
                carro.combustivel_id = data.combustivel_id;
                carro.Combustivel = GetCombustivel(data.combustivel_id);
                carro.modelo_id = data.modelo_id;
                carro.Modelo = GetModelo(data.modelo_id);

                return carro;
            }
            else
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }
        }

        //Add new Carro

        [HttpPost]
        public HttpResponseMessage AddCarro(CarrosViewModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Carros car = new Carros();
                    car.Ano = model.Ano;
                    car.Cor = model.Cor;
                    car.KM = model.KM;
                    car.Valor = model.Valor;
                    car.Imagem = Convert.FromBase64String(model.Imagem);
                    car.cambio_id = model.cambio_id;
                    car.modelo_id = model.modelo_id;
                    car.combustivel_id = model.combustivel_id;

                    context.Carros.Add(car);
                    var result = context.SaveChanges();
                    if (result > 0)
                    {
                        return Request.CreateResponse(HttpStatusCode.Created, "Submitted Successfully");
                    }
                    else
                    {
                        return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Something wrong !");
                    }
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Something wrong !");
                }
            }
            catch (Exception ex)
            {

                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Something wrong !", ex);
            }
        }
        
        //Update the employee

        [HttpPut]
        public HttpResponseMessage UpdateCarro(CarrosViewModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Carros car = new Carros();
                    car.ID = model.ID;
                    car.Ano = model.Ano;
                    car.Cor = model.Cor;
                    car.KM = model.KM;
                    car.Valor = model.Valor;
                    if (model.Imagem != null)
                    {
                        car.Imagem = Convert.FromBase64String(model.Imagem);
                    }
                    car.cambio_id = model.cambio_id;
                    car.modelo_id = model.modelo_id;
                    car.combustivel_id = model.combustivel_id;

                    context.Entry(car).State = System.Data.Entity.EntityState.Modified;
                    var result = context.SaveChanges();
                    if (result > 0)
                    {
                        return Request.CreateResponse(HttpStatusCode.OK, "Updated Successfully");
                    }
                    else
                    {
                        return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Something wrong !");
                    }
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Something wrong !");
                }
            }
            catch (Exception ex)
            {

                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Something wrong !", ex);
            }
        }

        //Delete the Carro

        [HttpDelete]
        public HttpResponseMessage DeleteCarro(int Id)
        {
            Carros car = new Carros();
            car = context.Carros.Find(Id);
            if (car != null)
            {
                context.Carros.Remove(car);
                context.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, car);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Something wrong !");
            }
        }

        private Cambios GetCambio(int Id)
        {
            var data = context.Cambios.Where(x => x.ID == Id).FirstOrDefault();
            if (data != null)
            {
                Cambios cambio = new Cambios();
                cambio.ID = data.ID;
                cambio.Tipo = data.Tipo;

                return cambio;
            }
            else
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }
        }

        public Combustiveis GetCombustivel(int Id)
        {
            var data = context.Combustiveis.Where(x => x.ID == Id).FirstOrDefault();
            if (data != null)
            {
                Combustiveis combustivel = new Combustiveis();
                combustivel.ID = data.ID;
                combustivel.Tipo = data.Tipo;

                return combustivel;
            }
            else
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }
        }

        public Modelos GetModelo(int Id)
        {
            var data = context.Modelos.Where(x => x.ID == Id).FirstOrDefault();
            if (data != null)
            {
                Modelos modelo = new Modelos();
                modelo.ID = data.ID;
                modelo.Nome = data.Nome;
                modelo.Marcas = GetMarca(data.marca_id);

                return modelo;
            }
            else
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }
        }

        public Marcas GetMarca(int Id)
        {
            var data = context.Marcas.Where(x => x.ID == Id).FirstOrDefault();
            if (data != null)
            {
                Marcas marca = new Marcas();
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
