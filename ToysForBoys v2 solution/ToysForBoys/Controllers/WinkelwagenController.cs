using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToysForBoys.Models;

namespace ToysForBoys.Controllers
{
    public class WinkelwagenController : Controller
    {
        private webshopEntities db = new webshopEntities();

        // GET: Winkelwagen
        public ActionResult Index()
        {
            if (this.Session["winkelwagen"] == null)
                this.Session["winkelwagen"] = new Winkelwagen(new Models.Bestelling());

            // maak List van bestelde producten in winkelwagentje
            Winkelwagen oWinkelwagen = (Winkelwagen)this.Session["winkelwagen"];

            // debug
            //oWinkelwagen.VoegBesteldetailsToe(1, 5);
            //oWinkelwagen.VoegBesteldetailsToe(2, 20);
            //oWinkelwagen.VoegBesteldetailsToe(1, 5);
            // debug

            var producten = db.Producten.Include(p => p.ProductCategorie);

            return View(oWinkelwagen.Bestelling.BestelDetails.ToList());
        }
        // POST : Winkelwagen/BestelProduct/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult BestelProduct(int ID, int Aantal)
        {
            if (ModelState.IsValid)
            {
                if (this.Session["winkelwagen"] == null)
                    this.Session["winkelwagen"] = new Winkelwagen(new Models.Bestelling());
                Winkelwagen oWinkelwagen = (Winkelwagen)this.Session["winkelwagen"];
                oWinkelwagen.VoegBesteldetailsToe(ID, Aantal);
                return RedirectToAction("Index");
            }
            return View();
        }
        // GET : Winkelwagen/DeleteProduct/5
        public ActionResult DeleteProduct(int? id)
        {
            if (id == null)
            {
                //return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                return RedirectToAction("Index");
            }
            else
            {
                Winkelwagen oWinkelwagen = (Winkelwagen)this.Session["winkelwagen"];
                oWinkelwagen.VerwijderBestelDetail((int)id);
                return RedirectToAction("Index");
            }
        }
    }
}