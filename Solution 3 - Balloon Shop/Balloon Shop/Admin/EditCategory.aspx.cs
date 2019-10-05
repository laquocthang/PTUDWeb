using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balloon_Shop.Admin
{
	public partial class EditCategory : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				PopulateControls();
		}

		private void PopulateControls()
		{
			string cid = Request.QueryString["cid"] ?? "";
			if (cid != "")
			{
				Category data = Category.Single(cid);
				if (data == null)
					Response.Redirect("~/Admin/Category.aspx");
				lblTitle.Text = "Edit Category";
				lblId.Text = data.CategoryID.ToString();
				txtName.Text = data.Name;
				txtDes.Text = data.Description;
				btnReset.Visible = false;
			}
			else
			{
				lblTitle.Text = "Add Category";
				btnReset.Visible = true;
			}
		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			btnSave.Click += new EventHandler(btnSave_Click);
		}

		private void btnSave_Click(object sender, EventArgs e)
		{
			if (Page.IsValid)
			{
				bool result = false;
				Category data = GetData();
				if (data.CategoryID > 0)
				{
					result = Category.Update(data);
					lblStatus.Text = result ? "Update successful" : "Update failed";
				}
				else
				{
					result = Category.Add(data);
					lblStatus.Text = result ? "Insert successful" : "Insert failed";
				}
				if (result)
					ResetForm();
			}
		}

		private void ResetForm()
		{
			txtName.Text = "";
			txtDes.Text = "";
		}

		private Category GetData()
		{
			Category data = null;
			if (lblId.Text != "")
				data = Category.Single(lblId.Text);
			else
				data = new Category();
			data.Name = txtName.Text;
			data.Description = txtDes.Text;
			return data;
		}
	}
}