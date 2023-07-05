using AutoMapper;
using BusinessObject.DTO;
using BusinessObject.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Repositories.IRepo;


namespace FastFoodAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        /*private ICategoryRepository repository;
        private SWP_ProjectContext _context;
        private IMapper _mapper;
        public CategoriesController(ICategoryRepository repo, IMapper mapper, SWP_ProjectContext context)
        {
            repository = repo;
            _context = context;
            _mapper = mapper;
        }

        //GET: api/Categories
        [HttpGet]
        public async Task<IActionResult> GetCategories()
        {
            List<Category> categories = _context.Categories.ToList();
            return Ok(_mapper.Map<List<CategoryDTO>>(categories));
        }

        //GET: api/Categories/id
        [HttpGet("{id}")]
        public async Task<IActionResult> GetCategoryById(int id)
        {
            Category category = _context.Categories.FirstOrDefault(c => c.CategoryId == id);
            return Ok(_mapper.Map<CategoryDTO>(category));
        }*/


        private ICategoryRepository repository;
        public CategoriesController(ICategoryRepository repo)
        {
            repository = repo;
        }

        //GET: api/Categories

        [HttpGet]
        public async Task<IActionResult> GetCategories()
        {
            try
            {
                return StatusCode(200, await repository.GetCategories());
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

        //GET: api/Categories/id
        [HttpGet("{id}")]
        public async Task<IActionResult> GetCategoryById(int id)
        {
            try
            {
                return StatusCode(200, await repository.GetCategoryById(id));
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

        //POST: api/Categories
        [HttpPost]
        public async Task<IActionResult> CreateCategory([FromBody] CategoryDTO categoryDTO)
        {
            try
            {
                return StatusCode(200, await repository.CreateCategory(categoryDTO));
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

        //PUT: api/Categories
        [HttpPut]
        public async Task<IActionResult> UpdateCategory([FromBody] CategoryDTO categoryDTO)
        {
            try
            {
                return StatusCode(200, await repository.UpdateCategory(categoryDTO));
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

        // DELETE: api/Categories/id
        //DELETE

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCategory(int id)
        {
            try
            {
                var p = repository.GetCategoryById(id);
                if (p == null)
                    return NotFound();
                await repository.DeleteCategory(id);
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
