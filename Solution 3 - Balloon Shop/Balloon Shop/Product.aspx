<%@ Page Title="Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Balloon_Shop.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="title">
		Product Details
	</div>
	<div class="prod">
		<h3>
			<asp:Label ID="lblName" runat="server"></asp:Label>
		</h3>
		<asp:Image ID="prodImage" runat="server" />
		<p>
			<asp:Label ID="lblDes" runat="server"></asp:Label>
		</p>
		<p class="price">
			Price:
			<asp:Label ID="lblPrice" runat="server" CssClass="price"></asp:Label>
		</p>
		<p class="addToCart">
			<asp:HyperLink ID="lnkAddToCart" runat="server" Text="Add To Cart"></asp:HyperLink>
		</p>
	</div>
</asp:Content>
