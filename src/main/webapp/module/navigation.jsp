<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav id="mainNav"
			class="navbar navbar-default navbar-fixed-top navbar-custom"
			style="background-color: black;">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll" height=100%>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#menuBar">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="index.jsp">Bit Share</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="menuBar">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					
					<c:if test="${empty user.email}">
					<li><a data-toggle="modal" style="cursor:pointer;" data-target="#categoryView">category</a></li>
					<li><a data-toggle="modal" style="cursor:pointer;" data-target="#login">login</a></li>
					<li><a data-toggle="modal" style="cursor:pointer;" data-target="#signup">signup</a></li>
					</c:if>
					<c:if test="${!empty user.email}">
					<li><a data-toggle="modal" style="cursor:pointer;" data-target="#mypage" id="email1"></a></li>
					<li><a data-toggle="modal" style="cursor:pointer;" data-target="#categoryView">category</a></li>
					<li><a data-toggle="modal" style="cursor:pointer;" data-target="#upload">upload</a></li>
					<li><a data-toggle="modal" style="cursor:pointer;" data-target="#logout">logout</a></li>
					</c:if>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
		<div class="container" style="background-color: black;">
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-left">
					<li class="hidden"><a href="page-top"></a></li>
					<li class="page-scroll"><a href="#java">Java</a></li>
					<li class="page-scroll"><a href="#c_lang">C/C++</a></li>
					<li class="page-scroll"><a href="#windows">Windows</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
				<form name="getContentListForm" id="getContentListForm" method="post"  action="/content/contentList">
					<div id="search">
						<input type="text" id="searchKeyword" name="searchKeyword" placeholder="Search" />
						<button id="button" onclick='getContentListForm()'>
							<i class="fa fa-search"></i>
						</button>
						<div class="spinner">
							<i class="fa fa-spinner"></i>
						</div>
					</div>
				</form>
				</ul>
				<script src="js/search.js"></script>
			</div>
		</div>
		</nav>
<script src="vendor/jquery/jquery.js"></script>
<script type="text/javascript">
$(function(){
	var email="${user.email}";
	var resultEmail=email.split('@');
	
	console.log(resultEmail);
	$("#email1").text("Welcome "+resultEmail[0]);
});
</script>