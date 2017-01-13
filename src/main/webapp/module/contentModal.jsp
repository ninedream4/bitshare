<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div w3-include-html="content.html"></div>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  %>
<div class="slide modal" id="contentModal" style="overflow:auto;" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
  <c:if test="${! empty user.email}">
<%-- 	     <c:if test="${user.email==content.email}"> --%>
			<button type="button" class="btn btn-default" data-dismiss="modal">modify</button>
			<button id="deleteBtn" type="button" class="btn btn-default">delete</button>
			 </c:if>
			 
				<button type="button" class="close" data-dismiss="modal"aria-label="Close">			
					<span aria-hidden="true">&times;</span>
				</button>
				 
			</div>
			<br/>
			<div align="center">
				<h2 id="contentModalTitle"></h2>
				<hr class="star-primary">
			</div>
			<div id="slideimg" class="modal-body" align="center" style="background-color:#565453; margin:0px; padding:0px;">
				<div>
					<div id="contentModalSlide"></div>
					<div class=center align="center" style="margin: 5px">
						<span id="contentModalBtn"></span>
						<input id="fullScreenIcon" type="image" src="/img/slideBtn/fullScreen.png" 
								onclick="toggleFullScreen(document.getElementById('slideimg'))"></input>
					</div>
				</div>
			</div>
			<div class="class" align="center" style="clear: both;"></div>
			<div style="overflow: visible; height:auto; width: auto;">
				<div id ="contentModalDescUser" style="margin-left:30px; margin-right:30px; padding:10px;"></div>
				<div id ="contentModalDesc"  style="margin-left:30px; margin-right:30px; padding:10px; border:solid 3px #ccc7c7; border-radius:10px;"></div>
				<div class='comments'>
					<div class='loader'></div>
					<div class='inner'>
						<c:if test="${empty user.email}">
							<div class='add-new' style="border-bottom: 2px #ccc7c7 solid">
								<label for="your-Email" style="font-size: 20px;"><h3>Comments</h3></label><br />
								<h3>guest : please login!</h3>
							</div>
						</c:if>
						<c:if test="${!empty user.email}">
							<form class='add-new' action="/content/addComment" method="post">
								<div id="cmtContentId"></div>
								<label for="your-Email" name="email" style="font-size: 20px;"><h3>Comments</h3></label>
								<h3>${user.email}</h3>
								<textarea class='form-control your-msg' name="cmtDesc"
									placeholder='Type your message here' type='text' rows="3"></textarea>
								<input type="submit" class='send-msg btn btn-primary btn-sm'
									style="margin: 5px; float: right;" value="submit"/>
							</form>
							<hr style="border-bottom: 2px #ccc7c7 solid"/>
						</c:if>
						<div id="contentModalComment">
							<div class="comment">
								<div id="cmtBody" class="body" style="margin:15px"></div>
							</div>
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

<script src="vendor/jquery/jquery.js"></script>
<script type="text/javascript">
$("#deleteBtn").on("click", function() {
	$("#contentDelete").modal();
});
</script>