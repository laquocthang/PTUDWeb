using Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DataAccess.Classes
{
	public partial class ShoppingCart
	{
		public string CartID { get; set; }
		public int ProductID { get; set; }
		public int Quantity { get; set; }
		public DateTime DateAdded { get; set; }

		public ShoppingCart()
		{

		}

		private static string ShoppingCartId
		{
			get
			{
				HttpContext context = HttpContext.Current;
				if (context.Request.Cookies["CartID"] != null)
				{
					return context.Request.Cookies["CartID"].Value;
				}
				else
				{
					string cartId = Guid.NewGuid().ToString();
					HttpCookie cookie = new HttpCookie("CartID", cartId);
					int howManyDays = GlobalConfiguration.CartPersistDays;
					DateTime currentDate = DateTime.Now;
					TimeSpan timeSpan = new TimeSpan(howManyDays, 0, 0, 0);
					DateTime expirationDate = currentDate.Add(timeSpan);
					cookie.Expires = expirationDate;
					context.Response.Cookies.Add(cookie);
					return cartId;
				}
			}
		}

		public static bool Add(string productID)
		{
			try
			{
				int result = DataProvider.Instance.ExecuteNonQuery("ShoppingCart_Add", ShoppingCartId, Convert.ToInt32(productID));
				return result > 0;
			}
			catch
			{
				return false;
			}
		}

		public static bool Update(string productId, int quantity)
		{
			try
			{
				int rs = DataProvider.Instance.ExecuteNonQuery("ShoppingCart_Update",
				ShoppingCartId,
				Convert.ToInt32(productId),
				Convert.ToInt32(quantity));
				return rs > 0;
			}
			catch
			{
				return false;
			}
		}

		public static bool Remove(string productId)
		{
			try
			{
				int rs = DataProvider.Instance.ExecuteNonQuery("ShoppingCart_Remove",
				ShoppingCartId,
				Convert.ToInt32(productId));
				return rs > 0;
			}
			catch
			{
				return false;
			}
		}
		public static List<Product> Items()
		{
			try
			{
				return CBO.FillCollection<Product>(
				DataProvider.Instance.ExecuteReader("ShoppingCart_Items", ShoppingCartId));
			}
			catch
			{
				return new List<Product>();
			}
		}

		public static double TotalAmount()
		{
			try
			{
				object result = DataProvider.Instance.ExecuteScalar("ShoppingCart_TotalAmount", ShoppingCartId);
				return Convert.ToDouble(result);
			}
			catch
			{
				return 0.00;
			}
		}
	}
}
