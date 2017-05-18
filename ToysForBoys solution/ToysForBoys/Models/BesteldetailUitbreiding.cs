using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ToysForBoys.Models
{
    public partial class BestelDetail
    {
        public decimal Totaal { get { return Aantal * BestelPrijs; } }
    }
}