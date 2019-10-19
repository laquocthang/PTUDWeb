using DataAccess.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balloon_Shop.Admin
{
	public partial class ShoppingCarts : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			btnDelete.Click += new EventHandler(btnDelete_Click);
			btnCount.Click += new EventHandler(btnCount_Click);
		}

		void btnDelete_Click(object sender, EventArgs e)
		{
			byte days = byte.Parse(ddlDay.SelectedValue);
			ShoppingCart.DeleteOldCarts(days);
			lblCount.Text = "The old shopping carts were removed from the database";
		}

		void btnCount_Click(object sender, EventArgs e)
		{
			byte days = byte.Parse(ddlDay.SelectedValue);
			int oldItems = ShoppingCart.CountOldCarts(days);
			if (oldItems == -1)
				lblCount.Text = "Cound not count the old shopping carts!";
			else if (oldItems == 0)
				lblCount.Text = "There are no old shopping carts.";
			else
				lblCount.Text = "There are <b>" + oldItems + "</b> old shopping carts.";
		}
	}
}