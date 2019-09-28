<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchBox.ascx.cs" Inherits="Balloon_Shop.Controls.SearchBox" %>
<asp:Panel runat="server" ID="pnlSearch" CssClass="moduletable search" DefaultButton="btnSearch">
	<h3>Search</h3>
	<div class="mt-content">
		<asp:TextBox runat="server" ID="txtKey" CssClass="text" />
		<asp:Button runat="server" ID="btnSearch" CssClass="button" OnClick="btnSearch_Click"/>
	</div>
</asp:Panel>
