<%@ Page Title="Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Balloon_Shop.Search" %>

<%@ Register Src="Controls/ProductsList.ascx" TagName="ProductsList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Label ID="lblTitle" runat="server" CssClass="title" Text="Product Search"></asp:Label>
	<asp:Label ID="lblDes" runat="server" CssClass="des"></asp:Label>
	<uc1:ProductsList ID="ProductsList1" runat="server" />
</asp:Content>
