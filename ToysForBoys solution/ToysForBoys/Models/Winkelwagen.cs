using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Web;

namespace ToysForBoys.Models
{
    public class Winkelwagen
    {
        private Models.Bestelling bestellingValue;
        public Models.Bestelling Bestelling
        {
            get
            {
                return bestellingValue;
            }
        }
        public Winkelwagen(Models.Bestelling bestelling)
        {
            bestellingValue = bestelling;
        }

        public void VoegBesteldetailsToe(int productId, int aantal)
        {
            using(var entities= new webshopEntities())
            {
                if (Bestelling.BestelDetails == null)
                    this.Bestelling.BestelDetails = new ObservableCollection<BestelDetail>();
                else
                {
                    Product product = entities.Producten.Find(productId);
                    if (product != null)
                        this.Bestelling.BestelDetails.Add(new BestelDetail { Product = product, Aantal = aantal });
                    else
                        throw new Exception("Product not found");
                }
            }
        }
    }
}