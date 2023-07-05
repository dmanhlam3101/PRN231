using BusinessObject.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DAO
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

        public static async Task<List<Food>> GetFoodsByCategory(int catId)
        {
            var listFoods = new List<Food>();
            try
            {
                using (var context = new SWP_ProjectContext())
                {
                    listFoods = await context.Foods.Where(x => x.CategoryId == catId).Include(x => x.Category).ToListAsync();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return listFoods;
        }

        public static async Task<Food> GetFoodById(int id)
        {
            Food food = new Food();
            try
            {
                using (var context = new SWP_ProjectContext())
                {
                    food = await context.Foods.Include(x => x.Category).SingleOrDefaultAsync(x => x.FoodId == id);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return food;
        }

        public static async Task<Food> CreateFood(Food food)
        {
            try
            {
                using (var context = new SWP_ProjectContext())
                {
                    await context.Foods.AddAsync(food);
                    await context.SaveChangesAsync();

                    return await context.Foods.Include(x => x.Category).SingleOrDefaultAsync(x => x.FoodId == food.FoodId);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static async Task<Food> UpdateFood(Food food)
        {
            try
            {
                using (var context = new SWP_ProjectContext())
                {
                    context.Entry(food).State = EntityState.Modified;
                    await context.SaveChangesAsync();

                    return await context.Foods.SingleOrDefaultAsync(x => x.FoodId == food.FoodId);
                    // return await context.Foods.Include(x => x.Category).SingleOrDefaultAsync(x => x.FoodId == food.FoodId);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static async Task DeleteFood(int id)
        {
            try
            {
                Food food = new Food();
                using (var context = new SWP_ProjectContext())
                {
                    food = await context.Foods.Include(x => x.Category).SingleOrDefaultAsync(x => x.FoodId == id);
                    context.Entry<Food>(food).State = EntityState.Modified;
                    context.Foods.Remove(food);
                    await context.SaveChangesAsync();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
