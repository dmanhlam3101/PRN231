using BusinessObject.Models;
using FastFoodClient.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Diagnostics;
using System.Net.Http.Headers;
using System.Text.Json;

namespace FastFoodClient.Controllers
{
    public class HomeController : Controller
    {
        private readonly SWP_ProjectContext _context;
        private readonly HttpClient client = null;
        private readonly IConfiguration configuration;
        private string FoodApiUrl = "";

        public HomeController(SWP_ProjectContext context,IConfiguration configuration)
        {

            client = new HttpClient();
            var contentType = new MediaTypeWithQualityHeaderValue("application/json");
            client.DefaultRequestHeaders.Accept.Add(contentType);
            FoodApiUrl = "https://localhost:7096/api/Foods";
            _context = context;
            this.configuration = configuration;

        }

        public async Task<IActionResult> Index()
        {
            HttpResponseMessage response = await client.GetAsync(FoodApiUrl);
            string strData = await response.Content.ReadAsStringAsync();
            List<Food>? listFoods = JsonConvert.DeserializeObject<List<Food>>(strData);
            ViewBag.listFoods = listFoods.OrderByDescending(x => x.FoodId).Take(8).ToList();
            ViewBag.newFoods = listFoods.OrderByDescending(x=> x.DateCreated).Take(8).ToList();
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }


    }
}