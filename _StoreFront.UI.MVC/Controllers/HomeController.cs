﻿using System.Web.Mvc;
using _StoreFront.UI.MVC.Models;
using System.Net;
using System.Net.Mail;

namespace _StoreFront.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpPost]
        public ActionResult Contact(ContactViewModel cvm)
        {

            if (!ModelState.IsValid)
            {
                return View(cvm);
            }

            string message = $"You have recieved an email from {cvm.Name}. <br/>" +
                $"Subject: {cvm.Subject}<br/>" +
                $"Message: {cvm.Message}<br/>" +
                $"Please reply to {cvm.Email} with your response at your earliest convenience.";

            //MailMessage object - what sends the email
            //Overload for MailMessage FROM/To/SUBJECT/BODY
            MailMessage mm = new MailMessage("administrator@zaksisler.com", "zakarysisler@outlook.com", cvm.Subject, message);
            //MailMessage mm = new MailMessage("administrator@evanwhittaker.com", "ewhittaker@centriq.com", cvm.Subject, message);


            //MailMessage Properties
            mm.IsBodyHtml = true;
            mm.Priority = MailPriority.High;
            //Reply directly to the sender and not our website/webmail
            mm.ReplyToList.Add(cvm.Email);

            //SmtpClient - Info from the host that allows emails to be sent
            SmtpClient client = new SmtpClient("mail.zaksisler.com");
            //SmtpClient client = new SmtpClient("mail.evanwhittaker.com");


            //Client Credentials
            client.Credentials = new NetworkCredential("administrator@zaksisler.com", "P@ssw0rd");
            //client.Credentials = new NetworkCredential("administrator@evanwhittaker.com", "P@ssw0rd");


            //Port options -- SMTP uses two ports 25 and 8889. Test both to determine
            //if your internet provider blocks/does not use one of these.
            //client.Port = 25;

            //Try and send the email
            try
            {
                //Attempt to send the email
                client.Send(mm);
            }
            catch (System.Exception ex)
            {

                ViewBag.CustomerMessage = $"We're sorry, but your request could not be completed at this time. " +
                    $"Please try again later. If the issue persists, please contact your site administrator and provide" +
                    $"the following info: <br/>{ex.StackTrace}";

                return View(cvm);

            }

            return View("EmailConfirmation", cvm);

        }
    }
}
