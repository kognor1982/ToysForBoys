using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ToysForBoys.Models
{
    public class BestellingProperties
    {
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime BestelDatum { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime LeverDatum { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime VerzendDatum { get; set; }
    }
}