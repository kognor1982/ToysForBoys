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
    public class BestelDetailController : Controller
    {
        private webshopEntities db = new webshopEntities();

        // GET: BestelDetail
        public ActionResult Index()
        {
            var bestelDetails = db.BestelDetails.Include(b => b.Bestelling).Include(b => b.Product);
            return View(bestelDetails.ToList());
        }

        // GET: BestelDetail/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BestelDetail bestelDetail = db.BestelDetails.Find(id);
            if (bestelDetail == null)
            {
                return HttpNotFound();
            }
            return View(bestelDetail);
        }

        // GET: BestelDetail/Create
        public ActionResult Create()
        {
            ViewBag.BestellingID = new SelectList(db.Bestellingen, "ID", "Opmerkingen");
            ViewBag.ProductID = new SelectList(db.Producten, "ID", "Naam");
            return View();
        }

        // POST: BestelDetail/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BestellingID,ProductID,Aantal,BestelPrijs")] BestelDetail bestelDetail)
        {
            if (ModelState.IsValid)
            {
                db.BestelDetails.Add(bestelDetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BestellingID = new SelectList(db.Bestellingen, "ID", "Opmerkingen", bestelDetail.BestellingID);
            ViewBag.ProductID = new SelectList(db.Producten, "ID", "Naam", bestelDetail.ProductID);
            return View(bestelDetail);
        }

        // GET: BestelDetail/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //BestelDetail bestelDetail = db.BestelDetails.Find(id);
            Bestelling bestelling = db.Bestellingen.Find(id);
            if (bestelling == null)
            {
                return HttpNotFound();
            }
            ViewBag.BestellingID = new SelectList(db.Bestellingen, "ID", "Opmerkingen", bestelling.BestelDetails);
            //ViewBag.ProductID = new SelectList(db.Producten, "ID", "Naam", bestelling.ProductID);
            return View(bestelling);
        }

        // POST: BestelDetail/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "BestellingID,ProductID,Aantal,BestelPrijs")] BestelDetail bestelDetail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bestelDetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BestellingID = new SelectList(db.Bestellingen, "ID", "Opmerkingen", bestelDetail.BestellingID);
            ViewBag.ProductID = new SelectList(db.Producten, "ID", "Naam", bestelDetail.ProductID);
            return View(bestelDetail);
        }

        // GET: BestelDetail/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BestelDetail bestelDetail = db.BestelDetails.Find(id);
            if (bestelDetail == null)
            {
                return HttpNotFound();
            }
            return View(bestelDetail);
        }

        // POST: BestelDetail/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BestelDetail bestelDetail = db.BestelDetails.Find(id);
            db.BestelDetails.Remove(bestelDetail);
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
