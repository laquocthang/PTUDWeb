using System;

namespace Balloon_Shop.Controls
{
	public partial class Pager : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		public void Show(int currentPage, int howManyPages, string firstPageUrl, string pageUrlFormat, bool showPages)
		{
			if (howManyPages > 1)
			{
				this.Visible = true;
				lblCurrentPage.Text = currentPage.ToString();
				lblHowManyPages.Text = howManyPages.ToString();
				if (currentPage == 1)
				{
					lnkPrevious.Enabled = false;
					lnkPrevious.CssClass = "disabled";
				}
				else
					lnkPrevious.NavigateUrl = currentPage == 2 ? firstPageUrl : string.Format(pageUrlFormat, currentPage - 1);

				if (currentPage == howManyPages)
				{
					lnkNext.Enabled = false;
					lnkNext.CssClass = "disabled";
				}
				else
					lnkNext.NavigateUrl = string.Format(pageUrlFormat, currentPage + 1);
				if (showPages)
				{
					PageURL[] pages = new PageURL[howManyPages];
					pages[0] = new PageURL("1", firstPageUrl);
					for (int i = 2; i <= howManyPages; i++)
						pages[i - 1] = new PageURL(i.ToString(), string.Format(pageUrlFormat, i));
					if (currentPage >= 0 && currentPage < howManyPages)
						pages[currentPage - 1] = new PageURL(currentPage.ToString(), "");
					repPager.DataSource = pages;
					repPager.DataBind();
				}
			}
			else
				this.Visible = false;
		}
	}

	public class PageURL
	{
		public string Page { get; set; }
		public string URL { get; set; }

		public PageURL(string page, string uRL)
		{
			Page = page;
			URL = uRL;
		}
	}
}