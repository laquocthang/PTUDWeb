<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductsList.ascx.cs" Inherits="Balloon_Shop.Controls.ProductsList" %>
<%@ Register Src="Pager.ascx" TagName="Pager" TagPrefix="uc1" %>

<uc1:Pager ID="pagerTop" runat="server" Visible="False" />
<asp:DataList ID="dlProdList" runat="server" RepeatColumns="2">
	<ItemTemplate>
		<div class="prod list">
			<a href='<%#DataAccess.Link.ToProduct(Eval("ProductID").ToString())%>'>
				<img src='<%#DataAccess.Link.ToProductImage(Eval("Thumbnail").ToString())%>'
					alt="<%#HttpUtility.HtmlEncode(Eval("Name").ToString())%>" />
			</a>
			<div class="detail">
				<h3>
					<a href="<%#DataAccess.Link.ToProduct(Eval("ProductID").ToString())%>">
						<%#HttpUtility.HtmlEncode(Eval("Name").ToString())%>
					</a>
				</h3>
				<p>
					<%#HttpUtility.HtmlEncode(Eval("Description").ToString())%>
				</p>
				<p class="price">
					Price: <span><%#Eval("Price","{0:C}")%></span>
				</p>
				<p class="addToCart">
					<a href='<%#DataAccess.Link.ToAddToCard(Eval("ProductID").ToString())%>'>Add To Cart
					</a>
				</p>
			</div>
		</div>
	</ItemTemplate>
</asp:DataList>
<uc1:Pager ID="pagerBottom" runat="server" />

