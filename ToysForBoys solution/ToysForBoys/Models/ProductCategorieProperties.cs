using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ToysForBoys.Models
{
    public class ProductCategorieProperties
    {
        [Display(Name = "Categorie")]
        public string Naam { get; set; }
    }
}