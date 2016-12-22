$(document).ready(function() {
	$("#title").on('keyup', function() {
		var param = $("#title").val();
		$.post('/content/checkTitle', {
			"title" : param
		}, function(data) {
			if (data == false) {
				$("#errorTitle").show();
			} else {
				$("#errorTitle").hide();
			}
		})
	});
});