<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
        <link rel="stylesheet" href="/css/cstyles.css"/>     
	<!-- Favicons -->
	<link href="/img/logo.png" rel="icon">
	<link href="/img/logo.png" rel="apple-touch-icon">
  
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  
	<!-- Vendor CSS Files -->
	<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
 
	<!-- Template Main CSS File -->
	<link href="/css/style.css" rel="stylesheet">
	
	 <style>
		body {
			background-image:url('/img/hero-bg.png') ;
			background-size: cover;
		  
			  background-repeat:no-repeat;
			 background-position:center;
		  }
	</style>
  <body>
	  
  <input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}"/>
  
	 <!--  ======= Header ======= --> 
	<header id="header" class="header fixed-top">
	  <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
  
		<a href="index.html" class="logo d-flex align-items-center">
		  <img src="/img/logo.png" alt="">
		  <span>Bank Of Spain</span>
		</a>
  
		<nav id="navbar" class="navbar">
		  <ul>
			<li><a class="nav-link scrollto active" href="/accinfo">Home</a></li>
		  
			<li><a class="nav-link scrollto" href="/ServiceRequest">Services</a></li>
		 
			 <li class="dropdown"><a href="#"><span>Profile</span> <i class="bi bi-chevron-down"></i></a>
			  <ul>
				<li><a href="/ChangePassword">Change Password</a></li>
				<li><a href="/login">Logout</a></a>
				</li>
			  </ul>
			</li> 
			
		  </ul>
		  <i class="bi bi-list mobile-nav-toggle"></i>
		</nav>
	  </div>
	</header>
	<!-- End Header -->


		<!-- <div class="content-container">
			<div class="banner-container">
				<header role="banner">
			        <nav role="navigation">
			            <ul class="top-bar">
			            	<input type="hidden"  name="${_csrf.parameterName}"  value="${_csrf.token}"/>
			            	<li class="cta"><a class="OutLineButton" href="/accinfo">Home</a></li>
			                <li class="cta"><a class="OutLineButton" href="/ChangePassword">Change Password</a></li>
			                <li class="cta"><a class="OutLineButton" href="/ServiceRequest">Service Requests</a></li>
			                <li class="cta"><a class="OutLineButton" href="/login">Log Out</a></li>
			            </ul>
			        </nav>
				</header>
		    </div>
	    </div> -->
	</body>
</html>