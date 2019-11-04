<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderPlaced.aspx.cs" Inherits="Balloon_Shop.OrderPlaced" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="title">Checkout Complete</div>
	<p>
		Thank you for you order! Your order number is:
		<b><asp:Label ID="lblOrderNumber" runat="server" /></b>
	</p>
	<p>
		How about shopping for some more balloons in our
		<asp:HyperLink ID="HyperLink1" NavigateUrl="~/" runat="server" Text="shop" />
	</p>
</asp:Content>
