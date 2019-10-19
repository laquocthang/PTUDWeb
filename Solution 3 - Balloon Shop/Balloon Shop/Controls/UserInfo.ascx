<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.ascx.cs" Inherits="Balloon_Shop.Controls.UserInfo" %>
<asp:LoginView ID="LoginView1" runat="server">
	<AnonymousTemplate>
		<div class="moduletable userinfo">
			<h3>Welcome!</h3>
			<div class="mt-content">
				You are not logged in.
				<br />
				<asp:HyperLink ID="lnkLoginStatus" runat="server" Text="Log In" NavigateUrl="~/Login.aspx" />
				or
				<asp:HyperLink NavigateUrl="~/Register.aspx" ID="lnkRegister" runat="server" Text="Register" ToolTip="Go to the register page" />
			</div>
		</div>
	</AnonymousTemplate>
	<RoleGroups>
		<asp:RoleGroup Roles="Administrators">
			<ContentTemplate>
				<div class="moduletable userinfo">
					<h3>
						<asp:LoginName ID="LoginName1" FormatString="Hello, {0}!" runat="server" />
					</h3>
					<div class="mt-content">
						<asp:HyperLink ID="lnkLogout" runat="server" Text="Logout" NavigateUrl="~/Login.aspx" />
						&nbsp;
						<asp:HyperLink ID="HyperLink2" NavigateUrl="~/CustomerDetails.aspx" Text="Edit Details" ToolTip="Edit your personal details" runat="server" />
						<br />
						<asp:HyperLink ID="HyperLink1" NavigateUrl="~/Admin" Text="Administrator" runat="server" />
					</div>
				</div>
			</ContentTemplate>
		</asp:RoleGroup>
		<asp:RoleGroup Roles="Customers">
			<ContentTemplate>
				<div class="moduletable userinfo">
					<h3>
						<asp:LoginName ID="LoginName1" FormatString="Hello, {0}!" runat="server" />
					</h3>
					<div class="mt-content">
						<asp:HyperLink ID="lnkLogout" runat="server" Text="Logout" NavigateUrl="~/Login.aspx" />
						&nbsp;
						<asp:HyperLink ID="HyperLink2" NavigateUrl="~/CustomerDetails.aspx" Text="Edit Details" ToolTip="Edit your personal details" runat="server" />
					</div>
				</div>
			</ContentTemplate>
		</asp:RoleGroup>
	</RoleGroups>
</asp:LoginView>
