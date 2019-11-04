<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Balloon_Shop.Admin.Login" %>

<!DOCTYPE html>

<head runat="server">
	<title>Login</title>
	<style type="text/css">
		body {
			font-family: Verdana, Helvetica, Arial, sans-serif;
			font-size: 67.5%;
		}

		.container {
			font-size: 1.2em;
			text-align: left;
			margin: 10% 35%;
		}

		.info {
			margin: 1em 0 0 4em;
		}

			.info legend {
				font-weight: bold;
				font-size: 1.2em;
				margin-bottom: 0.5em;
			}

			.info label {
				display: block;
			}

			.info p {
				margin-bottom: 0.4em;
			}

			.info .textEntry, .info .passwordEntry {
				background-color: #fff;
				padding: 2px;
				border: solid 1px #bbb;
				width: 180px;
			}

			.info label.inline {
				display: inline;
			}

			.info .submitButton {
				margin-top: 0.5em;
			}
	</style>
</head>
<body>
	<form id="form1" runat="server">
		<div class="container">
			<asp:Login ID="LoginUser" runat="server" EnableViewState="false"
				RenderOuterTable="false">
				<LayoutTemplate>
					<asp:ValidationSummary ID="LoginUserValidationSummary" runat="server"
						CssClass="failureNotification"
						ValidationGroup="LoginUserValidationGroup"
						ShowSummary="false" />
					<div class="info">
						<fieldset class="login">
							<legend>Log In</legend>
							<p>
								<asp:Label ID="UserNameLabel" runat="server"
									AssociatedControlID="UserName">Username:</asp:Label>
								<asp:TextBox ID="UserName" runat="server"
									CssClass="textEntry"></asp:TextBox>
								<asp:RequiredFieldValidator ID="UserNameRequired"
									runat="server" ControlToValidate="UserName"
									CssClass="failureNotification" ErrorMessage="User
Name is required."
									ToolTip="User Name is required."
									ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
							</p>
							<p>
								<asp:Label ID="PasswordLabel" runat="server"
									AssociatedControlID="Password">Password:</asp:Label>
								<asp:TextBox ID="Password" runat="server"
									CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
								<asp:RequiredFieldValidator ID="PasswordRequired"
									runat="server" ControlToValidate="Password"
									CssClass="failureNotification"
									ErrorMessage="Password is required." ToolTip="Password is required."
									ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
							</p>
							<p>
								<asp:CheckBox ID="RememberMe" runat="server" />
								<asp:Label ID="RememberMeLabel" runat="server"
									AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
							</p>
							<span class="failureNotification">
								<asp:Literal ID="FailureText"
									runat="server"></asp:Literal>
							</span>
							<p class="submitButton">
								<asp:Button ID="LoginButton" runat="server"
									CssClass="button" CommandName="Login" Text="Log In"
									ValidationGroup="LoginUserValidationGroup" />
							</p>
						</fieldset>
					</div>
				</LayoutTemplate>
			</asp:Login>
		</div>
	</form>
</body>
</html>