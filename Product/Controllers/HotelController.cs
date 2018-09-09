using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Product.Controllers
{
    public class HotelController : ApiController
    {
   
        [HttpGet]
        public IEnumerable<HotelProduct> GetHotels()
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
                return entity.HotelProducts.ToList();
        }
        [HttpPost]
        public void PostData([FromBody]HotelProduct hotelUpdate)
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
            {
                entity.HotelProducts.Add(hotelUpdate);
                entity.SaveChanges();
            }
        }
        [HttpPut]
        [Route("api/Hotel/BookHotel/{id}")]
        public void BookHotel([FromUri] int id)
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
            {
                HotelProduct hotel = new HotelProduct();
                hotel = entity.HotelProducts.Find(id);
                hotel.IsBooked = true;
                entity.SaveChanges();
            }
        }

        [HttpPut]
        [Route("api/Hotel/SaveHotel/{id}")]
        public void SaveHotel([FromUri] int id)
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
            {
                HotelProduct hotel = new HotelProduct();
                hotel = entity.HotelProducts.Find(id);
                hotel.IsSaved = true;
                entity.SaveChanges();
            }
        }
    }
}
