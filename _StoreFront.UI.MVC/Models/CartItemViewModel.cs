using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using _StoreFront.DATA.EF;
using System.ComponentModel.DataAnnotations;

namespace _StoreFront.UI.MVC.Models
{
    public class CartItemViewModel
    {
        [Key]
        [Range(1, int.MaxValue)]
        public int Qty { get; set; }

        public Product Product { get; set; }

        public CartItemViewModel(int qty, Product product)
        {
            Qty = qty;
            Product = product;
        }
    }
}