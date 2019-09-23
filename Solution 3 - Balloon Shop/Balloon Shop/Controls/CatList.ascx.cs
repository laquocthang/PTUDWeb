using DataAccess;
using System;
using System.Web.UI.WebControls;

namespace Balloon_Shop.Controls
{
	public partial class CartList : System.Web.UI.UserControl
	{
		private string categoryID = "";

		protected void Page_Load(object sender, EventArgs e)
		{
			categoryID = Request.QueryString["CategoryID"];
			if (!IsPostBack) //Neu lan dau tien
				PopulateControls();
		}

		/// <summary>
		/// Get category list
		/// </summary>
		private void PopulateControls()
		{
			repCatList.DataSource = Category.All();
			repCatList.DataBind();
		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			repCatList.ItemDataBound += new System.Web.UI.WebControls.RepeaterItemEventHandler(repCatList_ItemDataBound);
		}

		/// <summary>
		/// ItemDataBound Event of Repeater
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void repCatList_ItemDataBound(object sender, RepeaterItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
			{
				Category data = e.Item.DataItem as Category;
				string id = data.CategoryID.ToString();
				HyperLink lnkCat = (HyperLink)e.Item.FindControl("lnkCat");
				lnkCat.Text = data.Name;
				lnkCat.NavigateUrl = Link.ToCategory(id);
				lnkCat.CssClass = id == categoryID ? "current" : "";
				lnkCat.ToolTip = data.Description;
			}
		}
	}
}