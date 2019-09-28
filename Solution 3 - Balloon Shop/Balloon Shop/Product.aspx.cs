using DataAccess;
using DataAccess.Classes;
using System;
using System.Web;

namespace Balloon_Shop
{
	public partial class Products : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				PopulateControls();
		}

		private void PopulateControls()
		{
			string prodID = Request.QueryString["ProductID"];
			Product product = Product.Single(prodID);
			if (product != null)
			{
				lblName.Text = product.Name;
				lblDes.Text = HttpUtility.HtmlEncode(product.Description);
				lblPrice.Text = string.Format("{0:C}", product.Price);
				prodImage.ImageUrl = Link.ToProductImage(product.Image);
				lnkAddToCart.NavigateUrl = Link.ToAddToCard(prodID);
			}
		}
	}
}