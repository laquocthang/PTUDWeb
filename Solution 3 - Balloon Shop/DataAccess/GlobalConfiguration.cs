using System;
using System.Configuration;

namespace DataAccess
{
	public class GlobalConfiguration
	{
		public static int PageSize { get; }
		public static string SiteName { get; }
		public static int DescriptionLength { get; }
		private static int imagesPerPage;

		static GlobalConfiguration()
		{
			PageSize = Convert.ToInt32(ConfigurationManager.AppSettings["PageSize"]);
			DescriptionLength = Convert.ToInt32(ConfigurationManager.AppSettings["DesLength"]);
			SiteName = ConfigurationManager.AppSettings["SiteName"];
			imagesPerPage = Convert.ToInt32(ConfigurationManager.AppSettings["ImagesPerPage"]);
		}

		public static int ImagesPerPage { get { return imagesPerPage; } }
	}
}
