using DataAccess;
using DataAccess.Classes;
using System;

namespace Balloon_Shop.Controls
{
	public partial class ProductsList : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				PopulateControls();
		}

		private void PopulateControls()
		{
			int howManyPages = 0;
			string categoryID = Request.QueryString["CategoryID"] ?? "";
			string page = Request.QueryString["Page"] ?? "1";
			string firstPageUrl = "";
			string pagerFormat = "";
			if (categoryID != "")
			{
				dlProdList.DataSource = Product.InCategory(categoryID, page, out howManyPages);
				dlProdList.DataBind();
				firstPageUrl = Link.ToCategory(categoryID);
				pagerFormat = Link.ToCategory(categoryID, "{0}");
			}
			else
			{
				dlProdList.DataSource = Product.OnPromo(page, out howManyPages);
				dlProdList.DataBind();
				firstPageUrl = Link.ToCatalog("1");
				pagerFormat = Link.ToCatalog("{0}");
			}
			pagerTop.Show(int.Parse(page), howManyPages, firstPageUrl, pagerFormat, false);
			pagerBottom.Show(int.Parse(page), howManyPages, firstPageUrl, pagerFormat, true);
		}
	}
}