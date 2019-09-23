using System;
using System.Configuration;

namespace DataAccess
{
	public class GlobalConfiguration
	{
		public static int PageSize { get; }
		public static string SiteName { get; }
		public static int DescriptionLength { get; }

		static GlobalConfiguration()
		{
			PageSize = Convert.ToInt32(ConfigurationManager.AppSettings["PageSize"]);
			DescriptionLength = Convert.ToInt32(ConfigurationManager.AppSettings["DesLength"]);
			SiteName = ConfigurationManager.AppSettings["SiteName"];
		}
	}
}
