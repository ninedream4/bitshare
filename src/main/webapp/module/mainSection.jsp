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
			$("#contentModalTitle").text(data["content"].title);
			
// 			slideView
			var slideDiv = '<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-timeout="0" data-cycle-prev="#prev" data-cycle-next="#next" style="width: 100%; height: auto; display: inline-block;">';
			var img = '';
			for(var i=1; i<=data["content"].fileLength; i++) {
				img += '<img src="/content/download?src='+data["content"].title+'/'+i+'.png" style="width: auto; height: auto;" class="img-responsive" />';
			}
			slideDiv += img+'</div>';
			$("#contentModalSlide").html(slideDiv);
			
// 			prev next button
			var btnPrev = '<button type="button" href="#" id="prev" class="btn btn-default">Prev</button>';
			var btnNext = '<button type="button" href="#" id="next" class="btn btn-default">Next</button>';
			$("#contentModalBtn").html(btnPrev+btnNext);
			
// 			var cmtUser = data["comments"][i].userId;
// 			var cmtDesc = data["comments"][i].desc;
// 			var cmtDiv = "<div style='border:1px #ccc7c7 solid; font:bold 20pt;'>"+cmtUser+cmtDesc+"</div></br>";
// 			$("#contentModalSlide").append(cmtDiv);
			
 			$('.cycle-slideshow').cycle();
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