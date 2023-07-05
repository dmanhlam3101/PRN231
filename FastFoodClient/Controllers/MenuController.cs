using Microsoft.AspNetCore.Mvc;

namespace FastFoodClient.Controllers
{
    public class MenuController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
