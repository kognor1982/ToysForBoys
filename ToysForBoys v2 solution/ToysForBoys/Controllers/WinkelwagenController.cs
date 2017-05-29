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
        // POST : Winkelwagen/Update
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(FormCollection oFormElements)
        {
            if (ModelState.IsValid)
            {
                Winkelwagen oWinkelwagen = (Winkelwagen)this.Session["winkelwagen"];
                List<int> oRemoveProductIDs = new List<int>();

                foreach (var oProductInWinkelwagen in oWinkelwagen.Bestelling.BestelDetails)
                {
                    string sItemID = "item" + oProductInWinkelwagen.Product.ID.ToString();
                    int iAantal = 0;
                    if (int.TryParse(oFormElements[sItemID], out iAantal))
                    {
                        if (iAantal != oProductInWinkelwagen.Aantal)
                        {
                            oProductInWinkelwagen.Aantal = iAantal;
                            if (oProductInWinkelwagen.Aantal == 0)
                                oRemoveProductIDs.Add(oProductInWinkelwagen.Product.ID);
                        }
                    }
                }
                foreach (var iProductID in oRemoveProductIDs)
                {
                    oWinkelwagen.VerwijderBestelDetail(iProductID);
                }
            }
            return RedirectToAction("Index");
        }
        // GET : Winkelwagen/Bestel
        public ActionResult Bestel()
        {
            // maak List van bestelde producten in winkelwagentje
            Winkelwagen oWinkelwagen = (Winkelwagen)this.Session["winkelwagen"];
            if (oWinkelwagen.Bestelling.BestelDetails.Count > 0)
                return View(oWinkelwagen.Bestelling.BestelDetails.ToList());
            else
                return RedirectToAction("Index");
        }
        // GET : Winkelwagen/Betaal
        public ActionResult Betaal()
        {
            // Login redirects met HTTP GET terug naar Betaal dus moeten we terug redirecten naar Bestel
            return RedirectToAction("Bestel");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        // POST : Winkelwagen/Betaal
        public ActionResult Betaal(FormCollection oFormElements)
        {
            if (ModelState.IsValid)
            {
                Winkelwagen oWinkelwagen = (Winkelwagen)this.Session["winkelwagen"];
                // haal "opmerkingen" tekst van webform en bewaar in Winkelwagen.Bestelling object
                string sOpmerkingen = oFormElements["opmerkingen"];
                oWinkelwagen.Bestelling.Opmerkingen = sOpmerkingen;
                // het verdere verloop van de Bestelling moet worden afgehandeld m.b.v. een ingelogde klant (User Role = "Registered Customer")
                if (User.IsInRole("Registered Customer") == false) return RedirectToAction("Login", "Account", new { returnUrl = this.Request.RawUrl });
                // vul Bestelling datums in
                oWinkelwagen.Bestelling.BestelDatum = DateTime.Now;
                oWinkelwagen.Bestelling.VerzendDatum = null;
                oWinkelwagen.Bestelling.LeverDatum = null;
                // Bestelling status voor een nieuwe bestelling = PROCESSING
                oWinkelwagen.Bestelling.Status = "PROCESSING";

                // fictieve klant ID toevoegen om bestelling te registreren
                oWinkelwagen.Bestelling.KlantID = 1;

                // creëer een nieuwe Bestelling in de database
                // creëer de Bestelling Details in de database
                // maak Winkelwagen leeg nu de Bestelling is geregistreerd in de database

                //
                return View(oWinkelwagen.Bestelling);
            }
            return View();
        }
    }
}