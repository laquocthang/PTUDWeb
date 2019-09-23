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
	}
}
