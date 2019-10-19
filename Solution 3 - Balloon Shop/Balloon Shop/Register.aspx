<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Balloon_Shop.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
		<WizardSteps>
			<asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
				<ContentTemplate>
					<div class="title">
						Create a New Account
					</div>
					<p>
						Use the form below to create a new account.<br />
						Passwords are required to be a minimum of
						<%= Membership.MinRequiredPasswordLength %> characters in length.
					</p>
					<span class="failureNotification">
						<asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
					</span>
					<div class="info">
						<fieldset class="register">
							<legend>Account Information</legend>
							<p>
								<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name</asp:Label>
								<asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
								<asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="RegisterUserValidationGroup">
*</asp:RequiredFieldValidator>
							</p>
							<p>
								<asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail</asp:Label>
								<asp:TextBox ID="Email" runat="server" CssClass="textEntry"></asp:TextBox>
								<asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" CssClass="failureNotification" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="RegisterUserValidationGroup">
*</asp:RequiredFieldValidator>
							</p>
							<p>
								<asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password</asp:Label>
								<asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
								<asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="RegisterUserValidationGroup">
*</asp:RequiredFieldValidator>
							</p>
							<p>
								<asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">
Confirm Password</asp:Label>
								<asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
								<asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic" ErrorMessage="Confirm Password is required." ID="ConfirmPasswordRequired" runat="server" ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup">
*</asp:RequiredFieldValidator>
								<asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="RegisterUserValidationGroup">
*</asp:CompareValidator>
							</p>
						</fieldset>
						<p class="submitButton">
							<asp:Button ID="CreateUserButton" runat="server" CommandName="MoveNext" text="Create User" CssClass="button" ValidationGroup="RegisterUserValidationGroup" />
						</p>
					</div>
				</ContentTemplate>
				<CustomNavigationTemplate>
				</CustomNavigationTemplate>
			</asp:CreateUserWizardStep>
		</WizardSteps>
	</asp:CreateUserWizard>
</asp:Content>
