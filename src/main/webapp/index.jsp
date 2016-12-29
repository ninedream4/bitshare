<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Bit Share</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	id="css2">

<!-- Theme CSS -->
<link href="css/freelancer.min.css" rel="stylesheet" id="css1">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/search_style.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<link href="css/fileinputbutton.css" rel="stylesheet" type="text/css">
<link href="css/progress_style.css" rel="stylesheet" type="text/css">

<!-- Comment CSS -->
<link href="css/comment.css" rel="stylesheet" type="text/css">
<!--  fullScreen CSS-->
<link href="css/fullScreen.css" rel="stylesheet" type="text/css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/css/bootstrap-select.min.css">

</head>

<body id="page-top" class="index">

	<!-- Portfolio Modals -->
	<jsp:include page="module/contentModal.jsp"/>
	<!-- login Modal -->
	<jsp:include page="module/loginModal.jsp"/>
	<!-- signup Modal -->
	<jsp:include page="module/signupModal.jsp"/>
	<!-- upload Modal -->
	<jsp:include page="module/uploadModal.jsp"/>
	<!-- logout Modal -->
	<jsp:include page="module/logoutModal.jsp"/>
	<!-- checkSuccess Modal -->
	<jsp:include page="module/checkSuccess.jsp"/>
		
	<!-- Navigation -->
	<jsp:include page="module/navigation.jsp"/>
	<!-- Header -->
	<jsp:include page="module/header.jsp"/>
	
	<div id="mainContent"></div>
	
	<!-- Portfolio Grid Section -->
	<jsp:include page="module/mainSection.jsp"/>
	
	<!-- About Section -->
	<jsp:include page="module/aboutSection.jsp"/>
	<!-- Footer -->
	<jsp:include page="module/footer.jsp"/>
	
	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div
		class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
		<a class="btn btn-primary" href="#page-top"> <i
			class="fa fa-chevron-up"></i>
		</a>
	</div>
		<div id="modalView"></div>
<!-- jQuery -->
<script src="vendor/jquery/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--jQuery.validation  -->
<script src="vendor/jquery/jquery.validate.js"></script>
<!-- Plugin JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<!-- Contact Form JavaScript -->
<script src="js/jqBootstrapValidation.js"></script>
<script src="js/contact_me.js"></script>
<!-- Theme JavaScript -->
<script src="js/freelancer.min.js"></script>
<script src="js/fileUploadButton.js"></script>
<script type="text/javascript" src="js/submit.js"></script>
<script type="text/javascript" src="js/userValidationCheck.js"></script>
<script type="text/javascript" src="js/jquery.form.min.js"></script>
<script type="text/javascript" src="js/fileUpload.js"></script>
<script type="text/javascript" src="js/logInCheck.js"></script>
<script type="text/javascript" src="js/checkTitle.js"></script>
<!-- Slider JavaScript -->
<script src="js/jquery.cycle2.js"></script>
<!-- Comment JavaScript -->
<!-- <script src="js/comment.js"></script> -->
<!-- fullScreen -->  
<script src="js/fullScreen.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/js/bootstrap-select.min.js"></script>

</body>
</html>