<%@page import="com.bank.Entity.users.customers.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href="/css/loginCSS.css" rel="stylesheet">
	
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
	<title>Login Page</title>
	
	<style>
			body {
			  background-image:url('/img/1.png') ;
			  
			  background-position:right center;
			  background-size:contain;
			  background-repeat:no-repeat
			}
			form{
				width:33%;
				background-color:white;
			}
			form:hover{
				background-color: rgb(227, 230, 239);
			}
			.form-control{
				 border-radius: 25px;
   				 border: 2px solid #609;
			}
	           #btn-grad {background-image: linear-gradient(to right, #7474BF 0%, #348AC7  51%, #7474BF  100%)}
         #btn-grad {
			width:35%;
    		border:none;
           
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;            
            box-shadow: 0 0 20px #eee;
            border-radius: 10px;
            display: block;
          }

          #btn-grad:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
			box-shadow: 0 5px 15px rgba(145, 92, 182, .4);
          }
	         
	</style>
</head>
<body>
<%
	if(session.getAttribute("CustomerObject") != null || session.getAttribute("EmployeeObject") != null)
	{
		response.sendRedirect("/logout");
	}
%>

<div class="container mt-4 p-4 ">
	
	<form id="LoginPage" action="/redirectuser" method="post" class="mt-5 p-3 shadow-lg p-3 mb-5 rounded">
		<h2 class="text-center mb-2 p-2">Login Here</h2>
		
		<div class="form-group text-center">
			<p>${message}</p>
		</div>
		
		
		<div class="form-group mb-3 px-3">
		  <label for="uname" class="form-label text-lg">Username</label>
		  <input type="text" class="form-control"  placeholder="Enter Username" id="userName" name="uname"  
				 maxlength="30" minlength="2" required>
		</div>
		<div class="form-group mb-3 px-3">
		  <label for="psw" class="form-label">Password</label>
		  <input class="form-control" type="password" placeholder="Enter Password" id="password" name="psw" 
				 maxlength="50" minlength="2" required>
		</div>
		<div class="form-group mb-3">
			<button type="submit" class="btn btn-success rounded-pill m-auto" id="btn-grad">Login</button>
								
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="form-group m-4 text-center text-lg">
				<span><a href="/" class="p-3">Go back</a></span>
					<span><a href="/NewCustomerRegister" class="">New Customer?</a></span>
					<br>
					<span><a href="/ForgotPassword" class="">Forget password?</a></span>
			</div>
		</div>
	</form>
</div>
</body>
</html> 