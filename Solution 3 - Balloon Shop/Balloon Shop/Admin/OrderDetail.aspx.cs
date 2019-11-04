using DataAccess.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Balloon_Shop.Admin
{
	public partial class OrderDetail : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				PopulateControls();
				SetEditMode(false);
			}
		}

		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);
			btnEdit.Click += new EventHandler(btnEdit_Click);
			btnCancel.Click += new EventHandler(btnCancel_Click);
			btnUpdate.Click += new EventHandler(btnUpdate_Click);
			btnMarkPending.Click += new EventHandler(btnMarkPending_Click);
			btnMarkCompleted.Click += new EventHandler(btnMarkCompleted_Click);
			btnMarkCanceled.Click += new EventHandler(btnMarkCanceled_Click);
		}

		void UpdateStatus(Order.OrderStatus status)
		{
			bool result = Order.UpdateStatus(lblOrderID.Text, status);
			lblStatus.Text = result ? "Update successful" : "Update failed";
			if (result)
				ddlStatus.SelectedValue = ((int)status).ToString();
		}

		void btnMarkCanceled_Click(object sender, EventArgs e)
		{
			UpdateStatus(Order.OrderStatus.Canceled);
		}

		void btnMarkCompleted_Click(object sender, EventArgs e)
		{
			UpdateStatus(Order.OrderStatus.Completed);
		}

		void btnMarkPending_Click(object sender, EventArgs e)
		{
			UpdateStatus(Order.OrderStatus.Pending);
		}

		private void SetEditMode(bool enable)
		{
			txtDateCreated.Enabled = enable;
			txtDateShipped.Enabled = enable;
			txtComments.Enabled = enable;
			txtFirstName.Enabled = enable;
			txtLastName.Enabled = enable;
			txtPhone.Enabled = enable;
			txtEmail.Enabled = enable;
			txtAddress.Enabled = enable;
			ddlStatus.Enabled = enable;
			btnEdit.Enabled = !enable;
			btnUpdate.Enabled = enable;
			btnCancel.Enabled = enable;
			btnMarkCanceled.Enabled = !enable;
			btnMarkCompleted.Enabled = !enable;
			btnMarkPending.Enabled = !enable;
		}

		void btnUpdate_Click(object sender, EventArgs e)
		{
			Order data = Order.Single(lblOrderID.Text);
			try
			{
				data.DateCreated = DateTime.Parse(txtDateCreated.Text);
				if (txtDateShipped.Text != "")
					data.DateShipped = DateTime.Parse(txtDateShipped.Text);
				data.Comments = txtComments.Text;
				data.FirstName = txtFirstName.Text;
				data.LastName = txtLastName.Text;
				data.Email = txtEmail.Text;
				data.Phone = txtPhone.Text;
				data.ShippingAddress = txtAddress.Text;
				bool rs = Order.Update(data); lblStatus.Text = rs ? "Update successful" : "Update failed";
			}
			catch (Exception)
			{
				lblStatus.Text = "Update failed";
				SetData(data);
			}
			SetEditMode(false);
		}

		void btnCancel_Click(object sender, EventArgs e)
		{
			SetEditMode(false);
		}

		void btnEdit_Click(object sender, EventArgs e)
		{
			lblStatus.Text = "";
			SetEditMode(true);
		}

		private void PopulateControls()
		{
			string cid = Request.QueryString["cid"] ?? "";
			if (cid != "")
			{
				Order data = Order.Single(cid);
				if (data == null)
					Response.Redirect("~/Admin/Order.aspx");
				SetData(data);
				btnEdit.Enabled = true;
				btnUpdate.Enabled = false;
				btnCancel.Enabled = false;
				repItem.DataSource = Order.Details(cid);
				repItem.DataBind();
			}
			else
			{
				Response.Redirect("~/Admin/Order.aspx");
			}
		}

		private void SetData(Order data)
		{
			lblOrderID.Text = data.OrderID.ToString();
			lblTitle.Text = "Displaying Order #" + data.OrderID;
			lblTotalAmount.Text = String.Format("{0:c}", data.TotalAmount);
			lblUsername.Text = data.Username;
			txtDateCreated.Text = data.DateCreated.ToShortDateString();
			if (data.DateShipped.HasValue)
				txtDateShipped.Text = data.DateShipped.Value.ToShortDateString();
			ddlStatus.SelectedValue = data.Status.ToString();
			txtComments.Text = data.Comments;
			txtFirstName.Text = data.FirstName;
			txtLastName.Text = data.LastName;
			txtEmail.Text = data.Email;
			txtPhone.Text = data.Phone;
			txtAddress.Text = data.ShippingAddress;
		}
	}
}