<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="hidden" id="contents" name="contents" value="">

<div id="recent">
	<section id="slidelist">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>recent contents</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div id="mainRow">
				
			</div>
		</div>
	</section>
</div>

<script id="row-template" type="text/x-handlebars-template">
{{#each list}}
  <div class="col-md-4 slidelist-item">
			<a id="content{{@index}}" class="portfolio-link" data-title={{title}}>
				<div class="caption">
					<div class="caption-content">
						<i class="fa fa-search-plus fa-3x"></i>
					</div>
				</div>
				<img id="img" class="img-responsive" src="/content/download/?src={{title}}/1.png" alt="">
			</a>
			<h3>{{title}}</h3>
	</div>
{{/each}}
</script>

<script src="node_modules/handlebars/dist/handlebars.js"></script>
<script>
$.ajax({
	dataType:"json",
	type:"POST",
	url:"/content/getContentList",
	async:false,
	success:function(data) {
        if (data != null) {
			var sourcehtml = $("#row-template").html();
			var template = Handlebars.compile(sourcehtml);
			var resulthtml = template({list:data});
        	$('#mainRow').html(resulthtml);
        } else {
            alert("불러오기 실패");
        }
    }   
});

$("a[id*='content']").on("click",function(){
	console.log($(this).data("title"));
	
	var sourcehtml = $("#modal-template").html();
	var template = Handlebars.compile(sourcehtml);
	var resulthtml = template({title:$(this).data("title")});
	$('#modalView').remove();
	$('#page-top').append(resulthtml);
	$("#modalView").modal();
	/*
	$.ajax({
		type:"GET",
		url:"js/clickEvent.js",
		dataType:"script",
		data:{
			"title":$(this).data("title")
		},
		success:function() {
// 			console.log(data);
		}
	});
	*/
// 	$.getScript("/js/clickEvent.js", function(data) {
// 		console.log(data);
// 	});
});
</script>