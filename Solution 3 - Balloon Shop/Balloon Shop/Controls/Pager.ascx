<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pager.ascx.cs" Inherits="Balloon_Shop.Controls.Pager" %>
<div class="pager">
	Page
	<asp:Label ID="lblCurrentPage" runat="server" />
	of
	<asp:Label ID="lblHowManyPages" runat="server" />
	|
	<asp:HyperLink ID="lnkPrevious" runat="server" Text="Previous" />
	<asp:Repeater ID="repPager" runat="server">
		<ItemTemplate>
			<asp:HyperLink ID="lnk" runat="server" Text='<%#Eval("Page")%>'
				CssClass='<%#Eval("Url").ToString()==""?"current":"link"%>'
				NavigateUrl='<%#Eval("Url")%>' />
		</ItemTemplate>
	</asp:Repeater>
	<asp:HyperLink ID="lnkNext" runat="server" Text="Next" />
</div>
