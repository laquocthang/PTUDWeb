using DataAccess;
using System;

namespace Balloon_Shop.Admin
{
	public partial class Admin_Category : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				PopulateControls();
		}

		private void PopulateControls()
		{
			repCategory.DataSource = Category.All();
			repCategory.DataBind();
		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			btnDelete.Click += new EventHandler(btnDelete_Click);
		}

		private void btnDelete_Click(object sender, EventArgs e)
		{
			string stringID = Request.Form["cid"] ?? "";
			if (stringID != "")
			{
				//foreach (string id in stringID.Split(','))
				//	Category.Delete(id);
				//PopulateControls();
			}
		}
	}
}