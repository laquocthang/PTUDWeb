<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Catalog.aspx.cs" Inherits="Balloon_Shop.Catalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Label ID="lblTitle" runat="server" CssClass="title">
	</asp:Label>
	<asp:Label ID="lblDes" runat="server" CssClass="des">
	</asp:Label>
	Place list of products here
</asp:Content>
