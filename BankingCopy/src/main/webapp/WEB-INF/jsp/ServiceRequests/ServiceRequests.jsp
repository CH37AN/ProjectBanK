<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Requests</title>
<style>
	.box:hover{
      		/* height:400px; */
      		background-color:rgb(237, 239, 244);
      		padding: 10px 10px;
      		margin:8px 8px;
      	}
</style>
</head>
<body>
	<%@include file="../HeaderPage.jsp"%>
	 
	 
	  <!-- ======= Values Section ======= -->
        <section id="values" class="values">
    
          <div class="container mt-5" data-aos="fade-up">
    
            <header class="section-header mt-5 p-4">
             <!--  <h2>Why you should choose our bank?</h2> -->
              <p>Our Services</p>
            </header>
    
            <div class="row align-center">
              <div class="col-lg-6">
                <div class="p-4 box shadow-lg p-3 mb-5" >
                 <!--  <img src="/img/values-1.png" class="img-fluid" alt=""> -->
                  <h2><b>Schedule Appointment Online</b></h2>
                  <h5>You can book your appointment with us at your convenience.</h5>
                  <button class="customButton btn btn-success"
					onclick="window.location.href = '/generateAppointmentOtp'" style="background-color:rgb(65, 84, 241); border:none;">Schedule
					Appointment</button>
                </div>
              </div>
    
              <div class="col-lg-6 ">
                <div class="p-4 box shadow-lg p-3 mb-5">
                 <!--  <img src="/img/values-2.png" class="img-fluid" alt=""> -->
                  <h2><b>Open New Account</b></h2>
                  <h5>You can open your account at your convenience by adding your details.</h5>
                  <button class="customButton btn btn-success " style="background-color:rgb(65, 84, 241); border:none;"
						onclick="window.location.href = '/generateAccountOtp'">Open New
						Account</button>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- End Values Section -->
	 
	<!-- <div style="display: flex; flex-direction: column; margin: auto">
		<button class="customButton"
			onclick="window.location.href = '/generateAppointmentOtp'">Schedule
			Appointment</button>
		<button class="customButton"
			onclick="window.location.href = '/OrderCCheck'">Order
			Cashier's Check</button>
		<button class="customButton"
			onclick="window.location.href = '/generateAccountOtp'">Open New
			Account</button>
		<button class="customButton"
			onclick="window.location.href = '/PrimeAccount'">Set Primary
			Account</button>
	</div> -->
<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>


<main id="main">
    
	<!-- ======= Values Section ======= -->
	<section id="values" class="values">

	  <div class="container" data-aos="fade-up">

		<header class="section-header">
		  <h2>Why you should choose our bank?</h2>
		  <p>Our Features</p>
		</header>

		<div class="row">

		  <div class="col-lg-4">
			<div class="box" data-aos="fade-up" data-aos-delay="200">
			  <img src="/img/values-1.png" class="img-fluid" alt="">
			  <h3>Security</h3>
			  <p>We care for our customers that's why we offer OTP authorisation and multiple levels of verification of your transation.</p>
			</div>
		  </div>

		  <div class="col-lg-4 mt-4 mt-lg-0">
			<div class="box" data-aos="fade-up" data-aos-delay="400">
			  <img src="/img/values-2.png" class="img-fluid" alt="">
			  <h3>Secure Data</h3>
			  <p>We care for your privacy that's why we save your data in encrypted format.</p>
			</div>
		  </div>

		  <div class="col-lg-4 mt-4 mt-lg-0">
			<div class="box" data-aos="fade-up" data-aos-delay="600">
			  <img src="/img/values-3.png" class="img-fluid" alt="">
			  <h3>Book your Appointment online!</h3>
			  <p>You can book your appointment with us at your convenience.</p>
			</div>
		  </div>

		</div>

	  </div>

	</section><!-- End Values Section -->