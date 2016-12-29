<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div w3-include-html="content.html"></div>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="slide modal" id="contentModal" tabindex="-1" role="dialog"
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
				<h2 id="contentModalTitle"></h2>
				<hr class="star-primary">
			</div>
			<div class="modal-body" align="center">
				<div id="slideimg">
					<div id="contentModalSlide">
					
					</div>
					
					<div class=center align="center" style="margin: 5px">
						<div id="contentModalBtn">
						</div>
						
						<button type="button" class="btn btn-default"
							style="position: absolute; right: 5%"
							onclick="toggleFullScreen(document.getElementById('slideimg'))">fullScreen</button>
					</div>
				</div>
			</div>
			<div class="class" align="center" style="clear: both;"></div>
			<div style="overflow: auto; height: 350px; width: auto;">
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
							<div class='add-new' style="border-bottom: 2px #ccc7c7 solid">
								<label for="your-Email" style="font-size: 20px;"><h3>Comments</h3></label><br />
								<h3 id="aab"></h3>
								<input class='input your-Email' value=${user.email
									} type='hidden'>
								<textarea class='form-control your-msg'
									placeholder='Type your message here' type='text' rows="3"></textarea>
								<button class='send-msg btn btn-primary btn-sm'
									style="margin: 5px; float: right;">Send</button>
								<br> <br>
							</div>
						</c:if>
						<!--  <div id="contentModalComment">-->





						<!-- </div> -->
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
