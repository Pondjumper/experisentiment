using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExperimentalMVC.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["Message"] = "Do Not Terrify";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
