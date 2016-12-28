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
			var resulthtml = template({list:data["list"]});
        	$('#mainRow').html(resulthtml);
        } else {
            alert("불러오기 실패");
        }
    }   
});

$("a[id*='content']").on("click",function(){
	$.ajax({
		dataType:"json",
		type:"GET",
		url:"/content/getContent",
		data: {
			title:$(this).data("title")	
		},
		async:false,
		success:function(data) {
			console.log(data);
			$("#contentModalTitle").text(data["content"].title);
			var str = '<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-timeout="0" data-cycle-prev="#prev" data-cycle-next="#next" style="width: 100%; height: auto; display: inline-block;">';
			str += '<img src="/content/download?src=test1/1.png" style="width: auto; height: auto;" class="img-responsive cycle-sentinel cycle-slide" />';
			str += '<img src="/content/download?src=test1/1.png" style="width: auto; height: auto;" class="img-responsive cycle-slide" />';
			str += '</div>';
			$("#contentModalSlide").append(str);
			$("#contentModal").modal();
		}
	});
	
	
// 	var sourcehtml = $("#modal-template").html();
// 	var template = Handlebars.compile(sourcehtml);
// 	var context = {title:$(this).data("title")};
// 	var resulthtml = template(context);
// 	$("#contentModal").html(resulthtml);
// 	$("#contentModal").modal();
});
</script>