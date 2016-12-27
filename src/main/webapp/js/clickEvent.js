$(function(){
	console.log("===");
    
	var sourcehtml = $("#modal-template").html();
	var template = Handlebars.compile(sourcehtml);
	var resulthtml = template({title:"test1"});
	$('#page-top').append(resulthtml);
	$("#modalView").modal();
	
//	$.ajax({
//		dataType:"json",
//		type:"GET",
//		url:"/content/getContent",
//		data: {
//			"title":title
//			},
//		async:false,
//		success:function(data) {
//			var sourcehtml = $("#modal-template").html();
//			var template = Handlebars.compile(sourcehtml);
//			var resulthtml = template({content:data});
//			$('#page-top').append(resulthtml);
//			$("#modalView").modal();
//		}
//	});
	
});