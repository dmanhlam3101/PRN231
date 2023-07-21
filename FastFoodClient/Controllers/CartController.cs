using Microsoft.AspNetCore.Mvc;

namespace FastFoodClient.Controllers
{
    public class CartController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
