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
			<a class="portfolio-link" data-toggle="modal">
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

<script id="con-template" type="text/x-handlebars-template">

  <div class="slide modal" id="modalView" tabindex="-1" role="dialog"
  aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
          aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <br />
      <div align="center">
        <h2>{{title}}</h2>
        <hr class="star-primary">
      </div>
      <div class="modal-body"  align="center">

         <div id="slideimg">
        <div class="cycle-slideshow" data-cycle-fx="scrollHorz"
          data-cycle-timeout="0" data-cycle-prev="#prev" data-cycle-next="#next"
          style="width: 100%; height: auto; display: inline-block;">
          <c:forEach var="i" begin="1" end="5" step="1" varStatus="status">
          	<img id="src" src="/content/download?src={{title}}/${status.count}.png" style="width: auto; height: auto;" class="img-responsive" />
          </c:forEach>
        </div>
     
        <div class=center align="center" style="margin:5px">
          <button type="button" href="#" id="prev" class="btn btn-default">Prev</button>
          <button type="button" href=# id="next" class="btn btn-default">Next</button>
          <button type="button" class="btn btn-default" style=" position:absolute; right:5%" onclick="toggleFullScreen(document.getElementById('slideimg'))">fullScreen</button>
        </div>
      </div>
      </div>
      <div class="class" align="center" style="clear: both;"></div>
      <div style="overflow:auto; height:350px; width:auto;">
      <div class='comments'>
        <div class='loader'></div>
        <div class='inner'>
        <c:if test="${empty user.email}">
        	<div class='add-new' style="border-bottom:2px #ccc7c7 solid">
	            <label for="your-Email" style="font-size: 20px;"><h3>Comments</h3></label><br />
	            <h3>guest : please login!</h3>
	          </div>
        </c:if>
        <c:if test="${!empty user.email}">
	          <div class='add-new' style="border-bottom:2px #ccc7c7 solid">
	            <label for="your-Email" style="font-size: 20px;"><h3>Comments</h3></label><br />
	            <h3 id="aab"></h3>
	            <input class='input your-Email' value=${user.email} type='hidden'>
	            <textarea class='form-control your-msg'
	              placeholder='Type your message here' type='text' rows="3"></textarea>
	            <button class='send-msg btn btn-primary btn-sm' style="margin:5px; float:right;">submit</button> <br/><br>
	          </div>
          </c:if>
          	<div>
          		<h3>${comment.userId}</h3>
          		<h3>${comment.desc}</h3>
          	</div>
        </div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
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

$("#mainRow").on("click",function(list){
	var sourcehtml = $("#con-template").html();
	var template = Handlebars.compile(sourcehtml);
	var resulthtml = template({content:list});
	resulthtml.modal();
	});
</script>