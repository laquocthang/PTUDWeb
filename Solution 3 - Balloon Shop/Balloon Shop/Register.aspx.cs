using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balloon_Shop
{
	public partial class Register : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			CreateUserWizard1.CreatedUser += new EventHandler(CreateUserWizard1_CreatedUser);
		}

		private void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
		{
			string username = CreateUserWizard1.UserName;
			Roles.AddUserToRole(username, "Customers");
			FormsAuthentication.SetAuthCookie(username, false);
			string continueUrl = CreateUserWizard1.ContinueDestinationPageUrl;
			if (String.IsNullOrEmpty(continueUrl))
				continueUrl = "~/";
			Response.Redirect(continueUrl);
		}
	}
}