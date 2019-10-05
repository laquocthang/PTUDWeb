<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditCategory.aspx.cs" Inherits="Balloon_Shop.Admin.EditCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Label ID="lblId" runat="server" Visible="false"></asp:Label>
	<asp:Label ID="lblTitle" runat="server" CssClass="title"></asp:Label>
	<asp:Label runat="server" ID="lblStatus" CssClass="status"></asp:Label>
	<table class="form">
		<tr>
			<td class="label"><span class="require">*</span>Name:</td>
			<td>
				<asp:TextBox runat="server" ID="txtName" CssClass="textEntry"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Please enter the category name" ControlToValidate="txtName" SetFocusOnError="true" Display="Static" CssClass="failureNotification" runat="server"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr>
			<td class="label">Description:</td>
			<td>
				<asp:TextBox runat="server" ID="txtDes" CssClass="textEntry" TextMode="MultiLine" Rows="5"></asp:TextBox></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<asp:Button Text="Save" runat="server" ID="btnSave" />
				<input type="button" value="Cancel" onclick="location.href = 'Category.aspx'" />
				<input type="reset" value="Reset" runat="server" id="btnReset" />
			</td>
		</tr>
	</table>
</asp:Content>
