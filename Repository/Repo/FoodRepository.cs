using AutoMapper;
using BusinessObject.DTO;
using BusinessObject.Models;
using DataAccess.DAO;
using Repository.IRepo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repo
{
    public class FoodRepository : IFoodRepository
    {
        private readonly IMapper _mapper;
        public FoodRepository(IMapper mapper)
        {
            _mapper = mapper;
        }

        public async Task<List<FoodDTO>> GetFoods()
        {
            return _mapper.Map<List<FoodDTO>>(await FoodDAO.GetFoods());
        }

        public async Task<List<FoodDTO>> GetFoodsByCategory(int catId)
        {
            return _mapper.Map<List<FoodDTO>>(await FoodDAO.GetFoodsByCategory(catId));
        }

        public async Task<FoodDTO> GetFoodById(int id)
        {
            return _mapper.Map<FoodDTO>(await FoodDAO.GetFoodById(id));
        }

        public async Task<FoodDTO> CreateFood(FoodDTO foodDTO)
        {
            var product = _mapper.Map<Food>(foodDTO);
            return _mapper.Map<FoodDTO>(await FoodDAO.CreateFood(product));
        }

        public async Task<FoodDTO> UpdateFood(FoodDTO foodDTO)
        {
            var product = _mapper.Map<Food>(foodDTO);
            return _mapper.Map<FoodDTO>(await FoodDAO.UpdateFood(product));
        }

        public async Task DeleteFood(int id)
        {
            await FoodDAO.DeleteFood(id);
        }
    }
}
