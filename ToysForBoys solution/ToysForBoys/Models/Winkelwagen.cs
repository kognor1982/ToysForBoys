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
            using (var entities = new webshopEntities())
            {
                //Als het een eerste bestelling is moet er een nieuwe collection aangemaakt worden
                if (Bestelling.BestelDetails == null)
                    this.Bestelling.BestelDetails = new ObservableCollection<BestelDetail>();

                //Er staan reeds besteldetails in de bestelling
                else
                {
                    Product product = entities.Producten.Find(productId);
                    //checken of de productId in de database zit
                    if (product != null)
                    {
                        //checken of het zelfde product reeds in de bestelling zit..
                        bool reedsBesteld = false;
                        foreach (var bestelDetail in this.Bestelling.BestelDetails)
                        {
                            //..zo ja - tel het aantal bij op
                            if (bestelDetail.Product.ID == productId)
                            {
                                bestelDetail.Aantal += aantal;
                                reedsBesteld = true;
                            }
                        }
                        //..zo nee - voeg een nieuw besteldetail toe aan de bestelling
                        if (!reedsBesteld)
                            this.Bestelling.BestelDetails.Add(new BestelDetail { Product = product, Aantal = aantal });
                    }
                    //verkeerde productId
                    else
                        throw new Exception("Product not found");
                }
            }
        }
    }
}