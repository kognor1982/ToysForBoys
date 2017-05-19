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
    public class ProductcategorieController : Controller
    {

        private webshopEntities db = new webshopEntities();

        // GET: Productcategorie
        public ActionResult Index()
        {
            return View(db.ProductCategories.ToList());
        }

        // GET: Productcategorie/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductCategorie productCategorie = db.ProductCategories.Find(id);
            if (productCategorie == null)
            {
                return HttpNotFound();
            }
            return View(productCategorie);
        }

        // GET: Productcategorie/Create
        public ActionResult Create()
        {
            if (User.IsInRole("Admin") == false) return RedirectToAction("Login","Account", new { returnUrl = this.Request.RawUrl});
            return View();
        }

        // POST: Productcategorie/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Naam,Omschrijving")] ProductCategorie productCategorie)
        {
            if (ModelState.IsValid)
            {
                db.ProductCategories.Add(productCategorie);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(productCategorie);
        }

        // GET: Productcategorie/Edit/5
        public ActionResult Edit(int? id)
        {
            if (User.IsInRole("Admin") == false) return RedirectToAction("Login", "Account", new { returnUrl = this.Request.RawUrl});
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductCategorie productCategorie = db.ProductCategories.Find(id);
            if (productCategorie == null)
            {
                return HttpNotFound();
            }
            return View(productCategorie);
        }

        // POST: Productcategorie/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Naam,Omschrijving")] ProductCategorie productCategorie)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productCategorie).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(productCategorie);
        }

        // GET: Productcategorie/Delete/5
        public ActionResult Delete(int? id)
        {
            if (User.IsInRole("Admin") == false) return RedirectToAction("Login", "Account", new { returnUrl = this.Request.RawUrl });
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductCategorie productCategorie = db.ProductCategories.Find(id);
            if (productCategorie == null)
            {
                return HttpNotFound();
            }
            return View(productCategorie);
        }

        // POST: Productcategorie/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProductCategorie productCategorie = db.ProductCategories.Find(id);
            db.ProductCategories.Remove(productCategorie);
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
