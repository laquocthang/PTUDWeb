using DataAccess;
using DataAccess.Classes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balloon_Shop.Admin
{
	public partial class EditProduct : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				PopulateControls();
		}

		private void PopulateControls()
		{
			ddlCategory.DataValueField = "CategoryID";
			ddlCategory.DataTextField = "Name";
			ddlCategory.DataSource = Category.All();
			ddlCategory.DataBind();
			string cid = Request.QueryString["cid"] ?? "";
			if (cid != "")
			{
				Product product = Product.Single(cid);
				if (product == null)
					Response.Redirect("~/Admin/Product.aspx");
				lblTitle.Text = "Edit Product";
				lblId.Text = product.ProductID.ToString();
				txtName.Text = product.Name;
				txtDes.Text = product.Description;
				txtPrice.Text = product.Price.HasValue ? product.Price.Value.ToString() : "";
				lblImage.Text = product.Image;
				lblThumbnail.Text = product.Thumbnail;
				chkPromoFront.Checked = product.PromoFront.GetValueOrDefault(false);
				ddlCategory.SelectedValue = product.CategoryID.ToString();
				btnReset.Visible = false;
			}
			else
			{
				lblTitle.Text = "Add Product";
				btnReset.Visible = true;
			}
		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			btnSave.Click += new EventHandler(btnSave_Click);
			btnUploadImage.Click += new EventHandler(btnUploadImage_Click);
			btnUploadThumbnail.Click += new EventHandler(btnUploadThumbnail_Click);
		}

		private bool CheckFileType(string filename)
		{
			string ext = Path.GetExtension(filename);
			switch (ext.ToLower())
			{
				case ".gif":
				case ".png":
				case ".jpg":
				case ".jpeg":
					return true;
				default:
					return false;
			}
		}

		private void Upload(FileUpload file, Label label)
		{
			try
			{
				if (file.HasFile && file.PostedFile.ContentLength <= 500000)
				{
					if (CheckFileType(file.FileName))
					{
						string path = "~/ProductImages/" + file.FileName;
						file.SaveAs(MapPath(path));
						label.Text = file.FileName;
						lblStatus.Text = "Upload successful";
					}
				}
				else
				{
					lblStatus.Text = "Uploading image failed";
				}
			}
			catch (Exception)
			{
				lblStatus.Text = "Uploading image failed";
			}
		}

		private void btnUploadThumbnail_Click(object sender, EventArgs e)
		{
			Upload(fuThumbnail, lblThumbnail);
		}

		private void btnUploadImage_Click(object sender, EventArgs e)
		{
			Upload(fuImage, lblImage);
		}

		private void btnSave_Click(object sender, EventArgs e)
		{
			if (Page.IsValid)
			{
				bool result = false;
				Product product = GetData();
				if (product.ProductID > 0)
				{
					result = Product.Update(product);
					lblStatus.Text = result ? "Update Successful" : "Update failed";
				}
				else
				{
					result = Product.Add(product);
					lblStatus.Text = result ? "Insert Successful" : "Insert Failed";
					if (result)
						ResetForm();
				}
			}
		}

		private Product GetData()
		{
			Product product = null;
			if (lblId.Text != "")
				product = Product.Single(lblId.Text);
			else
				product = new Product();
			product.Name = txtName.Text;
			product.Description = txtDes.Text;
			if (txtPrice.Text != "")
				product.Price = Convert.ToDecimal(txtPrice.Text);
			product.Thumbnail = lblThumbnail.Text;
			product.Image = lblImage.Text;
			product.CategoryID = Convert.ToInt32(ddlCategory.SelectedValue);
			product.PromoFront = chkPromoFront.Checked;
			return product;
		}

		private void ResetForm()
		{
			txtName.Text = "";
			txtDes.Text = "";
			txtPrice.Text = "";
			lblThumbnail.Text = "";
			lblImage.Text = "";
			chkPromoFront.Checked = false;
			ddlCategory.SelectedValue = "0";
		}
	}
}