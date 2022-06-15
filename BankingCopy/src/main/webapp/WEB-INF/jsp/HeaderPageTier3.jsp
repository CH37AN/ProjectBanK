<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
	  
		<title>Bank</title>
		<meta content="" name="description">
		<meta content="" name="keywords">
	  
		<!-- Favicons -->
		<link href="/img/logo.png" rel="icon">
		<link href="/img/logo.png" rel="apple-touch-icon">
	  
		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	  
		<!-- Vendor CSS Files -->
		<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
		<!-- <link href="/vendor/aos/aos.css" rel="stylesheet">
		<link href="/vendor/remixicon/remixicon.css" rel="stylesheet"> -->
		<!-- <link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
		<link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet"> -->
		<style>
			body {
				background-image:url('/img/hero-bg.png') ;
				background-size: cover;
			  
				  background-repeat:no-repeat;
				 background-position:center;
			  }
		</style>
  
		<!-- Template Main CSS File -->
		<link href="/css/style.css" rel="stylesheet">
		  
	</head>
	<body>
		<div class="content-container">
			<div class="banner-container">
				<header role="banner">
					<header id="header" class="header fixed-top">
						<div class="container-fluid container-xl d-flex align-items-center justify-content-between">
					
						  <a class="logo d-flex align-items-center">
							<img src="/img/logo.png" alt="">
							<span>Bank</span>
						  </a>
					
						  <nav id="navbar" class="navbar">
							<ul>
							  <li><a class="nav-link scrollto active" href="/AdminHome">Home</a></li>
							  <li class="dropdown"><a href="#"><span>Employee Management</span> <i class="bi bi-chevron-down"></i></a>
								<ul>
								  <li><a href="/EmployeeRegister">Add Employee</a></li>
								  <li><a href="/EmployeeDelete">Delete Employee</a></li>
								  <li><a href="/EmployeeUpdate">Update Employee Info</a></li>
								  <li><a href="/Search">Search Employee</a></li>
								</ul>
							  </li>
							  <li class="dropdown"><a href="#"><span>Profile</span> <i class="bi bi-chevron-down"></i></a>
								<ul>
								  <li><a data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo" href="/ChangePassword">Change Password</a></li> 
								  <li><a href="/logout">Log Out</a></li>
								</ul>
							</li>
							<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/> 
							  
							</ul>
							<i class="bi bi-list mobile-nav-toggle"></i>
						  </nav><!-- .navbar -->
					
						</div>
					  </header><!-- End Header -->
			    
				</header>
		    </div>
	    </div>
		
		     <!-- Vendor JS Files -->
     
      <script src="/vendor/purecounter/purecounter.js"></script>
      
    
      <!-- Template Main JS File -->
      <script src="/js/main.js"></script>
    
	</body>
</html>