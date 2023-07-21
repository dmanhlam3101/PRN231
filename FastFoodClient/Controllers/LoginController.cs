using BusinessObject.DTO;
using BusinessObject.Models;
using eBookStore.Models.Login;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using RestSharp;
using System.Net.Http.Headers;
using System.Text.Json;

namespace FastFoodClient.Controllers
{
    public class LoginController : Controller
    {
        private readonly SWP_ProjectContext _context;
        private readonly HttpClient client = null;
        private readonly IConfiguration configuration;
        private string AccountApiUrl = "";

        public LoginController(SWP_ProjectContext context, IConfiguration configuration)
        {

            client = new HttpClient();
            var contentType = new MediaTypeWithQualityHeaderValue("application/json");
            client.DefaultRequestHeaders.Accept.Add(contentType);
            AccountApiUrl = "https://localhost:7096/api/Accounts";
            _context = context;
            this.configuration = configuration;

        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Login(LoginRequest request)
        {
            LoginDTO currentUser;
            var options = new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true,
            };
      

            try
            {
                RestClient client = new RestClient(AccountApiUrl);
                var requesrUrl = new RestRequest($"/Login", RestSharp.Method.Post);
                requesrUrl.AddHeader("content-type", "application/json");
                var body = new LoginRequest
                {
                    username = request.username,
                    password = request.password
                };

                requesrUrl.AddParameter("application/json-patch+json", body, ParameterType.RequestBody);
                var response = await client.ExecuteAsync(requesrUrl);

                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var account = JsonSerializer.Deserialize<AccountDTO>(response.Content, options);
                    //currentUser = new LoginDTO
                    //{
                    //    Username = account.Username,
                    //    Password = account.Password,
                    //    IsAdmin = (bool)account.IsAdmin,

                    //};
                    var loginUser =JsonSerializer.Serialize(account);
                    HttpContext.Session.SetString("loginUser", loginUser);
                   // ViewData["user"] = currentUser.IsAdmin;
                    return RedirectToAction("Index", "Home");
                }
 
            }catch(Exception )
            {
                throw;
            }

            

            return Ok("Tai khoan hoac mat khau ban nhap sai !!!");
        }
    }
}
