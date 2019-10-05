<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Balloon_Shop.Admin.Admin_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="title">Category</div>
	<div class="toolbar">
		<input type="button" value="Add new category" onclick="location.href = 'EditCategory.aspx'" />
		<asp:Button Text="Delete selected" runat="server" ID="btnDelete" CssClass="multidelete" />
	</div>
	<table class="list">
		<tr>
			<th class="cid"><input type="checkbox" id="chkAll" /></th>
			<th class="link">Name</th>
			<th class="id">ID</th>
		</tr>
		<asp:Repeater runat="server" ID="repCategory">
			<AlternatingItemTemplate>
				<tr class="even">
					<td><input type="checkbox" value='<%#Eval("CategoryID")%>' name="cid" id="cid" /></td>
					<td class="link"><a href='EditCategory.aspx?cid=<%#Eval("CategoryID")%>'><%#Eval("Name")%></a></td>
					<td><%#Eval("CategoryID")%></td>
				</tr>
			</AlternatingItemTemplate>
			<ItemTemplate>
				<tr>
					<td><input type="checkbox" value='<%#Eval("CategoryID")%>' name="cid" id="cid" /></td>
					<td class="link"><a href='EditCategory.aspx?cid=<%#Eval("CategoryID")%>'><%#Eval("Name")%></a></td>
					<td><%#Eval("CategoryID")%></td>
				</tr>
			</ItemTemplate>
		</asp:Repeater>
	</table>
</asp:Content>
