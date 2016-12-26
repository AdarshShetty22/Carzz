<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/bootstrap/css/custom.css" type="text/css" rel="stylesheet"/>
<title>Insert title here</title>
<style rel="stylesheet">
	.mainBody{
			background-color:#efeaef;
	}
	.bootstrapContainer{
		padding-top:21px;
	}
	.topNavBar{
		background-color:#eff1f1;border-bottom:3px solid  #c0e7e1;
	}
	.mainLogo{
	margin-left:80px;
	}
	.menuLogoNew{
	margin-left:60px;margin-right:40px;margin-top:7px;
	}
	.menuLogoPopular{
	margin-left:60px;margin-top:7px;
	}
	.newBadge{
	background-color:red;
	}
	.popularBadge{
		background-color:green;
	}
	.menuRegisterButton{
	margin-top:15px;
	}
	.menuLoginButton{
	margin-top:15px;
	margin-right:10px;
	}
	.middleNavBar{
	margin-top:21px;height:50px;background-color:white;
	}
	.middleNavBarButton1{
	margin-left:200px;
	}
	.carouselCaptionButtonGetStarted{
	margin-bottom:50px;
	}
	.searchFade{
	 filter: alpha(opacity=50);
  opacity: .5;
	}
</style>
</head>
<body class="mainBody" id="mainBody">
<div class="container bootstrapContainer">
		<!-- Main Nav bar -->
		<div class="mainNavbar" id="mainNavbar">
		<!-- Navigation bar -->
			<nav class="navbar navbar-default  navbar-fixed-top topNavBar">
			<!-- navbar header -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<!-- Nav bar header end -->
				<!-- Nav bar collapse -->
				<div class="navbar-collapse collapse " id="navbar-collapse">
					<ul class="nav navbar-nav ">
					<!-- this is the Left logo -->
						<li><img src="/images/Logomakr.png"/></li>
						<!-- Search box for nav -->
						<li class="textbox">
							<form>
								<div class="form-group has-feedback">
								<input class="form-control" id="searchButton" type="text" placeholder="Search.."></input>
								</div>
								<div class="dropdown">
									<ul class="dropdown-menu" id="searchItems" style="width:500px;height:300px;background-color:gray;">
										<li><a href="#indiaTab" data-toggle="tab">Audi</a></li>
										<li><a href="#australiaTab" data-toggle="tab">BMW</a></li>
									</ul>
							</div>
								<span class="glyphicon glyphicon-search form-control-feedback searchIcon"></span>
							</form>
						</li>
						<!--Main Logo for Web-->
						<li class="mainLogo"><img src="/images/carzz.png"/></li>
						<!-- Car menu for new -->
						<li class="menuLogoNew">
								<a href="#"><img src="/images/carmenu.png"/><span class="badge newBadge">New</span></a>
								<!-- Car menu for popular -->
						<li class="menuLogoPopular">
								<a href="#"><img src="/images/carmenu.png"/><span class="badge popularBadge">Popular</span></a>
						</li>
					</ul>
					<!-- Registrion Button -->
					<button class="btn btn-default btn-md pull-right menuRegisterButton" data-target="#registerModal" data-toggle="modal"><img src="/images/new-account.png"/><font color="orange"> Register</font></button>
					<!-- Login Button -->
					<button class="btn btn-default btn-md pull-right menuLoginButton" data-target="#loginModal" data-toggle="modal" id="loginButton"><img src="/images/account-login.png"/><font color="orange"> Login</font></button>
			</div>
			<!-- Nov bar collpase end -->
	</nav>
	<!-- Navigation bar End -->
	</div>
	<!-- Main navbar end -->
	
	<!-- For login modal -->
	<div class="modal fade" data-keyboard="false" data-backdrop="static" id="loginModal">
			<div class="modal-dialog modal-md">
					<div class="modal-content">
							<div class="modal-header">
								<button class="close" data-dismiss="modal" id="closeIcon"><font color="red">&times;</font></button>
								<h4 class="modal-title">Login</h4>
							</div>
							<div class="modal-body">
							<form action="/views/authentication" method="post">
								<div class="form-group">
									<label >Email:</label>
									<input class="form-control" placeholder="Enter email" type="email" name="j_username"/>
								</div>
								<div class="form-group">
									<label>Password</label>
									<input class="form-control" placeholder="Enter password" type="password" name="j_password"/>
								</div>
								<div class="form-group">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								</div>
								
								<div class="modal-footer">
									<button class="btn btn-primary" id="lButton">Loginn</button>
									<button class="btn btn-primary" id="closeButton" data-dismiss="modal">Close</button>
									<p>Not a <font color="blue">USER</font> Register a free account? <a href="#registerModal" id="registerAnchor">here</a>
								</div>
							</form>			
							<html:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
     								 <font color="red">
      									<h5 id="spring">
      											<html:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
        											Username or Password Incorrect
      									</h5>
     								 </font>
     								
								</html:if>
							
							<div id="loggedOut"><font color="green"><h5>${loggedOutMessage}</h5></font></div>
							
							</div>
						</div>
					</div>
				</div>
		<!-- For login modal end -->
		<!-- For registration model -->
		<div class="modal fade" data-keyboard="false" data-backdrop="static" id="registerModal">
				<div class="modal-dialog modal-md">
						<div class="modal-content">
							<div class="modal-header">
								<button class="close" data-dismiss="modal"><font color="red">&times;</font></button>
								<h4 class="modal-title">Register</h4>
							</div>
							<div class="modal-body">
								<form action="/app/reg">
										<div class="form-group">
										<label>First Name:</label>
										<input class="form-control text-capitalize" placeholder="Enter username" type="text"/>
									</div>
									<div class="form-group">
										<label>Last Name:</label>
										<input class="form-control text-capitalize" placeholder="Enter username" type="text"/>
									</div>
									<div class="form-group">
										<label >Email:</label>
										<input class="form-control" placeholder="Enter email" type="email"/>
									</div>
									<div class="form-group">
										<label >Password:</label>
										<input class="form-control" placeholder="Enter password" type="password"/>
									</div>
									<div class="modal-footer">
										<button class="btn btn-primary">Submit</button>
										<button class="btn btn-primary" data-dismiss="modal">Close</button>
										<p>already a <font color="blue">USER</font> login? <a href="#loginModal" id="loginAnchor">here</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- Registration modal end -->
				
	</div>
	<!--Bootstrap container end -->
	
	<!-- Middle Nav Bar start -->
	<div id="middleBody">
		<div class="row middleNavBar">
	<ul class="nav nav-pills nav-justified">
			<li><button class="btn btn-info middleNavBarButton1">Home <span class="glyphicon glyphicon-home"></span></button></li>
			<li><button class="btn btn-success">Contact <span class="glyphicon glyphicon-earphone"></span></button></li>
			<li><button class="btn btn-warning">About <span class="glyphicon glyphicon-info-sign"></span></button></li>
		</ul>
	</div>
	<!-- Middle Nav bar end -->
	<!-- corosel or slider start -->
	<div class="row">
		<div class="col-md-10 col-lg-12 col-xs-12">
			<div id="corosel-example" class="carousel slide" data-ride="corousel">
				<ol class="carousel-indicators">
					<li data-target="#corosel-example" data-slide-to="0" class="active"></li>
					<li data-target="#corosel-example" data-slide-to="1"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="/images/audi.png" title="Audi"><font color="red">Audi</font></img>
					</div>
					<div class="item">
						<img src="/images/audi2.png" title="Audi V8X">Audi V8X</img>
					</div>
					<div class="item">
						<img src="/images/audi3.png" title="Audi V8X">Audi V8X</img>
					</div>
					<div class="item">
						<img src="/images/bmw.png" title="Audi V8X">Audi V8X</img>
					</div>
					<div class="item">
						<img src="/images/bmw2.png" title="Audi V8X">Audi V8X</img>
					</div>
					<div class="item">
						<img src="/images/swift.png" title="Audi V8X">Audi V8X</img>
					</div>
					<div class="carousel-caption">
					<font color="orange"><h1>Register Now</h1></font><br/>
							<button class="btn btn-lg btn-success carouselCaptionButtonGetStarted">GET STARTED</button>
		
					
						</div>
					this is the overall text!!
				</div>
				<a class="left carousel-control" href="#corosel-example" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" area-hidden="true"></span>
				</a>
				<a class="right carousel-control" href="#corosel-example" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" area-hidden="true"></span>
				</a>
			</div>
		</div>
	</div>
	</div>
	<!-- Corosel or slider end -->
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/jquery.cookie.js"></script>  
<script type="text/javascript">


$(document).ready(function(){
	//not to display spring error message on the form when refreshed and user closed the form
	if($.cookie('closeClicked')=='yes'){
		$('#spring').text("");
	}
	
	//to show login model when error occured during login
	if($.cookie('showLoginModal')=='yes'){
			$('#loginModal').modal('show');
	}
	
	//when user clicks the loginButton of the Model
	$('#lButton').click(function(){
		//set the cookie to yes when user clicks the login button
		//so when spring security sends error i want to open the modal
		$.cookie('showLoginModal','yes');
		//when user clicks login button show the spring error message so set cookie 'closeCliked' to no
		$.cookie('closeClicked','no');
	});
	
	//when user clicks the closeButton of the Model
	$('#closeButton').click(function(){
		//set the cookie to 'closeClicked' to yes show that spring error message wont be displayed on refresh
		$.cookie('closeClicked','yes');
		//donot show the login model when close button of the login model is clicked
		$.cookie('showLoginModal','null');
		$('#spring').text("");
	});
	
	//when user clicks the close ICon
	$('#closeIcon').click(function(){
		//set the cookie to 'closeClicked' to yes show that spring error message wont be displayed on refresh
		$.cookie('closeClicked','yes');
		//donot show the login model when close button of the login model is clicked
		$.cookie('showLoginModal','null');
		$('#spring').text("");
	});
	
	//for going to Register from login
	$('#registerAnchor').click(function(){
		//hide the login model when 'register anchor' is cliked from login Modal
		$('#loginModal').modal('hide');
		//show the register model when 'register anchor' is cliked from login Modal
		$('#registerModal').modal('show');
	});
	
	//for going to login from register
	$('#loginAnchor').click(function(){
		//hide the register model when 'login anchor' is cliked from register Modal
		$('#registerModal').modal('hide');
		//show the login model when 'login anchor' is cliked from register Modal
		$('#loginModal').modal('show');
	});
	
	//for searchButton of the top nav bar
	$('#searchButton').keypress(function(){
			//to fade body when a key is typed on the search box
			$('#middleBody').addClass('searchFade');
			$('#searchItems').show();
	});
	//for searchButton of the top nav bar when out of focus
	$('#searchButton').blur(function(){
		$('#searchItems').hide();
		$('#middleBody').removeClass('searchFade');
	});
	
	
});
</script>
</body>
</html>