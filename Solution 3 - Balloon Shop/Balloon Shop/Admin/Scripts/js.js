$(function () {
	var $chkBox = $("input:checkbox[id$=chkAll]");
	var $tblChkBox = $("table.list input:checkbox[name$=cid]");
	$chkBox.click(function () {
		$tblChkBox
			.attr("checked", $chkBox.is(':checked'));
	});
	$tblChkBox.click(function (e) {
		if (!$(this)[0].checked) {
			$chkBox.attr("checked", false);
		}
	});
	$("input.multidelete").click(function () {
		var n = $("table.list input:checkbox[name$=cid]:checked").length;
		if (n == 0) {
			alert('Please choose at least one item to delete!');
		}
		else {
			return confirm('Warning: The selected items will be removed permanently. Are you sure?');
		}
	});
});