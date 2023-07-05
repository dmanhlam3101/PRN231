using BusinessObject.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Repositories.IRepo;

namespace FastFoodAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FoodsController : ControllerBase
    {
        private IFoodRepository repository;
        public FoodsController(IFoodRepository repo)
        {
            repository = repo;
        }

        //GET: api/Foods
        [HttpGet] 
        public async Task<IActionResult> GetFoods()
        {
            try
            {
                return StatusCode(200, await repository.GetFoods());
            }
            catch (ApplicationException ae)
            {
                return StatusCode(400, ae.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        //GET: api/Foods
        [HttpGet("{id}")]
        public async Task<IActionResult> GetFoodById(int id)
        {
            try
            {
                return StatusCode(200, await repository.GetFoodById(id));
            }
            catch (ApplicationException ae)
            {
                return StatusCode(400, ae.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        //GET: api/Foods
        [HttpGet("filterByCatId/{categoryId}")]
        public async Task<IActionResult> GetFoodByCategory(int categoryId)
        {
            try
            {
                return StatusCode(200, await repository.GetFoodsByCategory(categoryId));
            }
            catch (ApplicationException ae)
            {
                return StatusCode(400, ae.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        //POST
        [HttpPost]
        public async Task<IActionResult> CreateFood([FromBody] FoodDTO foodDTO)
        {
            try
            {
                return StatusCode(200, await repository.CreateFood(foodDTO));
            }
            catch (ApplicationException ae)
            {
                return StatusCode(400, ae.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        //PUT: api/Foods
        [HttpPut]
        public async Task<IActionResult> UpdateFood([FromBody] FoodDTO foodDTO)
        {
            try
            {
                return StatusCode(200, await repository.UpdateFood(foodDTO));
            }
            catch (ApplicationException ae)
            {
                return StatusCode(400, ae.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        //DELETE: api/Foods
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteFood(int id)
        {
            try
            {
                var p = repository.GetFoodById(id);
                if (p == null)
                    return NotFound();
                await repository.DeleteFood(id);
                return StatusCode(204, "Delete successfully!");
            }
            catch (ApplicationException ae)
            {
                return StatusCode(400, ae.Message);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
