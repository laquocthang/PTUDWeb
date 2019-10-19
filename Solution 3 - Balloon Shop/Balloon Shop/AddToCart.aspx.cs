using DataAccess.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balloon_Shop
{
	public partial class AddToCart : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.QueryString["ProductID"] != null)
				ShoppingCart.Add(Request.QueryString["ProductID"]);
			Response.Redirect("~/Cart.aspx");
		}
	}
}