using BusinessObject.Models;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    public class FoodRepository:IFoodRepository
    {
        public async Task<List<Food>> GetFoods() => await FoodDAO.GetFoods();
    }
}
