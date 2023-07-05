using BusinessObject.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.DAO
{
    public class CategoryDAO
    {
        public static async Task<List<Category>> GetCategories()
        {
            var listCategories = new List<Category>();
            try
            {
                using (var context = new SWP_ProjectContext())
                {
                    listCategories = await context.Categories.ToListAsync();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return listCategories;
        }

        public static async Task<Category> GetCategoryById(int id)
        {
            Category category = new Category();
            try
            {
                using (var context = new SWP_ProjectContext())
                {
                    category = await context.Categories.SingleOrDefaultAsync(x => x.CategoryId == id);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return category;
        }

        public static async Task<Category> CreateCategory(Category category)
        {
            try
            {
                using (var context = new SWP_ProjectContext())
                {
                    await context.Categories.AddAsync(category);
                    await context.SaveChangesAsync();

                    return await context.Categories.SingleOrDefaultAsync(x => x.CategoryId == category.CategoryId);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static async Task<Category> UpdateCategory(Category category)
        {
            try
            {
                using (var context = new SWP_ProjectContext())
                {
                    context.Entry<Category>(category).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                    await context.SaveChangesAsync();

                    return await context.Categories.SingleOrDefaultAsync(x => x.CategoryId == category.CategoryId);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static async Task DeleteCategory(int id)
        {
            try
            {
                Category category = new Category();
                using (var context = new SWP_ProjectContext())
                {
                    category = await context.Categories.SingleOrDefaultAsync(x => x.CategoryId == id);
                    context.Entry<Category>(category).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                    context.Categories.Remove(category);
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
