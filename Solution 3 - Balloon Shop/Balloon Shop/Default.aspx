<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Balloon_Shop.Default" %>

<%@ Register Src="~/Controls/ProductsList.ascx" TagPrefix="uc1" TagName="ProductsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="title">
		Welcome to BalloonShop!
	</div>
	<div class="des">
		This week we have a special price for these fantastic products:
	</div>
	<uc1:ProductsList runat="server" ID="ProductsList" />
</asp:Content>
