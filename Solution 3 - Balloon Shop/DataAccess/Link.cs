using System;
using System.Web;

namespace DataAccess
{
	public class Link
	{
		private static string BuildAbsolute(string relativeUrl)
		{
			Uri uri = HttpContext.Current.Request.Url;
			string app = HttpContext.Current.Request.ApplicationPath;
			if (!app.EndsWith("/"))
				app += "/";
			relativeUrl = relativeUrl.TrimStart('/');
			return HttpUtility.UrlPathEncode(String.Format("http://{0}:{1}{2}{3}", uri.Host, uri.Port, app, relativeUrl));
		}

		public static string ToCategory(string categoryId, string page)
		{
			if (page == "1")
				return BuildAbsolute(String.Format("Catalog.aspx?CategoryID={0}", categoryId));
			else
				return BuildAbsolute(String.Format("Catalog.aspx?CategoryID={0}&Page={1}", categoryId, page));
		}

		public static string ToCategory(string categoryId)
		{
			return ToCategory(categoryId, "1");
		}

		public static string ToCatalog(string page)
		{
			if (page == "1")
				return BuildAbsolute("Catalog.aspx");
			else
				return BuildAbsolute(string.Format("Catalog.aspx?Page={0}", page));
		}

		public static string ToCatalog()
		{
			return ToCatalog("1");
		}

		public static string ToProduct(string productID)
		{
			return BuildAbsolute(string.Format("Product.aspx?ProductID={0}", productID));
		}

		public static string ToProductImage(string filename)
		{
			return BuildAbsolute(string.Format("ProductImages/{0}", filename));
		}

		public static string ToAddToCard(string productID)
		{
			return BuildAbsolute(string.Format("AddToCart.aspx?ProductID={0}", productID));
		}

		public static string ToSearch(string searchString, string page)
		{
			if (page == "1")
				return BuildAbsolute(string.Format("Search.aspx?Search={0}", searchString));
			return BuildAbsolute(String.Format("Search.aspx?Search={0}&Page={1}", searchString, page));
		}

		public static string ToSearch(string searchString)
		{
			return ToSearch(searchString, "1");
		}

		public static string ToAdminProduct(string page)
		{
			if (page == "1")
				return BuildAbsolute(string.Format("Admin/Product.aspx"));
			return BuildAbsolute(String.Format("Admin/Product.aspx?Page={0}", page));
		}

		public static string ToAdminProduct()
		{
			return ToAdminProduct("1");
		}

		public static string ToAdminUpload(string clientId, string page)
		{
			if (page == "1")
				return BuildAbsolute(
				String.Format("Admin/Upload.aspx?id={0}", clientId));
			return BuildAbsolute(
			String.Format("Admin/Upload.aspx?id={0}&Page={1}", clientId, page));
		}

		public static string ToAdminUpload(string clientId)
		{
			return ToAdminUpload(clientId, "1");
		}
	}
}
