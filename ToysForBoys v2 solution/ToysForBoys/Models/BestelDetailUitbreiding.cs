﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ToysForBoys.Models
{
    public partial class BestelDetail
    {
        [DisplayFormat(DataFormatString = "{0:C}")]
        public decimal Totaal { get { return Aantal * Product.Prijs; } }
    }
}