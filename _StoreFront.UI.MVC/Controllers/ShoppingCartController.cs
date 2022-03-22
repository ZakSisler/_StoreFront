﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _StoreFront.UI.MVC.Models;

namespace _StoreFront.UI.MVC.Controllers
{

    public class ShoppingCartController : Controller
    {

        // GET: ShoppingCart -- Generate this View with the List Template for CartItemViewModel objects (No data context)
        public ActionResult Index()
        {
            //Pull session cart into a local variable, which we can then pass to the View
            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            if (shoppingCart == null || shoppingCart.Count == 0)
            {
                //User either hasn't put anything in the cart, removed all cart items, or session expired
                //Set cart to an empty cart object (we can still send that to the View, Unlike a Null value)
                shoppingCart = new Dictionary<int, CartItemViewModel>();

                //Create a message informing them about the empty cart
                ViewBag.Message = "There are no items in your cart.";
            }
            else
            {
                ViewBag.Message = null; // Explicitly clears out the ViewBag variable
            }

            return View(shoppingCart);
        }

        public ActionResult RemoveFromCart(int id)
        {
            //Get the cart from the Session input into a local variable
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //Remove the item
            shoppingCart.Remove(id);

            //Update Session cart
            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }

        public ActionResult UpdateCart(int productID, int qty)
        {
            //Get the cart from the Session and store it in a local variable
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //Target correct cart item using bookID for the key. Then change the Qty property with the qty parameter
            shoppingCart[productID].Qty = qty;

            //Return the (now updated) local cart to the session
            Session["cart"] = shoppingCart;

            //Send the user to the Shopping Cart Index to see the update cart
            return RedirectToAction("Index");
        }
    }
}