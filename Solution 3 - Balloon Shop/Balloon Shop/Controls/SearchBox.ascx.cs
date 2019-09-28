using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balloon_Shop.Controls
{
	public partial class SearchBox : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void btnSearch_Click(object sender, EventArgs e)
		{
			string searchString = txtKey.Text.Trim();
			if (searchString.Length > 0)
				Response.Redirect(Link.ToSearch(searchString, "1"));
		}
	}
}