using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Product.Controllers
{
    public class CarController : ApiController
    {
       
        [HttpGet]
        public IEnumerable<CarProduct> GetCars()
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
             return entity.CarProducts.ToList();
        }
        [HttpPost]
        public void PostData([FromBody]CarProduct carUpdate)
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
            {
                entity.CarProducts.Add(carUpdate);
                entity.SaveChanges();
            }
        }
        [HttpPut]
        [Route("api/Car/BookCar/{id}")]
        public void BookCar([FromUri] int id)
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
            {
                CarProduct Car = new CarProduct();
                Car = entity.CarProducts.Find(id);
                Car.IsBooked = true;
                entity.SaveChanges();
            }
        }

        [HttpPut]
        [Route("api/Car/SaveCar/{id}")]
        public void SaveCar([FromUri] int id)
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
            {
                CarProduct Car = new CarProduct();
                Car = entity.CarProducts.Find(id);
                Car.IsSaved = true;
                entity.SaveChanges();
            }
        }
    }
}
