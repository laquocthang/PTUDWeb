<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="Balloon_Shop.Admin.ShoppingCarts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="title">
		Shopping Cart
	</div>
	<p>
		<asp:Label Text="" runat="server" ID="lblCount" />
	</p>
	<p>
		How many days?
	<asp:DropDownList runat="server" ID="ddlDay">
		<asp:ListItem Text="All Shopping Carts" Value="0" />
		<asp:ListItem Text="1" Value="1" />
		<asp:ListItem Text="10" Value="10" />
		<asp:ListItem Text="20" Value="20" />
		<asp:ListItem Text="30" Value="30" />
		<asp:ListItem Text="90" Value="90" />
	</asp:DropDownList>
	</p>
	<p>
		<asp:Button Text="Count Old Shopping Carts" runat="server" ID="btnCount" />
		<asp:Button Text="Delete Old SHopping Carts" runat="server" ID="btnDelete" />
	</p>
</asp:Content>
