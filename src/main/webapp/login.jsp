<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-sc=1">
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


</head>

<body id="page-top" class="index">
  <!-- Portfolio Modals -->
  <div w3-include-html="content.html"></div>



  <div class="portfolio-modal modal fade" id="modalView" tabindex="-1"
    role="dialog" aria-hidden="true">
    <div class="modal-content">
      <div class="close-modal" data-dismiss="modal">
        <div class="lr">
          <div class="rl"></div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <div id="modalBody"></div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <div class="login modal fade" id="login" tabindex="-1" role="dialog"
    aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"   aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>

        </div>
        <div align="center">
          <div class="modal-body">
            <br /> <br /> <br /> <br />
            <h2 class="modal-title" id="myModalLabel">Login</h2>
            <hr class="star-primary"></hr>
            <br /> <br />
            <form name="loginform" method="post" action="/user/login ">
              <div class="form-group" style="width: 70%; margin: auto;">
                <div align="left">
                  <label for="inputEmail" style="font-size: 20px;">Email
                    address </label> <input type="email" class="form-control"  name="email" id="inputEmail" placeholder="Email">
                </div>
              </div>
              <br />
              <div class="form-group" style="width: 70%; margin: auto;">
                <div align="left">
                  <label for="inputPassword" style="font-size: 20px;">Password</label>
                  <input type="password" class="form-control" name="pwd"  id="inputPassword"    placeholder="Password">
                </div>
              </div>
            </form>
            <br /> <br /> <br /> <br /> <br /> <br />
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" onclick='loginsubmit()'>Login</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>


  <div class="modal fade" id="signup" tabindex="-1" role="dialog"
    aria-hidden="true" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"
            aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>

        </div>
        <div class="modal-body">
          <h2 align="center">sign up</h2>
          <hr class="star-primary">
           
        <form name="addUserform" method="post"  action="/user/addUser">
          <div class="form-group" style="width: 70%; margin: auto;">
            <label for="inputEmail" style="font-size: 20px;">Email address</label>
             <input type="text" class="form-control" name="email" id="Email"  placeholder="Email">
          </div>

          <br />

          <div class="form-group" style="width: 70%; margin: auto;">
            <label for="inputPassword" style="font-size: 20px;">Password</label>
            <input type="password" class="form-control" id="inputPassword"    name="pwd" placeholder="Password">
          </div>

          <br />

          <div class="form-group" style="width: 70%; margin: auto;">
            <label for="inputConfirmPassowrd" style="font-size: 20px;">Password Confirm  </label> 
            <input type="password" class="form-control" id="inputConfirmPassowrd"  name="pwd2" placeholder="ConfirmPassowrd">
          </div>

          <br />

          <div class="form-group" style="width: 70%; margin: auto;">
            <label for="inputTag" style="font-size: 20px;">Tag</label> <input
              type="text" class="form-control" id="inputTag" placeholder="Tag">
          </div>
          </form>
          <br />
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-primary"  onclick="addUsersubmit()">Sign Up</button>
          
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

 
  <div class="modal fade" id="upload" " tabindex="-1" role="dialog"
    aria-hidden="true" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"
            aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <div style="text-align: left;"></div>
        </div>
        <div class="modal-body">
          <div style="text-align: center;">
            <h2>upload</h2>
          </div>
          <hr class="star-primary">
          <form name="addContentForm" method="post" action="/content/addContent">
            <div class="form-group" style="width: 70%; margin: auto;">
              <div style="text-align: left">
                <label for="inputTilte" style="font-size: 20px;">Title</label> <input
                  type="textarea" class="form-control" id="inputTitle" name="title"
                  placeholder="Title">
              </div>
            </div>
            <br />
            <div class="form-group" style="width: 70%; margin: auto;">
              <div style="text-align: left">
                <label for="inputTilte" style="font-size: 20px;">Upload</label></br>
                <div class="filebox">
                  <input class="upload-name" value="file...." disabled="disabled">
                  <label for="ex_filename">Upload</label> <input type="file"
                    id="ex_filename" class="upload-hidden" name="filePath">
                </div>
              </div>
            </div>
            <br />
            <div class="form-group" style="width: 70%; margin: auto;">
              <div style="text-align: left">
                <label for="inputTilte" style="font-size: 20px;">Description</label></br>
                <textarea rows="5" cols="30" name="contents"
                  class="form-control" id="inputTitle" name="fileDesc">Description</textarea>
              </div>
            </div>
            <br />
            <div class="form-group" style="width: 70%; margin: auto;">
              <div style="text-align: left">
                <label for="inputTilte" style="font-size: 20px;">Tags</label> <input
                  type="text" class="form-control" id="inputTitle"
                  placeholder="Tags" name="tag">
              </div>
            </div>
            <br />
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" onclick="addContentSubmit()">Submit</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="mypage" tabindex="-1" role="dialog"
    aria-hidden="true" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"
            aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>

        </div>
        <div class="modal-body">
          <h2 align="center">My Page</h2>
          <hr class="star-primary">
           
        <form name="updateUserForm" method="post"  action="/user/updateUser">
        	<div class="form-group" style="width: 70%; margin: auto;">
				<label for="inputEmail" style="font-size: 20px;">Email address</label>
				<input type="text" class="form-control" name="email" id="Email"    value="${user.email }" readonly>
          	</div>

         	 <br />
         	 <div class="form-group" style="width: 70%; margin: auto;">
				<label for="inputPassword" style="font-size: 20px;">Password Update</label>
         	    <input type="password" class="form-control" id="inputPassword" name="pwd" placeholder="Password">
          </div>

          <br />

          <div class="form-group" style="width: 70%; margin: auto;">
            <label for="inputConfirmPassowrd" style="font-size: 20px;">Password Confirm</label> 
            <input type="password" class="form-control" id="inputConfirmPassowrd"  name="pwd2" placeholder="ConfirmPassowrd">
          </div>

          <br />

          <div class="form-group" style="width: 70%; margin: auto;">
            <label for="inputTag" style="font-size: 20px;">Tag</label> 
            <input type="text" class="form-control" id="inputTag" placeholder="Tag">
          </div>
          </form>
          <br />
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-primary"  onclick="updateUserSubmit()">Submit</button>
          
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
    <div class="modal fade" id="logout" tabindex="-1" role="dialog"
    aria-hidden="true" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"
            aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>

        </div>
        <div class="modal-body">
        
           
        <form name="logoutForm" id="logoutForm" method="post"  action="/user/logout">        	
        </form>
          <br/>
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-primary"  onclick="logoutUserSubmit()">Log out</button>
          
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Navigation -->
  <nav id="mainNav"
    class="navbar navbar-default navbar-fixed-top navbar-custom"
    style="background-color: black;">
    <div class="container">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header page-scroll" height=100%>
        <button type="button" class="navbar-toggle" data-toggle="collapse"
          data-target="#menuBar">
          <span class="sr-only">Toggle navigation</span> Menu 
          <i class="fa fa-bars"></i>
        </button>
        <a class="navbar-brand" href="index.html">Bit Share</a>
      </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="menuBar">
        <ul class="nav navbar-nav navbar-right">
        	
        	
          <li class="hidden"><a href="#page-top"></a></li>
          
          <li><span style="color:white">Welcome </br>${user.email }</span></li>
          
          <li class="dropdown">
            <button class="dropbtn">category</button>
            <div class="dropdown-content" style="position: relative;">
              <a href="category.html">java</a> <a href="category.html">c/c++</a>
              <a href="category.html">windows</a>
            </div>
          </li>
          
          <li><a data-toggle="modal" data-target="#upload">upload</a></li>
           
          <li class="dropdown">
          	<button class="dropbtn">MYPAGE</button>
            	<div class="dropdown-content" style="position: relative;">
            	<a data-toggle="modal" data-target="#mypage">정보 수정</a>
            	<a data-toggle="modal" data-target="#mypage">게시물 수정</a>
          </li>
		  
		  <li><a data-toggle="modal" data-target="#logout">logout</a></li>
             
        </div>
      </li>
        <!--   <li><a data-toggle="modal" data-target="#login">login</a></li>
          <li><a data-toggle="modal" data-target="#signup">signup</a></li> -->
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
          <div id="search">
            <input id="input" placeholder="Search" />
            <button id="button">
              <i class="fa fa-search"></i>
            </button>
            <div class="spinner">
              <i class="fa fa-spinner"></i>
            </div>
          </div>
        </ul>
        <script src="js/search.js"></script>
      </div>
    </div>
  </nav>
  <!-- Header -->
  <header>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <img class="img-responsive" src="img/profile.png" alt="">
          <div class="intro-text">
            <span class="name">Bit Share</span>
            <hr class="star-light">
            <span class="skills">자료를 등록해보세요! 어디서나 볼 수 있습니다!</span>
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- Portfolio Grid Section -->
  <div id="java">
    <section id="slidelist">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2>java</h2>
            <hr class="star-primary">
          </div>
        </div>
        <div id="mainRow"></div>
      </div>
    </section>
  </div>
  <!-- About Section -->
  <section class="success" id="about">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2>About</h2>
          <hr class="star-light">
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12 text-center">
          <p>개발정보 기입</p>
          <p>java87 강효준, 김한샘, 이재현, 이효섭</p>
        </div>
      </div>
    </div>
  </section>
  <!-- Footer -->
  <footer class="text-center">
    <div class="footer-above">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h3>Contact Us</h3>
            <ul class="list-inline">
              <li><a href="" class="btn-social btn-outline"><i
                  class="fa fa-fw fa-facebook"></i></a></li>
              <li><a href="" class="btn-social btn-outline"><i
                  class="fa fa-fw fa-google-plus"></i></a></li>
              <li><a href="" class="btn-social btn-outline"><i
                  class="fa fa-fw fa-twitter"></i></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="footer-below">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">Copyright &copy; bitcamp java87 2016</div>
        </div>
      </div>
    </div>
  </footer>
  <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
  <div
    class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
    <a class="btn btn-primary" href="#page-top"> <i
      class="fa fa-chevron-up"></i>
    </a>
  </div>
<!-- jQuery -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <!-- Bootstrap Core JavaScript -->
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
  <!--jQuery.validation  -->
  <script src="vendor/jquery/jquery.validate.js"></script>
  <!-- Plugin JavaScript -->
  <script
    src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
  <!-- Contact Form JavaScript -->
  <script src="js/jqBootstrapValidation.js"></script>
  <script src="js/contact_me.js"></script>
  <!-- Theme JavaScript -->
  <script src="js/freelancer.min.js"></script>
  <script src="js/slide.js" id="slide"></script>
  <script src="js/modal.js" id="modalView"></script>  
  <script src="js/fileUploadButton.js" id="input_file"></script>
  <script src="js/submit.js"></script>
  <script src="js/userValidationCheck.js"></script>
</body>
</html>