using DataAccess.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balloon_Shop.Controls
{
	public partial class CartSummary : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Page_PreRender(object sender, EventArgs e)
		{
			PopulateControls();
		}

		protected void Page_Init(object sender, EventArgs e)
		{
			string page = Request.AppRelativeCurrentExecutionFilePath;
			if (String.Compare(page, "~/Cart.aspx", true) == 0)
				this.Visible = false;
			else
				this.Visible = true;
		}

		private void PopulateControls()
		{
			List<Product> items = ShoppingCart.Items();
			if (items.Count == 0)
			{
				repItem.Visible = false;
				lnkViewCart.Visible = false;
				lblCartSummary.Text = "Your shopping cart is empty";
				lblTotal.Text = String.Format("{0:c}", 0);
			}
			else
			{
				repItem.Visible = true;
				repItem.DataSource = items;
				repItem.DataBind();
				lnkViewCart.Visible = true;
				lblCartSummary.Text = "Cart summary ";
				lblTotal.Text = String.Format("{0:c}",
				ShoppingCart.TotalAmount());
			}
		}
	}
}