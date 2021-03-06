﻿using System;
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
    public class ProductController : Controller
    {
        private webshopEntities db = new webshopEntities();

        // GET: Product
        public ActionResult Index()
        {
            var producten = db.Producten.Include(p => p.ProductCategorie);
            return View(producten.ToList());
        }

        // GET: Product/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                //return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                return RedirectToAction("Index");
            }
            Product product = db.Producten.Find(id);
            if (product == null)
            {
                //return HttpNotFound();
                return RedirectToAction("Index");
            }
            return View(product);
        }

        // GET: Product/Create
        public ActionResult Create()
        {
            if (User.IsInRole("Admin") == false) return RedirectToAction("Login", "Account", new { returnUrl = this.Request.RawUrl });
            ViewBag.CategorieID = new SelectList(db.ProductCategories, "ID", "Naam");
            return View();
        }

        // POST: Product/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Naam,Schaal,Omschrijving,OpVoorraad,Besteld,Prijs,CategorieID")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Producten.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategorieID = new SelectList(db.ProductCategories, "ID", "Naam", product.CategorieID);
            return View(product);
        }

        // GET: Product/Edit/5
        public ActionResult Edit(int? id)
        {
            if (User.IsInRole("Admin") == false) return RedirectToAction("Login", "Account", new { returnUrl = this.Request.RawUrl });
            if (id == null)
            {
                //return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                return RedirectToAction("Index");
            }
            Product product = db.Producten.Find(id);
            if (product == null)
            {
                //return HttpNotFound();
                return RedirectToAction("Index");
            }
            ViewBag.CategorieID = new SelectList(db.ProductCategories, "ID", "Naam", product.CategorieID);
            return View(product);
        }

        // POST: Product/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Naam,Schaal,Omschrijving,OpVoorraad,Besteld,Prijs,CategorieID")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategorieID = new SelectList(db.ProductCategories, "ID", "Naam", product.CategorieID);
            return View(product);
        }

        // GET: Product/Delete/5
        public ActionResult Delete(int? id)
        {
            if (User.IsInRole("Admin") == false) return RedirectToAction("Login", "Account", new { returnUrl = this.Request.RawUrl });
            if (id == null)
            {
                //return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                return RedirectToAction("Index");
            }
            Product product = db.Producten.Find(id);
            if (product == null)
            {
                //return HttpNotFound();
                return RedirectToAction("Index");
            }
            return View(product);
        }

        // POST: Product/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Producten.Find(id);
            db.Producten.Remove(product);
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
