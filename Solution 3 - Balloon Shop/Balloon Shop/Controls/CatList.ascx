<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CatList.ascx.cs" Inherits="Balloon_Shop.Controls.CartList" %>
<asp:Repeater runat="server" ID="repCatList">
	<HeaderTemplate>
		<div class="moduletable">
			<h3>Our Products</h3>
			<ul>
	</HeaderTemplate>
	<ItemTemplate>
		<li>
			<asp:HyperLink ID="lnkCat" runat="server" />
		</li>
	</ItemTemplate>
	<FooterTemplate>
		</ul> </div>
	</FooterTemplate>
</asp:Repeater>
