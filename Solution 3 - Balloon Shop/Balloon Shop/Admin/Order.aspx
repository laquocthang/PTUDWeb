<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Balloon_Shop.Admin.Admin_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="title">Order</div>
	<p>
		<asp:Label ID="lblStatus" runat="server" CssClass="status" />
	</p>
	<p>
		Show the most recent
		<asp:TextBox runat="server" ID="txtCount" Width="30" MaxLength="2" />
		records
		<asp:Button Text="Go" runat="server" ID="btnGetByRecent" OnClick="btnGetByRecent_Click" />
	</p>
	<p>
		Show all records created between
		<asp:TextBox runat="server" ID="txtStartDate" Width="100" />
		and
		<asp:TextBox runat="server" ID="txtEndDate" Width="100" />
		<asp:Button Text="Go" runat="server" ID="btnGetByDate" OnClick="btnGetByDate_Click" />
		<asp:RangeValidator ID="rangeStartDate" ErrorMessage="Invalid start date" ControlToValidate="txtStartDate" Display="None" MinimumValue="1/1/2011" MaximumValue="1/1/2015" runat="server" Type="Date" />
		<asp:RangeValidator ID="rangeEndDate" ErrorMessage="Invalid end date" ControlToValidate="txtEndDate" Display="None" MinimumValue="1/1/2011" MaximumValue="1/1/2015" runat="server" Type="Date" />
		<asp:CompareValidator ID="cmpDate" ErrorMessage="Start date should be more recent than end date" Display="None" ControlToValidate="txtStartDate" ControlToCompare="txtEndDate" Operator="LessThan" Type="Date" runat="server" />
		<asp:ValidationSummary ID="validationSummary" ShowMessageBox="true" ShowSummary="false" runat="server" HeaderText="Data validation errors:" />
		<p>
			Show all
			<asp:DropDownList runat="server" ID="ddlStatus">
				<asp:ListItem Text="Pending" Value="0" />
				<asp:ListItem Text="Completed" Value="1" />
				<asp:ListItem Text="Canceled" Value="2" />
			</asp:DropDownList>
			orders
			<asp:Button Text="Go" runat="server" ID="btnGetByStatus" OnClick="btnGetByStatus_Click" />
		</p>
	<asp:Repeater runat="server" ID="repOrder">
		<HeaderTemplate>
			<table class="list">
				<tr>
					<th class="link">Order Number</th>
					<th class="small">Username</th>
					<th class="small">Created</th>
					<th class="small">Shipped</th>
					<th class="small">Status</th>
				</tr>
		</HeaderTemplate>
		<ItemTemplate>
			<tr>
				<td class="link"><a href='OrderDetails.aspx?cid=<%#Eval("OrderID") %>'>Order #<%#Eval("OrderID")%></a></td>
				<td><%#Eval("Username") %></td>
				<td><%#Eval("DateCreated", "{0:dd.MM.yy}") %></td>
				<td><%#Eval("DateShipped", "{0:dd.MM.yy}") %></td>
				<td class="link"><%#ShowStatus(Eval("Status"))%></td>
			</tr>
		</ItemTemplate>
		<AlternatingItemTemplate>
			<tr class="even">
				<td class="link"><a href='OrderDetails.aspx?cid=<%#Eval("OrderID") %>'>Order #<%#Eval("OrderID")%></a></td>
				<td><%#Eval("Username") %></td>
				<td><%#Eval("DateCreated", "{0:dd.MM.yy}") %></td>
				<td><%#Eval("DateShipped", "{0:dd.MM.yy}") %></td>
				<td class="link"><%#ShowStatus(Eval("Status"))%></td>
			</tr>
		</AlternatingItemTemplate>
		<FooterTemplate>
			</table>
		</FooterTemplate>
	</asp:Repeater>
</asp:Content>
