<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="cate">
	<section id="slidelist">
		<div class="container">
			<div class="row">
				<div class="text-center">
					<h2 id="contentName">category</h2>
					<hr class="star-primary">
				</div>
				</br>
			</div>
			<div id="mainRow" style="text-align:center">
				<div id="cateJava" style="float: left; width: 50%;">
						<div align="center">
							<div class="col-lg-12 text-center">
								<h2>java</h2>
								<hr class="star-primary">
							</div>
							<div style="width: 80%; height: auto;">
				           <a href="cateJava.jsp#slidelist"> 
								<img src="img/java/1.jpg" id="javaimg" border="0" style="width: 90%; height: 100%;"></a>
							</div>
						</div>
				</div>
			
				<div id="c_lang" style="float: left; width: 50%;">
						<div align="center">
							<div class="col-lg-12 text-center">
								<h2>c/c++</h2>
								<hr class="star-primary">
							</div>
							<div style="width: 80%; height: auto;">
								<a href="cateC.jsp#slidelist"><img src="img/c_lang/1.jpg" id="c_langimg" border="0" style="width: 90%; height: 100%;"></a>
							</div>
						</div>
				</div>
				
				<div id="windows" style="float: left; width: 50%;">
						<div align="center">
							<div class="col-lg-12 text-center">
								<h2>window</h2>
								<hr class="star-primary">
							</div>
							<div style="width: 80%; height: auto;">
								<a href="cateWindow.jsp#slidelist"><img src="img/windows/1.jpg" id="windowsimg" border="0" style="width: 90%; height: 100%;"></a>
							</div>
						</div>
				</div>
			
				<div id="etc" style="float: left; width: 50%;">
						<div align="center">
							<div class="col-lg-12 text-center">
								<h2>etc</h2>
								<hr class="star-primary">
							</div>
							<div style="width: 80%; height: auto;">
								<a href="cateEtc.jsp#slidelist"><img src="img/etc.png"  id="etcimg" border="0" style="width: 90%; height: 100%;"></a>
							</div>
						</div>
				</div>
			</div>
		</div>
	</section>
</div>

<div class="class" align="center" style="clear: both;">
</br>
</br>
</div>


<script id="row-template" type="text/x-handlebars-template">
{{#each list}}
  <div class="slidelist-item card" style="display:inline-block; padding:0px;">
			<a id="content{{@index}}" class="portfolio-link" data-title={{title}}>
				<div class="caption" style="margin-top:0px;">
						<div class="caption-content">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
				</div>
				<img id="img" class="img-responsive" src="/content/download/?src={{title}}/1.png" alt="">
			</a>
			<div class="col-lg-12 text-center">
				<h4>{{title}}</h4>
			</div>
	</div>
{{/each}}
</script>

<script src="node_modules/handlebars/dist/handlebars.js"></script>

<script>
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
					console.log(data);
					var sourcehtml = $("#row-template").html();
					var template = Handlebars.compile(sourcehtml);
					var resulthtml = template({
						list : data["list"]
					});
					$('#mainRow').html(resulthtml);
					$("#contentName").text("keyword :  " + searchCd);
					location.href = "#mainRow";
				} else {
					alert("불러오기 실패");
				}

			}
		});

	});
	
	function search() {
		var searchCd = $("#searchKeyword").val() //검색할 코드 (실제로 예제에서는 사용 안함)

		//검색할 코드를 넘겨서 값을 가져온다.      
		$.ajax({
			dataType : "json",
			type : "GET",
			url : "/content/getContentListByKeyword/" + searchCd,
			async : false,
			success : function(data) {
				if (data != null) {
					console.log(data);
					var sourcehtml = $("#row-template").html();
					var template = Handlebars.compile(sourcehtml);
					var resulthtml = template({
						list : data["list"]
					});
					$('#mainRow').html(resulthtml);
					$("#contentName").text("keyword :  " + searchCd);
					location.href = "#mainRow";
				} else {
					alert("불러오기 실패");
				}

			}
		});
	}
</script>