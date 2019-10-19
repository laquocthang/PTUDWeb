<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartSummary.ascx.cs" Inherits="Balloon_Shop.Controls.CartSummary" %>
<div class="cartsummary">
	<hr />
	<div class="cs-title">
		<asp:Label ID="lblCartSummary" runat="server" />
		<asp:HyperLink ID="lnkViewCart" NavigateUrl="~/Cart.aspx" runat="server" Text="(view details)" CssClass="viewdetail" />
	</div>
	<table>
		<asp:Repeater runat="server" ID="repItem">
			<ItemTemplate>
				<tr>
					<td><%#Eval("Quantity") %> x
						<a
							href='<%#DataAccess.Link.ToProduct(Eval("ProductID").ToString()) %>'>
							<%#Eval("Name") %>
						</a>
					</td>
				</tr>
			</ItemTemplate>
		</asp:Repeater>
	</table>
	<div class="cs-total">
		Total:
		<asp:Label ID="lblTotal" runat="server" CssClass="cartTotal" />
	</div>
</div>
