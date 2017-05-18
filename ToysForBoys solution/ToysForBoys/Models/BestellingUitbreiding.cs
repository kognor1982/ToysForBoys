using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ToysForBoys.Models
{
    public partial class Bestelling
    {
        public decimal Totaal { get {return BerekenTotaal();} }


        //berekent het totaal van alle besteldetails in de bestelling
        private decimal BerekenTotaal()
        {
            decimal totaal = decimal.Zero;
            foreach(var bestelDetail in this.BestelDetails)
            {
                totaal += bestelDetail.Totaal;
            }
            return totaal;
        }
    }
}