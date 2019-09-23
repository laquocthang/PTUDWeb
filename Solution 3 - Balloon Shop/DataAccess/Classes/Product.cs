using Core;
using System;
using System.Collections.Generic;
using System.Data;

namespace DataAccess.Classes
{
	public class Product
	{
		public int ProductID { get; set; }
		public int CategoryID { get; set; }
		public string Name { get; set; }
		public string Description { get; set; }
		public decimal? Price { get; set; }
		public string Thumbnail { get; set; }
		public string Image { get; set; }
		public bool? PromoFront { get; set; }

		public Product()
		{

		}

		public static Product Single(string productID)
		{
			try
			{
				return CBO.FillObject<Product>(DataProvider.Instance.ExecuteReader("Product_Single", Convert.ToInt32(productID)));
			}
			catch
			{
				return null;
			}
		}

		public static List<Product> InCategory(string categoryID, string page, out int howManyPages)
		{
			IDataReader reader = null;
			try
			{
				//Do ket qua tra ve la hai bang
				int pageSize = GlobalConfiguration.PageSize;
				reader = DataProvider.Instance.ExecuteReader("Product_InCategory", Convert.ToInt32(categoryID), GlobalConfiguration.DescriptionLength, Convert.ToInt32(page), pageSize);
				reader.Read(); //Bang dau tien
				howManyPages = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
				reader.NextResult(); //Bang thu hai
				return CBO.FillCollection<Product>(reader);
			}
			catch
			{
				if (reader != null && reader.IsClosed == false)
					reader.Close();
				howManyPages = 0;
				return new List<Product>();
			}
		}

		public static List<Product> OnPromo(string page, out int howManyPages)
		{
			IDataReader reader = null;
			try
			{
				//Do ket qua tra ve la hai bang
				int pageSize = GlobalConfiguration.PageSize;
				reader = DataProvider.Instance.ExecuteReader("Product_OnPromo", GlobalConfiguration.DescriptionLength, page, GlobalConfiguration.PageSize);
				reader.Read(); //Bang dau tien
				howManyPages = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
				reader.NextResult(); //Bang thu hai
				return CBO.FillCollection<Product>(reader);
			}
			catch
			{
				if (reader != null && reader.IsClosed == false)
					reader.Close();
				howManyPages = 0;
				return new List<Product>();
			}
		}
	}
}
