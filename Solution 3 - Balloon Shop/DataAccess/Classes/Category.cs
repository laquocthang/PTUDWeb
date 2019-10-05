using Core;
using System;
using System.Collections.Generic;

namespace DataAccess
{
	public partial class Category
	{
		public int CategoryID { get; set; }
		public string Name { get; set; }
		public string Description { get; set; }

		public Category()
		{

		}

		public static List<Category> All()
		{
			return CBO.FillCollection<Category>(DataProvider.Instance.ExecuteReader("Category_All"));
		}

		public static Category Single(string categoryID)
		{
			try
			{
				return CBO.FillObject<Category>(DataProvider.Instance.ExecuteReader("Category_Single", Convert.ToInt32(categoryID)));
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
				return Convert.ToInt32(result) > 0;
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
				return result > 0;
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
				return result > 0;
			}
			catch
			{
				return false;
			}
		}

	}
}
