using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DataAccess
{
	public class Redirector
	{
		public static void RedirectIfNotAuthenticated(string destPage)
		{
			HttpContext context = HttpContext.Current;
			if (context != null)
			{
				if (context.User.Identity.IsAuthenticated == false)
				{
					context.Response.Redirect(destPage);
				}
			}
		}

		public static void RedirectIfNotAuthenticated()
		{
			RedirectIfNotAuthenticated("~/Login.aspx");
		}
	}
}
