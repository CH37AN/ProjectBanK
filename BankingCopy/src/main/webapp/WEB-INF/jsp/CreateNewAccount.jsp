<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Account</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="/js/cust_validate.js"></script>
<script src="/js/jquery.validate.js"></script>
<script>
		
		$(function(){
		    var dtToday = new Date();
		    
		    var month = dtToday.getMonth() + 1;
		    var day = dtToday.getDate();
		    var year = dtToday.getFullYear();
		    if(month < 10)
		        month = '0' + month.toString();
		    if(day < 10) 
		        day = '0' + day.toString();
		    
		    var maxDate = year + '-' + month + '-' + day;
		    var minDate = year - 100 + '-' + month + '-' + day;
		    //alert(minDate);
		    $('#date_of_birth').attr('max', maxDate);
		    $('#date_of_birth').attr('min', minDate);
		});
			</script>
<div class="content-wrapper">
<c:choose>
		<c:when test="${role eq 'Individual'}"><%@include file="HeaderPage.jsp" %></c:when>
		<c:otherwise><%@include file="HeaderPageMerchant.jsp" %></c:otherwise>
	</c:choose>
	
 		<div class="panel-body mt-5 p-4" align="center">
					<form class="form-horizontal w-50 p-3 shadow-lg p-3 mb-5 rounded" id="OpenAccount" action="/openaccount" method="post">
			  			<div class="panel-heading">
    				<h3 class="panel-title">Open an Account</h3>
 				 </div>
			  			<fieldset>
			  			<p style="color:red;">${message }</p>
			  			
			  			<div class="row">
			  				<div class="col-md-6">
			  					<div class="form-group p-1">
						      		<label for="firstname" class="form-label">First Name</label>
						        	<input type="text" class="form-control" id="firstname" name="firstname" placeholder="First Name">
						    	</div>
						    </div>
						    
						    <div class="col-md-6">
						    	<div class="form-group p-1">
						     		 <label for="lastname" class="form-label">Last Name</label>			      
						      		 <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last Name">
						    	</div>
						    </div>			  				
			  			</div>
			  			
			  			<div class="row">
			  				<div class="col-md-6">
			  					<div class="form-group p-1">
						      		<label for="firstname" class="form-label">Email</label>
						      		<input type="email" class="form-control" id="email" name="email" placeholder="Email">
						    	</div>
						    </div>
						    
						    <div class="col-md-6">
						    	<div class="form-group p-1">
						     		  <label for="select" class="form-label">Type of Account</label>
								    	 <select class="form-control" name="account_type" id="account_type" required>
								          <option value="">Select Option</option>
								          <option value="Savings">Savings Account</option>
								          <option value="CreditCard">Credit Card</option>
								          <option value="Checking">Checking Account</option>
								        </select> 
						    	</div>
						    </div>			  				
			  			</div>
						     
						<div class="form-group p-1">
						      <label for="date_of_birth" class="form-label">DOB</label>
						        <input type="date" class="form-control" name="date_of_birth" id="date_of_birth" placeholder="Date of Birth">   
						</div>
						    
						    <div class="form-group p-1">
						      <label for="SecurityQuestion1" class="form-label">What is your childhood nickname?</label>
						      
						        <input type="text" class="form-control" name="secquestion1" id="secquestion1" placeholder="Security Question 1">
						     
						    </div>
						    
						    <div class="form-group p-1">
						      <label for="SecurityQuestion2" class="form-label">Who was your childhood hero?</label>
						      
						        <input type="text" class="form-control" name="secquestion2" id="secquestion2" placeholder="Security Question 2">
						    
						    </div>
						     
						     <div class="form-group p-2">
						      <div class="col-lg-7 col-lg-offset-2">
						      	<button type="reset" class="btn btn-default" style="background-color:rgb(65, 84, 241); border:none; color:white;">Reset</button>
						        &nbsp; 
						        <button id="openaccount" name="action" class="btn btn-default" value="open_account" style="background-color:rgb(65, 84, 241); border:none; color:white;">Submit</button>
						        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
						      </div>
						    </div>
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
    
        
    
      