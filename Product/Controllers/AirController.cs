using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data.Entity;
using DataAccess;

namespace Product.Controllers
{
    public class AirController : ApiController
    {

       

        [HttpGet]
        public IEnumerable<AirProduct> GetFlights()
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
            return entity.AirProducts.ToList();
        }

        [HttpPost]
        public void PostData([FromBody]AirProduct flightUpdate)
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
            { 
            entity.AirProducts.Add(flightUpdate);
            entity.SaveChanges();
            }
        }
        [HttpPut]
        [Route("api/Air/BookFlight/{id}")]
        public void BookFlight([FromUri] int id)
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
            {
                AirProduct Flight = new AirProduct();
                Flight = entity.AirProducts.Find(id);
                Flight.IsBooked = true;
                entity.SaveChanges();
            }
        }

        [HttpPut]
        [Route("api/Air/SaveFlight/{id}")]
        public void SaveFlight([FromUri] int id)
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
            {
                AirProduct Flight = new AirProduct();
                Flight = entity.AirProducts.Find(id);
                Flight.IsSaved = true;
                entity.SaveChanges();
            }
        }
    }
}
