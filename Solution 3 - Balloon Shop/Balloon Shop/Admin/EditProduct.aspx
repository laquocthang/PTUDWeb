<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="Balloon_Shop.Admin.EditProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Label ID="lblId" runat="server" Visible="false"></asp:Label>
	<asp:Label ID="lblTitle" runat="server" CssClass="title"></asp:Label>
	<asp:Label ID="lblStatus" runat="server" CssClass="status"></asp:Label>
	<table class="form">
		<tr>
			<td class="label"><span class="require">*</span>Category:</td>
			<td>
				<asp:DropDownList runat="server" ID="ddlCategory" AppendDataBoundItems="true">
					<asp:ListItem Value="0">-- Category --</asp:ListItem>
				</asp:DropDownList>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Please select the category" ControlToValidate="ddlCategory" SetFocusOnError="true" Display="Static" CssClass="failureNotification" InitialValue="0" runat="server"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr>
			<td class="label"><span class="require">*</span>Name:</td>
			<td>
				<asp:TextBox runat="server" ID="txtName" CssClass="textEntry"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Please enter the product name" ControlToValidate="txtName" SetFocusOnError="true" Display="Static" CssClass="failureNotification" runat="server"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr>
			<td class="label">Description:</td>
			<td>
				<asp:TextBox runat="server" ID="txtDes" CssClass="textEntry" TextMode="MultiLine" Rows="5"></asp:TextBox></td>
		</tr>
		<tr>
			<td class="label">Price:</td>
			<td>
				<asp:TextBox runat="server" ID="txtPrice" CssClass="textEntry" Width="120"></asp:TextBox></td>
		</tr>
		<tr>
			<td class="label">Thumbnail:</td>
			<td>
				<asp:Label ID="lblThumbnail" runat="server"></asp:Label>
				<asp:FileUpload ID="fuThumbnail" runat="server" />
				<asp:Button ID="btnUploadThumbnail" runat="server" Text="Upload" />
			</td>
		</tr>
		<tr>
			<td class="label">Image:</td>
			<td>
				<asp:Label ID="lblImage" runat="server"></asp:Label>
				<asp:FileUpload ID="fuImage" runat="server" />
				<asp:Button ID="btnUploadImage" runat="server" Text="Upload" />
			</td>
		</tr>
		<tr>
			<td class="label">Promo Front:</td>
			<td><asp:CheckBox runat="server" ID="chkPromoFront" /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<asp:Button Text="Save" runat="server" ID="btnSave" />
				<input type="button" value="Cancel" onclick="location.href = 'Product.aspx'" />
				<input type="reset" value="Reset" runat="server" id="btnReset" />
			</td>
		</tr>
	</table>
</asp:Content>
