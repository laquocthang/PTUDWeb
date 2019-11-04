using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balloon_Shop
{
	public partial class OrderPlaced : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["OrderNumber"] != null)
			{
				lblOrderNumber.Text = Session["OrderNumber"].ToString();
				Session["OrderNumber"] = null;
			}
			else
			{
				Response.Redirect("~/");
			}
		}
	}
}