<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Balloon_Shop.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:PlaceHolder runat="server" ID="phAddress">
		<div class="title">Check out</div>
		<div class="info checkout">
			<fieldset class="address">
				<legend>Shipping Information</legend>
				<p>
					<asp:Label ID="FirstNameLabel" runat="server"
						AssociatedControlID="FirstName">(*) First Name</asp:Label>
					<asp:TextBox ID="FirstName" runat="server" CssClass="textEntry"
						MaxLength="50">
					</asp:TextBox>
					<asp:RequiredFieldValidator ID="UserNameRequired" runat="server"
						ControlToValidate="FirstName"
						CssClass="failureNotification" ErrorMessage=" First Name
is required."
						ToolTip="First Name is required."
						ValidationGroup="ShippingValidationGroup">
					</asp:RequiredFieldValidator>
				</p>
				<p>
					<asp:Label ID="LastNameLabel" runat="server"
						AssociatedControlID="FirstName">(*) Last Name</asp:Label>
					<asp:TextBox ID="LastName" runat="server" CssClass="textEntry"
						MaxLength="50">
					</asp:TextBox>
					<asp:RequiredFieldValidator ID="LastNameRequired" runat="server"
						ControlToValidate="LastName"
						CssClass="failureNotification" ErrorMessage=" Last Name is
required."
						ToolTip="Last Name is required."
						ValidationGroup="ShippingValidationGroup">
					</asp:RequiredFieldValidator>
				</p>
				<p>
					<asp:Label ID="EmailLabel" runat="server"
						AssociatedControlID="Email" MaxLength="256">(*) E-mail</asp:Label>
					<asp:TextBox ID="Email" runat="server"
						CssClass="textEntry">
					</asp:TextBox>
					<asp:RequiredFieldValidator ID="EmailRequired" runat="server"
						ControlToValidate="Email" Display="Dynamic"
						CssClass="failureNotification" ErrorMessage=" E-mail is
required."
						ToolTip="E-mail is required."
						ValidationGroup="ShippingValidationGroup">
					</asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="EmailRegular" runat="server"
						ControlToValidate="Email"
						ErrorMessage="Email is not valid."
						ValidationGroup="ShippingValidationGroup" CssClass="failureNotification"
						ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-
.]\w+)*">
					</asp:RegularExpressionValidator>
				</p>
				<p>
					<asp:Label ID="PhoneLabel" runat="server"
						AssociatedControlID="Phone">Phone</asp:Label>
					<asp:TextBox ID="Phone" runat="server" CssClass="textEntry"
						MaxLength="50" TextMode="MultiLine" Height="35">
					</asp:TextBox>
				</p>
				<p>
					<asp:Label ID="AddressLabel" runat="server"
						AssociatedControlID="Address">(*) Shipping Address</asp:Label>
					<asp:TextBox ID="Address" runat="server" CssClass="textEntry"
						TextMode="MultiLine" Rows="4" MaxLength="500">
					</asp:TextBox>
					<asp:RequiredFieldValidator ID="AddressRequired" runat="server"
						ControlToValidate="Address"
						CssClass="failureNotification" ErrorMessage=" Address is
required."
						ToolTip="Address is required."
						ValidationGroup="ShippingValidationGroup">
					</asp:RequiredFieldValidator>
				</p>
				<asp:Button Text="Submit Order" runat="server" CssClass="button"
					ID="btnConfirm" ValidationGroup="ShippingValidationGroup" />
			</fieldset>
		</div>
	</asp:PlaceHolder>
	<asp:PlaceHolder runat="server" ID="phConfirm" Visible="false">
		<div class="title">Check out</div>
		<div class="des">
			Please check all the information below to be sure it's
correct.
		</div>
		<div class="info cart checkout">
			<fieldset>
				<legend>Shopping Cart</legend>
				<asp:GridView runat="server" ID="grid" CssClass="items"
					AutoGenerateColumns="false" GridLines="None">
					<alternatingrowstyle cssclass="itemsalt" />
					<columns>
	<asp:BoundField DataField="Name" HeaderText="Name" ItemStyleCssClass="name"/>
<asp:BoundField DataField="Price" HeaderText="Price"
ItemStyle-CssClass="small" DataFormatString="{0:#.##}"/>
<asp:BoundField DataField="Quantity" HeaderText="Quantity"
ItemStyle-CssClass="small"/>
<asp:BoundField DataField="Subtotal" HeaderText="Subtotal"
SortExpression="Subtotal" ItemStyle-CssClass="small" />
</columns>
				</asp:GridView>
				<div class="total">
					<asp:Label ID="Label1" Text="Total amount: " runat="server" />
					<asp:Label ID="lblTotal" Text="" runat="server"
						EnableViewState="false" CssClass="cartTotal" />
				</div>
			</fieldset>
		</div>
		<div class="info checkout">
			<fieldset>
				<legend>Shipping Information</legend>
				<p>
					<b>Name:</b>
					<asp:Label ID="lblFullName" runat="server" />
				</p>
				<p>
					<b>Email:</b>
					<asp:Label ID="lblEMail" runat="server" />
				</p>
				<p>
					<label><b>Phone: </b></label>
					<asp:Label ID="lblPhone" runat="server" />
				</p>
				<p>
					<label><b>Shipping Address:</b> </label>
					<asp:Label ID="lblAddress" runat="server" />
				</p>
			</fieldset>
			<br />
			<asp:Button Text="Submit Order" runat="server" CssClass="button"
				ID="btnSumitOrder" />
		</div>
	</asp:PlaceHolder>
	<asp:PlaceHolder runat="server" ID="phError" Visible="false">
		<div class="title">Checkout Error</div>
		<p>
			We're sorry, we've hit an unexpected error.
			<a href='Checkout.aspx'>Click here</a> if you'd like to go back and
try that again
		</p>
	</asp:PlaceHolder>
</asp:Content>
