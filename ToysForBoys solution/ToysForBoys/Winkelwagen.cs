using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ToysForBoys
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
    }
}