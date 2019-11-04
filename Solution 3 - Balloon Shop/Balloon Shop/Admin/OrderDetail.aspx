<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="Balloon_Shop.Admin.OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Label ID="lblOrderID" runat="server" Visible="false" />
	<asp:Label runat="server" ID="lblTitle" CssClass="title" />
	<asp:Label runat="server" ID="lblStatus" CssClass="status" />
	<table class="form">
		<tr>
			<td colspan="2" class="info">Order Information</td>
		</tr>
		<tr>
			<td class="label">Username: </td>
			<td>
				<asp:Label ID="lblUsername" runat="server" /></td>
		</tr>
		<tr>
			<td class="label">Total Amount: </td>
			<td>
				<asp:Label ID="lblTotalAmount" runat="server" /></td>
		</tr>
		<tr>
			<td class="label">Status: </td>
			<td>
				<asp:DropDownList runat="server" ID="ddlStatus">
					<asp:ListItem Text="Pending" Value="0" />
					<asp:ListItem Text="Completed" Value="1" />
					<asp:ListItem Text="Canceled" Value="2" />
				</asp:DropDownList>
			</td>
		</tr>
		<tr>
			<td class="label">Date Created: </td>
			<td>
				<asp:TextBox runat="server" ID="txtDateCreated" CssClass="textEntry" /></td>
		</tr>
		<tr>
			<td class="label">Date Shipped: </td>
			<td>
				<asp:TextBox runat="server" ID="txtDateShipped" CssClass="textEntry" /></td>
		</tr>
		<tr>
			<td class="label">Comments: </td>
			<td>
				<asp:TextBox runat="server" ID="txtComments" TextMode="MultiLine" Rows="2" CssClass="textEntry" /></td>
		</tr>
		<tr>
			<td colspan="2" class="info">Shipping Information</td>
		</tr>
		<tr>
			<td class="label">First Name: </td>
			<td>
				<asp:TextBox runat="server" ID="txtFirstName" CssClass="textEntry" /></td>
		</tr>
		<tr>
			<td class="label">Last Name: </td>
			<td>
				<asp:TextBox runat="server" ID="txtLastName" CssClass="textEntry" /></td>
		</tr>
		<tr>
			<td class="label">Email: </td>
			<td>
				<asp:TextBox runat="server" ID="txtEmail" CssClass="textEntry" /></td>
		</tr>
		<tr>
			<td class="label">Phone: </td>
			<td>
				<asp:TextBox runat="server" ID="txtPhone" CssClass="textEntry" TextMode="MultiLine" Rows="2" /></td>
		</tr>
		<tr>
			<td class="label">Address: </td>
			<td>
				<asp:TextBox runat="server" ID="txtAddress" CssClass="textEntry" TextMode="MultiLine" Rows="3" /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<asp:Button Text="Edit" ID="btnEdit" runat="server" />
				<asp:Button Text="Update" ID="btnUpdate" runat="server" />
				<asp:Button Text="Cancel" ID="btnCancel" runat="server" />
				<br />
				<br />
				<asp:Button Text="Mark Pending" runat="server" ID="btnMarkPending" />
				<asp:Button Text="Mark Completed" runat="server" ID="btnMarkCompleted" />
				<asp:Button Text="Mark Canceled" runat="server" ID="btnMarkCanceled" />
			</td>
		</tr>
	</table>
	<br />
	<p>
		The order contains these items:
	</p>
	<asp:Repeater runat="server" ID="repItem">
		<HeaderTemplate>
			<table class="list">
				<tr>
					<th class="id">ID</th>
					<th class="link">Name</th>
					<th class="small">Quantity</th>
					<th class="small">UnitCost</th>
					<th class="small">Subtotal</th>
				</tr>
		</HeaderTemplate>
		<AlternatingItemTemplate>
			<tr class="even">
				<td><%#Eval("ProductID") %></td>
				<td class="link"><%#Eval("ProductName")%></td>
				<td><%#Eval("Quantity") %></td>
				<td><%#Eval("UnitCost") %></td>
				<td><%#Eval("Subtotal") %></td>
			</tr>
		</AlternatingItemTemplate>
		<ItemTemplate>
			<tr>
				<td><%#Eval("ProductID") %></td>
				<td class="link"><%#Eval("ProductName")%></td>
				<td><%#Eval("Quantity") %></td>
				<td><%#Eval("UnitCost") %></td>
				<td><%#Eval("Subtotal") %></td>
			</tr>
		</ItemTemplate>
		<FooterTemplate>
			</table>
		</FooterTemplate>
	</asp:Repeater>
</asp:Content>
