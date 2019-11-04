using DataAccess;
using DataAccess.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balloon_Shop
{
	public partial class Checkout : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected override void OnInit(EventArgs e)
		{
			Redirector.RedirectIfNotAuthenticated();
			base.OnInit(e);
			btnSumitOrder.Click += new EventHandler(btnSumitOrder_Click);
			btnConfirm.Click += new EventHandler(btnConfirm_Click);
		}

		private void PopulateControls()
		{
			grid.DataSource = ShoppingCart.Items();
			grid.DataBind();
			lblTotal.Text = ShoppingCart.TotalAmount().ToString("c");
		}

		void btnConfirm_Click(object sender, EventArgs e)
		{
			phAddress.Visible = false;
			phConfirm.Visible = true;
			lblFullName.Text = LastName.Text + " " + FirstName.Text;
			lblEMail.Text = Email.Text;
			lblPhone.Text = Phone.Text.Replace("\n", "<br/>");
			lblAddress.Text = Address.Text.Replace("\n", "<br/>");
			PopulateControls();
		}

		void btnSumitOrder_Click(object sender, EventArgs e)
		{
			int orderNumber = ShoppingCart.CreateOrder(FirstName.Text, LastName.Text, Email.Text, Phone.Text, Address.Text);
			phAddress.Visible = false;
			phConfirm.Visible = false;
			if (orderNumber <= 0)
			{
				phError.Visible = true;
			}
			else
			{
				Session["OrderNumber"] = orderNumber;
				Response.Redirect("~/OrderPlaced.aspx");
			}
		}
	}
}