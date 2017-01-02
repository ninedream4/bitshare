<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<div id="mainRow"></div>
		</div>
	</section>
</div>

<script id="row-template" type="text/x-handlebars-template">
{{#each list}}
  <div class="col-md-4 slidelist-item" style="align:center">
			<a id="content{{@index}}" class="portfolio-link" data-title={{title}}>
				<div class="caption">
					<div class="caption-content">
						<i class="fa fa-search-plus fa-3x"></i>
					</div>
				</div>
				</br>
				<img id="img" class="img-responsive" src="/content/download/?src={{title}}/1.png" alt="">
			</a>
			<div class="col-lg-12 text-center">
				<h3>{{title}}</h3>
			</div>
	</div>
{{/each}}
</script>

<script src="node_modules/handlebars/dist/handlebars.js"></script>

<script>
	$.ajax({
		dataType : "json",
		type : "POST",
		url : "/content/getContentList",
		async : false,
		success : function(data) {
			if (data != null) {
				var sourcehtml = $("#row-template").html();
				var template = Handlebars.compile(sourcehtml);
				var resulthtml = template({
					list : data["list"]
				});
				$('#mainRow').html(resulthtml);
			} else {
				alert("불러오기 실패");
			}
		}
	});

	$("#searchButton").click(function() {
		var searchCd = $("#searchKeyword").val() //검색할 코드 (실제로 예제에서는 사용 안함)

		//검색할 코드를 넘겨서 값을 가져온다.      
		$.ajax({
			dataType : "json",
			type : "GET",
			url : "/content/getContentListByKeyword/" + searchCd,
			async : false,
			success : function(data) {
				if (data != null) {
					var sourcehtml = $("#row-template").html();
					var template = Handlebars.compile(sourcehtml);
					var resulthtml = template({
						list : data["list"]
					});
					$('#mainRow').html(resulthtml);
					
					//               $("#contentname").text("keyword :  "+searchCd);
				} else {
					alert("불러오기 실패");
				}

			}
		});

	});

	$(document.body).on("click", "a[id*='content']", function() {

						$.ajax({
									dataType : "json",
									type : "GET",
									url : "/content/getContent",
									data : {
										title : $(this).data("title")
									},
									async : false,
									success : function(data) {
										$("#contentModalTitle").text(
												data["content"].title);
										var hiddenContentId = "<input type='hidden' name='contentId' value='"+data["content"].contentId+"' />";
										$("#cmtContentId").append(hiddenContentId);
										// 			slideView
										var slideDiv = '<div id="slideShow" class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-timeout="0" data-cycle-prev="#prev" data-cycle-next="#next" style="width: 100%; height: auto; display: inline-block;">';
										var img = '';
										for (var i = 1; i <= data["content"].fileLength; i++) {
											img += '<img src="/content/download?src='
													+ data["content"].title
													+ '/'
													+ i
													+ '.png" style="width: auto; height: auto;" class="img-responsive" />';
										}
										slideDiv += img + '</div>';
										$("#contentModalSlide").html(slideDiv);

										// 			prev next button
										var btnPrev = '<input type="image" src="/img/slideBtn/left.png" href="#" id="prev"></input>';
										var btnNext = '<input type="image" src="/img/slideBtn/right.png" href="#" id="next"></input>';
										$("#contentModalBtn").html(
												btnPrev + btnNext);

										// 			comments
										var cmt = '';
										for ( var i in data["comments"]) {
											var cmtUser = '<span style="font: bold; color:#33BEB8; font-size: 15pt;">'
													+ data["comments"][i].userId
													+ '</span>';
											var cmtDesc = '<span> • '
													+ data["comments"][i].regDate
													+ '</span><br/>';
											cmtDesc += '<span>'
													+ data["comments"][i].cmtDesc
													+ '</span>';
											cmtDesc += '<hr style="border: #E5E5E5 solid 1px"></hr>';
											cmt += cmtUser + cmtDesc;
										}
										$("#cmtBody").html(cmt);

										$('.cycle-slideshow').cycle();

										// 			content desc
										var descUser = '<span style="font: bold; color:#33BEB8; font-size: 15pt;">'
												+ data["content"].userId
												+ '</span>';
										var descRegDate = '<span> • '
												+ data["content"].regDate
												+ '</span><br/>';
										var descContent = '<span>'
												+ data["content"].fileDesc
												+ '</span><br/>';
										var desc = descUser + descRegDate
												+ descContent;

										$("#contentModalDesc").html(desc);

										$("#contentModal").modal();
									}
								});
					});
</script>
