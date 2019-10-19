<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="Balloon_Shop.Admin.Upload" %>

<%@ Register Src="~/Controls/Pager.ascx" TagPrefix="uc1" TagName="Pager" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<link href="../Styles/reset.css" rel="stylesheet" />
	<link href="../Styles/site.css" rel="stylesheet" />
	<script type="text/javascript">
		function select(imageName) {
			window.opener.document.getElementById('<%=id %>').value = imageName;
			close();
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<div class="upload">
			<asp:Label runat="server" ID="lblStatus" CssClass="status" />
			<asp:Label ID="lblImageFile" runat="server" Text="Image File:" AssociatedControlID="upImage" />
			<asp:FileUpload ID="upImage" runat="server" />
			<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
			<hr />
			<uc1:Pager runat="server" ID="PagerTop" />
			<div class="imagelist">
				<asp:DataList runat="server" ID="dlImage" RepeatColumns="5" RepeatDirection="Horizontal">
					<ItemTemplate>
						<a href="javascript:void(0)" onclick="select('<%#Eval("Name")%>')"><img src='<%#DataAccess.Link.ToProductImage(Eval("Name").ToString()) %>' /></a>
						<p><%# Eval("Name")%></p>
					</ItemTemplate>
				</asp:DataList>
			</div>
			<uc1:Pager runat="server" ID="PagerBottom" />
		</div>
	</form>
</body>
</html>
