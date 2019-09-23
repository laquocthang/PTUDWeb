using DataAccess;
using System;

namespace Balloon_Shop
{
	public partial class Catalog : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				PopulateControls();
		}

		private void PopulateControls()
		{
			string categoryID = Request.QueryString["CategoryID"] ?? "";
			Category data = Category.Single(categoryID);
			if (data != null)
			{
				lblTitle.Text = data.Name;
				lblDes.Text = data.Description;
			}
		}
	}
}