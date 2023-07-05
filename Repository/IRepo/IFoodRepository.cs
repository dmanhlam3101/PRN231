using BusinessObject.DTO;
using BusinessObject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.IRepo
{
    public interface IFoodRepository
    {
        Task<List<FoodDTO>> GetFoods();
        Task<List<FoodDTO>> GetFoodsByCategory(int catId);
        Task<FoodDTO> GetFoodById(int id);
        Task<FoodDTO> CreateFood(FoodDTO foodDTO);
        Task<FoodDTO> UpdateFood(FoodDTO foodDTO);
        Task DeleteFood(int id);
    }
}
