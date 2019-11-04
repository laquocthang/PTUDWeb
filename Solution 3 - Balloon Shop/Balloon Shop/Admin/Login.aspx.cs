using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balloon_Shop.Admin
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			LoginUser.LoggedIn += new EventHandler(LoginUser_LoggedIn);
		}

		void LoginUser_LoggedIn(object sender, EventArgs e)
		{
			Response.Redirect("~/Admin");
		}
	}
}