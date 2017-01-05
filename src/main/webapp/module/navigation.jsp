<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav id="mainNav"
	class="navbar navbar-default navbar-fixed-top navbar-custom"
	style="background-color: black; padding:0px;">
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
			<ul class="nav navbar-nav navbar-left">
			<li id="search">
					<input type="text" id="searchKeyword" name="searchKeyword"
						placeholder="Search" />
					<button id="searchButton">
						<i class="fa fa-search"></i>
					</button>
					
				</li>
				</ul>
			<ul class="nav navbar-nav navbar-right">
				
				<li class="hidden"><a href="#page-top"></a></li>
				<c:if test="${empty user.email}">
					<li><a href="category.jsp" style="cursor: pointer;"
						data-target="#categoryView">category</a></li>
					<li><a data-toggle="modal" style="cursor: pointer;"
						data-target="#login">login</a></li>
					<li><a data-toggle="modal" style="cursor: pointer;"
						data-target="#signup">signup</a></li>
				</c:if>
				<c:if test="${!empty user.email}">
					<li><a  style="cursor: pointer;" id="loginEmail" href="myPage.jsp"></a></li>
					<li><a href="category.jsp" style="cursor: pointer;"
						data-target="#categoryView">category</a></li>
					<li><a data-toggle="modal" style="cursor: pointer;"
						data-target="#upload">upload</a></li>
					<li><a data-toggle="modal" style="cursor: pointer;"
						data-target="#logout">logout</a></li>
				</c:if>
			</ul>
		</div>
	</div>

	<!-- /.container-fluid -->
	<div class="container" >
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				
			</ul>
		</div>
	</div>
</nav>

<script src="vendor/jquery/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		var email = "${user.email}";
		var resultEmail = email.split('@');

		$("#loginEmail").text("Welcome " + resultEmail[0]);
	});
	
</script>