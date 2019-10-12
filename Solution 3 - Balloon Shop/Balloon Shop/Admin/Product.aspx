<%@ Page Title="Product" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Balloon_Shop.Admin.Admin_Product" %>

<%@ Register Src="~/Controls/Pager.ascx" TagPrefix="uc1" TagName="Pager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="title">Product</div>
	<div class="toolbar">
		<input type="button" value="Add new product" onclick="location.href = 'EditProduct.aspx'" />
		<asp:Button Text="Delete Selected" runat="server" ID="btnDelete" CssClass="multidelete" />
	</div>
	<uc1:Pager runat="server" ID="PagerTop" />
	<table class="list">
		<thead>
			<tr>
				<th class="cid">
					<input type="checkbox" id="chkAll" /></th>
				<th class="small">Image</th>
				<th>Name</th>
				<th class="small">Price</th>
				<th class="small">Promo</th>
				<th class="id">ID</th>
			</tr>
		</thead>
		<asp:Repeater runat="server" ID="repProd">
			<AlternatingItemTemplate>
				<tr class="even">
					<td>
						<input type="checkbox" name="cid" value='<%#Eval("ProductID")%>' />
					</td>
					<td>
						<img class="image" src='<%#DataAccess.Link.ToProductImage(Eval("Thumbnail").ToString())%>' alt='' />
					</td>
					<td class="link">
						<a href='EditProduct.aspx?cid=<%#Eval("ProductID")%>'><%#Eval("Name")%></a>
					</td>
					<td><%#Eval("Price", "{0:#.##}")%></td>
					<td>
						<asp:LinkButton runat="server" Text='<%#Eval("PromoFront")%>'
							CommandName="UpdatePromo"
							CommandArgument='<%#Eval("ProductID") + "_" + Eval("PromoFront")%>' />
					</td>
					<td class="id"><%#Eval("ProductID")%></td>
				</tr>
			</AlternatingItemTemplate>
			<ItemTemplate>
				<tr>
					<td>
						<input type="checkbox" name="cid" value='<%#Eval("ProductID")%>' /></td>
					<td>
						<img class="image" src='<%#DataAccess.Link.ToProductImage(Eval("Thumbnail").ToString())%>' alt="" /></td>
					<td class="link">
						<a href='EditProduct.aspx?cid=<%#Eval("ProductID")%>'><%#Eval("Name")%></a>
					</td>
					<td><%#Eval("Price", "{0:#.##}")%></td>
					<td>
						<asp:LinkButton runat="server" Text='<%#Eval("PromoFront")%>'
							CommandName="UpdatePromo"
							CommandArgument='<%#Eval("ProductID") + "_" + Eval("PromoFront")%>' />
					</td>
					<td class="id"><%#Eval("ProductID")%></td>
				</tr>
			</ItemTemplate>
		</asp:Repeater>
	</table>
	<uc1:Pager runat="server" ID="PagerBottom" />
</asp:Content>
