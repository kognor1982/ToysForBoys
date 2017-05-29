using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ToysForBoys.Models
{
    public class ProductProperties
    {
        [Display(Name = "Productnaam")]
        public string Naam { get; set; }
        [DataType(DataType.MultilineText)]
        public string Omschrijving { get; set; }
        [Display(Name = "In Stock")]
        public int OpVoorraad { get; set; }
        [DisplayFormat(DataFormatString = "{0:C}")]
        public decimal Prijs { get; set; }
        [Display(Name = "Categorie")]
        public int CategorieID { get; set; }
    }
}