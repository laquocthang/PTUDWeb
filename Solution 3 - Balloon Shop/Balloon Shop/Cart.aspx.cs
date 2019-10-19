using DataAccess.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balloon_Shop
{
	public partial class Cart : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				PopulateControls();
		}

		private void PopulateControls()
		{
			List<Product> items = ShoppingCart.Items();
			if (items.Count == 0)
			{
				lblTitle.Text = "Shopping Cart is Empty";
				grid.Visible = false;
				phToolbar.Visible = false;
			}
			else
			{
				grid.DataSource = items;
				grid.DataBind();
				lblTotal.Text = ShoppingCart.TotalAmount().ToString("c");
			}
		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			btnUpdate.Click += new EventHandler(btnUpdate_Click);
		}

		private void btnUpdate_Click(object sender, EventArgs e)
		{
			int rowsCount = grid.Rows.Count;
			GridViewRow row;
			TextBox txtQuantity;
			CheckBox chbRemove;
			string productID;
			int quantity;
			bool success = true;
			for (int i = 0; i < rowsCount; i++)
			{
				row = grid.Rows[i];
				productID = grid.DataKeys[i].Value.ToString();
				txtQuantity = (TextBox)row.FindControl("txtQuantity");
				chbRemove = (CheckBox)row.FindControl("chbRemove");
				if (chbRemove.Checked)
					success = success && ShoppingCart.Remove(productID);
				else if (int.TryParse(txtQuantity.Text, out quantity))
					success = success && ShoppingCart.Update(productID, quantity);
				else
					success = false;
				lblStatus.Text = success ? "Your shopping cart was successfully updated!" : "Some quantity updates or item removes failed! Please verify your cart!";
			}
			PopulateControls();
		}
	}
}