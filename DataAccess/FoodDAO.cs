using BusinessObject.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class FoodDAO
    {
        public static async Task<List<Food>> GetFoods()
        {
            var listFoods = new List<Food>();
            try
            {
                using (var context = new SWP_ProjectContext())
                {
                    listFoods = await context.Foods.ToListAsync();
                }
            }

            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            return listFoods;

        }
    }
}
