using BusinessObject.DTO;
using eBookStore.Models.Login;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Repository.IRepo;

namespace FastFoodAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsController : ControllerBase
    {
        private IAccountRepository repository;
        public AccountsController(IAccountRepository repo)
        {
            repository = repo;
        }

        //GET: api/Accounts
        [HttpGet]
        public async Task<IActionResult> GetAccounts()
        {
            try
            {
                return StatusCode(200, await repository.GetAccounts());
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
        [HttpPost("Login")]
        public async Task<ActionResult<AccountDTO>> Login(LoginRequest request)
        {
            try
            {
                return StatusCode(200, await repository.Login(request.username, request.password));
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
    
        //GET: api/Accounts/id
        [HttpGet("{id}")]
        public async Task<IActionResult> GetAccountById(int id)
        {
            try
            {
                return StatusCode(200, await repository.GetAccountById(id));
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

        //POST: api/Accounts
        [HttpPost]
        public async Task<IActionResult> CreateAccount([FromBody] AccountDTO accountDTO)
        {
            try
            {
                return StatusCode(200, await repository.CreateAccount(accountDTO));
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

        //PUT: api/Accounts
        [HttpPut]
        public async Task<IActionResult> UpdateAccount([FromBody] AccountDTO accountDTO)
        {
            try
            {
                return StatusCode(200, await repository.UpdateAccount(accountDTO));
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

        // DELETE: api/Accounts/id
        //DELETE

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAccount(int id)
        {
            try
            {
                var p = repository.GetAccountById(id);
                if (p == null)
                    return NotFound();  
                await repository.DeleteAccount(id);
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
