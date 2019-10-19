<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Balloon_Shop.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Label Text="Shopping Cart" runat="server" CssClass="title" ID="lblTitle" />
	<div class="cart">
		<asp:Label runat="server" CssClass="status" ID="lblStatus" />
		<asp:GridView runat="server" ID="grid" CssClass="items" AutoGenerateColumns="false" DataKeyNames="ProductID" GridLines="None">
			<AlternatingRowStyle CssClass="itemsalt" />
			<Columns>
				<asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" ItemStyle-CssClass="name" />
				<asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="true" ItemStyle-CssClass="small" DataFormatString="{0:#.##}" />
				<asp:TemplateField ItemStyle-CssClass="small">
					<HeaderTemplate>Quantity</HeaderTemplate>
					<ItemTemplate>
						<asp:TextBox runat="server" ID="txtQuantity" MaxLength="2" CssClass="quantity" Text='<%#Eval("Quantity") %>' />
					</ItemTemplate>
				</asp:TemplateField>
				<asp:BoundField DataField="Subtotal" HeaderText="Subtotal" ReadOnly="true" ItemStyle-CssClass="small" />
				<asp:TemplateField ItemStyle-CssClass="small">
					<HeaderTemplate>Remove</HeaderTemplate>
					<ItemTemplate>
						<asp:CheckBox ID="chbRemove" runat="server" />
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
		<asp:PlaceHolder runat="server" ID="phToolbar">
			<div class="total">
				<asp:Label ID="Label1" Text="Total amount: " runat="server" />
				<asp:Label ID="lblTotal" Text="" runat="server"
					EnableViewState="false" CssClass="cartTotal" />
			</div>
			<div class="toolbar">
				<asp:Button Text="Update Cart" runat="server" ID="btnUpdate"
					CssClass="button" />
				<asp:HyperLink ID="HyperLink1" NavigateUrl="~/Checkout.aspx" runat="server" Text="Checkout" CssClass="button" />
			</div>
		</asp:PlaceHolder>
	</div>
</asp:Content>
