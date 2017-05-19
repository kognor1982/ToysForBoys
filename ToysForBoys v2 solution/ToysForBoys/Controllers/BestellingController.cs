using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ToysForBoys.Models;

namespace ToysForBoys.Controllers
{
    public class BestellingController : Controller
    {
        private webshopEntities db = new webshopEntities();

        // GET: Bestelling
        public ActionResult Index()
        {
            var bestellingen = db.Bestellingen.Include(b => b.Klant);
            bestellingen = bestellingen.OrderBy(b => b.ID);
            return View(bestellingen.ToList());
        }

        // GET: Bestelling/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bestelling bestelling = db.Bestellingen.Find(id);
            if (bestelling == null)
            {
                return HttpNotFound();
            }
            ViewBag.BestelID = id;
            return View(bestelling.BestelDetails);
        }

        // GET: Bestelling/Create
        public ActionResult Create()
        {
            ViewBag.KlantID = new SelectList(db.Klanten, "ID", "Naam");
            return View();
        }

        // POST: Bestelling/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,BestelDatum,LeverDatum,VerzendDatum,Opmerkingen,KlantID,Status")] Bestelling bestelling)
        {
            if (ModelState.IsValid)
            {
                db.Bestellingen.Add(bestelling);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.KlantID = new SelectList(db.Klanten, "ID", "Naam", bestelling.KlantID);
            return View(bestelling);
        }

        // GET: Bestelling/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bestelling bestelling = db.Bestellingen.Find(id);
            if (bestelling == null)
            {
                return HttpNotFound();
            }
            ViewBag.KlantID = new SelectList(db.Klanten, "ID", "Naam", bestelling.KlantID);
            return View(bestelling);
        }

        // POST: Bestelling/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,BestelDatum,LeverDatum,VerzendDatum,Opmerkingen,KlantID,Status")] Bestelling bestelling)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bestelling).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.KlantID = new SelectList(db.Klanten, "ID", "Naam", bestelling.KlantID);
            return View(bestelling);
        }

        // GET: Bestelling/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bestelling bestelling = db.Bestellingen.Find(id);
            if (bestelling == null)
            {
                return HttpNotFound();
            }
            return View(bestelling);
        }

        // POST: Bestelling/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Bestelling bestelling = db.Bestellingen.Find(id);
            db.Bestellingen.Remove(bestelling);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
