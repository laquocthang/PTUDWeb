using DataAccess;
using DataAccess.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balloon_Shop.Admin
{
	public partial class Admin_Product : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				PopulateControls();
		}

		private void PopulateControls()
		{
			int howManyPages = 0;
			string page = Request.QueryString["Page"] ?? "1";
			string firstPageUrl = Link.ToAdminProduct();
			string pagerUrl = Link.ToAdminProduct("{0}");
			repProd.DataSource = Product.Paging(page, out howManyPages);
			repProd.DataBind();
			PagerTop.Show(int.Parse(page), howManyPages, firstPageUrl, pagerUrl, false);
			PagerBottom.Show(int.Parse(page), howManyPages, firstPageUrl, pagerUrl, true);
		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			btnDelete.Click += new EventHandler(btnDelete_Click);
			repProd.ItemCommand += new RepeaterCommandEventHandler(repProd_ItemCommand);
		}

		private void repProd_ItemCommand(object source, RepeaterCommandEventArgs e)
		{
			if (e.CommandName == "UpdatePromo")
			{
				string[] args = e.CommandArgument.ToString().Split('_');
				Product.UpdatePromo(args[0], !Boolean.Parse(args[1]));
				PopulateControls();
			}
		}

		private void btnDelete_Click(object sender, EventArgs e)
		{
			string stringID = Request.Form["cid"] ?? "";
			if (stringID != "")
			{
				foreach (string id in stringID.Split(','))
				{
					Product.Delete(id);
				}
				PopulateControls();
			}
		}
	}
}