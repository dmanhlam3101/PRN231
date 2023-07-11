using BusinessObject.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Net.Http.Headers;

namespace FastFoodClient.Controllers
{
    public class MenuController : Controller
    {

        private readonly SWP_ProjectContext _context;
        private readonly HttpClient client = null;
        private readonly IConfiguration configuration;
        private string FoodApiUrl = "";

        public MenuController(SWP_ProjectContext context, IConfiguration configuration)
        {

            client = new HttpClient();
            var contentType = new MediaTypeWithQualityHeaderValue("application/json");
            client.DefaultRequestHeaders.Accept.Add(contentType);
            FoodApiUrl = "https://localhost:7096/api/Foods/filterByCatId/";
            _context = context;
            this.configuration = configuration;

        }
        public async Task<IActionResult> IndexAsync(int id)
        {
            
            HttpResponseMessage response = await client.GetAsync(FoodApiUrl+ id);
            string strData = await response.Content.ReadAsStringAsync();
            List<Food>? listFoods = JsonConvert.DeserializeObject<List<Food>>(strData);
            ViewBag.listFoods = listFoods;
            return View();
        }
        public async Task<IActionResult> Category(int id)
        {
            HttpResponseMessage response = await client.GetAsync(FoodApiUrl+ "/filterByCatId/"+ id);
            string strData = await response.Content.ReadAsStringAsync();
            List<Food>? listFoods = JsonConvert.DeserializeObject<List<Food>>(strData);
            ViewBag.listFoods = listFoods;
            return View();
        }

    }
}
