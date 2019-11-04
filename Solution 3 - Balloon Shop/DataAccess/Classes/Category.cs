using Core;
using System;
using System.Collections.Generic;

namespace DataAccess
{
	public partial class Category
	{
		const string cacheKey = "Category_CachedData";

		public int CategoryID { get; set; }
		public string Name { get; set; }
		public string Description { get; set; }

		public Category()
		{

		}

		public static List<Category> All()
		{
			List<Category> data = DataCache.GetCache(cacheKey) as List<Category>;
			if (data == null)
			{
				data = CBO.FillCollection<Category>(
				DataProvider.Instance.ExecuteReader("Category_All"));
				if (data != null && data.Count > 0)
				{
					data.TrimExcess();
					DataCache.SetCache(cacheKey, data);
				}
			}
			return data;
		}

		public static Category Single(string categoryID)
		{
			try
			{
				int id = int.Parse(categoryID);
				return All().Find(delegate (Category c) { return c.CategoryID == id; });
			}
			catch (Exception)
			{
				return null;
			}
		}

		public static bool Add(Category category)
		{
			try
			{
				object result = DataProvider.Instance.ExecuteNonQueryWithOutput("@CategoryID", "Category_Add", category.CategoryID, category.Name, category.Description);
				if (Convert.ToInt32(result) > 0)
				{
					DataCache.RemoveCache(cacheKey);
					return true;
				}
				else
				{
					return false;
				}
			}
			catch
			{
				return false;
			}
		}

		public static bool Update(Category category)
		{
			try
			{
				int result = DataProvider.Instance.ExecuteNonQuery("Category_Update", category.CategoryID, category.Name, category.Description);
				if (result > 0)
				{
					DataCache.RemoveCache(cacheKey);
					return true;
				}
				else return false;
			}
			catch
			{
				return false;
			}
		}

		public static bool Delete(string categoryID)
		{
			try
			{
				int result = DataProvider.Instance.ExecuteNonQuery("Category_Delete", Convert.ToInt32(categoryID));
				if (result > 0)
				{
					DataCache.RemoveCache(cacheKey);
					return true;
				}
				else
				{
					return false;
				}
			}
			catch
			{
				return false;
			}
		}

	}
}
