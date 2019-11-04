using DataAccess.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balloon_Shop.Admin
{
	public partial class Admin_Order : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			lblStatus.Text = "";
		}

		protected void btnGetByRecent_Click(object sender, EventArgs e)
		{
			int count;
			if (int.TryParse(txtCount.Text, out count))
				repOrder.DataSource = Order.ByRecent(count);
			else
				lblStatus.Text = "Please enter a valid number!";
			repOrder.DataBind();
		}

		protected void btnGetByDate_Click(object sender, EventArgs e)
		{
			if (Page.IsValid && (txtStartDate.Text + txtEndDate.Text != ""))
				repOrder.DataSource = Order.ByDate(txtStartDate.Text, txtEndDate.Text);
			else
				lblStatus.Text = "Please enter a valid dates!";
			repOrder.DataBind();
		}

		protected void btnGetByStatus_Click(object sender, EventArgs e)
		{
			repOrder.DataSource = Order.ByStatus(int.Parse(ddlStatus.SelectedValue));
			repOrder.DataBind();
		}

		protected string ShowStatus(object input)
		{
			try
			{
				return Enum.GetName(typeof(Order.OrderStatus), input);
			}
			catch
			{
				return Order.OrderStatus.Pending.ToString();
			}
		}
	}
}