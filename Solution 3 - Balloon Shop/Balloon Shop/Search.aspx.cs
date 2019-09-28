using System;

namespace Balloon_Shop
{
	public partial class Search : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string searchString = Request.QueryString["Search"] ?? "";
			if (searchString != "")
				lblDes.Text = "You searched for \"" + searchString + "\"";
		}
	}
}