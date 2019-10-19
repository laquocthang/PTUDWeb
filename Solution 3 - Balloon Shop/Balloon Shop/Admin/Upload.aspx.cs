using DataAccess;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balloon_Shop.Admin
{
	public partial class Upload : System.Web.UI.Page
	{
		public string id = "";

		protected void Page_Load(object sender, EventArgs e)
		{
			id = Request.QueryString["id"] ?? "";
			if (!IsPostBack)
				PopulateControls();
		}

		private void PopulateControls()
		{
			int pageSize = GlobalConfiguration.ImagesPerPage;
			string imageFolder = MapPath("~/ProductImages");
			DirectoryInfo dir = new DirectoryInfo(imageFolder);
			FileInfo[] allFiles = dir.GetFiles();
			int totalFiles = allFiles.Length;
			string page = Request.QueryString["Page"] ?? "1";
			int howManyPages = (int)Math.Ceiling((double)totalFiles / (double)pageSize);
			int currentPage = int.Parse(page);
			int skip = (currentPage - 1) * pageSize;
			FileInfo[] files = allFiles.OrderByDescending(x => x.CreationTime).Skip(skip).Take(pageSize).ToArray();
			dlImage.DataSource = files;
			dlImage.DataBind();
			string firstPageUrl = Link.ToAdminUpload(id);
			string pagerUrl = Link.ToAdminUpload(id, "{0}");
			PagerTop.Show(currentPage, howManyPages, firstPageUrl, pagerUrl, false);
			PagerBottom.Show(currentPage, howManyPages, firstPageUrl, pagerUrl, true);
		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			btnUpload.Click += new EventHandler(btnUpload_Click);
		}
		bool CheckFileType(string fileName)
		{
			string ext = Path.GetExtension(fileName);
			switch (ext.ToLower())
			{
				case ".gif":
					return true;
				case ".png":
					return true;
				case ".jpg":
					return true;
				case ".jpeg":
					return true;
				default:
					return false;
			}
		}

		protected void btnUpload_Click(object sender, EventArgs e)
		{
			try
			{
				if (upImage.HasFile && upImage.PostedFile.ContentLength <= 500000)
				{
					if (CheckFileType(upImage.FileName))
					{
						string filePath = "~/ProductImages/" + upImage.FileName;
						upImage.SaveAs(MapPath(filePath));
						lblStatus.Text = "Upload successful";
						PopulateControls();
					}
				}
				else
					lblStatus.Text = "Uploading image failed!";
			}
			catch (Exception)
			{
				lblStatus.Text = "Uploading image failed!";
			}
		}
	}
}