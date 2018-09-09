using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Product.Controllers
{
    public class ActivityController : ApiController
    {
       

        [HttpGet]
        public IEnumerable<ActivityProduct> GetActivity()
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
             return entity.ActivityProducts.ToList();
        }
     
        [HttpPost]
        public void PostData([FromBody]ActivityProduct activityUpdate)
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
            {
                entity.ActivityProducts.Add(activityUpdate);
                entity.SaveChanges();
            }
        }
        [HttpPut]
        [Route("api/Activity/BookActivity/{id}")]
        public void BookActivity([FromUri] int id)
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
            {
                ActivityProduct newActivity = new ActivityProduct();
                newActivity = entity.ActivityProducts.Find(id);
                newActivity.IsBooked = true;
                entity.SaveChanges();
            }
        }

        [HttpPut]
        [Route("api/Activity/SaveActivity/{id}")]
        public void SaveActivity([FromUri] int id)
        {
            using (ProductDBEntities1 entity = new ProductDBEntities1())
            {
                ActivityProduct newActivity = new ActivityProduct();
                newActivity = entity.ActivityProducts.Find(id);
                newActivity.IsSaved = true;
                entity.SaveChanges();
            }
        }
    }
}
