<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="js/cust_validate.js"></script>
<script src="js/jquery.validate.js"></script>
<!-- <script>
		
		$(function(){
		    var dtToday = new Date();
		    
		    var month = dtToday.getMonth() + 1;
		    var day = dtToday.getDate();
		    var year = dtToday.getFullYear();
		    if(month < 10)
		        month = '0' + month.toString();
		    if(day < 10)
		        day = '0' + day.toString();
		    
		    var maxDate = year + 1 + '-' + month + '-' + day;
		    var minDate = year + '-' + month + '-' + day;
		alert(minDate);
		    alert(maxDate);
		    $('#schedule_date').attr('max', maxDate);
		    $('#schedule_date').attr('min', minDate);
		});
			</script> -->
<body>
<div class="content-wrapper">
<c:choose>
		<c:when test="${role eq 'Individual'}"><%@include file="HeaderPage.jsp" %></c:when>
		<c:otherwise><%@include file="HeaderPageMerchant.jsp" %></c:otherwise>
	</c:choose>
		
 		<div class="panel-body" align="center">
 		
			<div class="panel panel-primary mt-2 p-5">
  				
    				<h3 class="panel-title">Schedule An Appointment</h3>
 				
 			</div>
 		
			<form class="form-horizontal mt-5 p-2 w-50 shadow-lg p-3 mb-5 rounded" id="ScheduleAppointment" action="/appointment" method="post">
			  	<fieldset>
			  				<div class="form-group">
						      <label for="select" class="form-label">Reason for the Appointment</label>
						      
						        <select class="form-control" name="appointment" id="appointment">
						          <option value="">Select Option</option>
						          <option value="Make Personal Info changes">Make Personal Info changes</option>
						          <option value="Open/Close an Account">Open/Close an Account</option>
						          <option value="Deposit/Withdraw Money">Deposit/Withdraw Money</option>
						          <option value="Cashiers Cheque">Cashiers Cheque</option>
						          <option value="Others">Others</option>
						        </select> 
						     </div>
						     
						     <div class="form-group p-2">
						      	<label for="schedule_date" class="form-label">Schedule Date</label>
						        <input type="date" class="form-control" name="schedule_date" id="schedule_date" placeholder="Schedule Date"> 
						    </div>
						    
						    <div class="form-group p-2">
						      <div class="col-lg-7">
						      	<button type="reset" class="btn btn-default" style="background-color:rgb(65, 84, 241); border:none; color:white;">Reset</button>
						      	&nbsp; &nbsp;
						        <button id="schedule_appointment" class="btn btn-default" name="action" value="schedule_appointment" style="background-color:rgb(65, 84, 241); border:none; color:white;">Book An Appointment</button>
						        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>				         
						      </div>
						    </div>
						    <div><p style="color:red;">${message}</p></div>
						    
						     </fieldset>
						     </form>
						     </div>
</div>
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
    
     