using BusinessObject.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Net.Http.Headers;

namespace FastFoodClient.Controllers
{
    public class FoodController : Controller
    {
        private readonly SWP_ProjectContext _context;
        private readonly HttpClient client = null;
        private readonly IConfiguration configuration;
        private string FoodApiUrl = "";

        public FoodController(SWP_ProjectContext context, IConfiguration configuration)
        {

            client = new HttpClient();
            var contentType = new MediaTypeWithQualityHeaderValue("application/json");
            client.DefaultRequestHeaders.Accept.Add(contentType);
            FoodApiUrl = "https://localhost:7096/api/Foods";
            _context = context;
            this.configuration = configuration;

        }
        public IActionResult Index()
        {
            return View();
        }
        public async Task<IActionResult> Details(int id)
        {
            //Get Products
            HttpResponseMessage response = await client.GetAsync(FoodApiUrl + "/" + id);
            string strData = await response.Content.ReadAsStringAsync();
            Food? food = JsonConvert.DeserializeObject<Food>(strData);
            ViewBag.food = food;
            return View( food);
        }
    }
}
