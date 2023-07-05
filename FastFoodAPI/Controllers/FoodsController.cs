using BusinessObject.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Repository;

namespace FastFoodAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FoodsController : ControllerBase
    {
        private readonly IFoodRepository repository;

        public FoodsController(IFoodRepository _repository)
        {
           repository = _repository;
        }
        [HttpGet]
        public async Task<IActionResult> GetFoods()
        {
            var foods = await repository.GetFoods();
            return Ok(foods);
        }
    }
}
