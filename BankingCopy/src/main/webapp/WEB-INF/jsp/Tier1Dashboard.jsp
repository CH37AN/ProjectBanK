
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tier1 HomePage</title>
</head>
<body>
<%@include file="HeaderPageTier1.jsp" %>
	<form id="Tier1Dashboard" method="post" class="mt-5 p-5">
    	<table align="center">
    	<tr>
	           <td>
                 <h2>EMPLOYEE HOME</h2> 
                  
              </td>
            </tr>
            <tr>
            <td>${message}</td>
            </tr>
    	</table>
 <input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
 </form>

 <!-- ======= Values Section ======= -->
 <section id="values" class="values">
    
  <div class="container mt-5" data-aos="fade-up">

    <header class="section-header mt-5 p-4">
   
      <p>Our Services</p>
    </header>

    <div class="row align-center">
      
      <div class="col-lg-4">
        <div class="box shadow-lg h-100" >
     
          <h2 class="p-3"><b>Approve / Decline credit transaction </b></h2>
         
          <button class="btn btn-success"
   style="background-color:rgb(65, 84, 241); border:none; color:white;"><a style="color: white;" href="/checker">Click Here</a></button>
        </div>
      </div>

      <div class="col-lg-4">
        <div class="box shadow-lg h-100" >
        
          <h2 class="p-3"><b>Issue Cashier's Cheque </b></h2>
        
          <button class="btn btn-success"
   style="background-color:rgb(65, 84, 241); border:none; color:white;"><a style="color: white;" href="/IssueCheque">Click Here</a></button>
        </div>
      </div>

      <div class="col-lg-4">
        <div class="box shadow-lg h-100" >
        
          <h2 class="p-3"><b>Delete Customer Account </b></h2>
       
          <button class="btn btn-success"
   style="background-color:rgb(65, 84, 241); border:none; color:white;"><a style="color: white;" href="/DeleteAccount">Click Here</a></button>
        </div>
      </div>

    </div> 
    <br>
    <br>
    <div class="row align-center">
      
      <div class="col-lg-4">
        <div class="box shadow-lg h-100" >
     
          <h2 class="p-3"><b>Approve / Decline Saving transaction </b></h2>
         
          <button class="btn btn-success"
   style="background-color:rgb(65, 84, 241); border:none; color:white;"><a style="color: white;" href="/checker">Click Here</a></button>
        </div>
      </div>

      <div class="col-lg-4">
        <div class="box shadow-lg h-100" >
        
          <h2 class="p-3"><b>Search client Account info </b></h2>
        
          <button class="btn btn-success"
   style="background-color:rgb(65, 84, 241); border:none; color:white;"><a style="color: white;" href="/SearchAccount">Click Here</a></button>
        </div>
      </div>

      <div class="col-lg-4">
        <div class="box shadow-lg h-100" >
        
          <h2 class="p-3"><b>Approve customer account</b></h2>
       
          <button class="btn btn-success"
   style="background-color:rgb(65, 84, 241); border:none; color:white;"><a style="color: white;" href="/accountrequest">Click Here</a></button>
        </div>
      </div>

    </div> 
  </div>
</section>
<!-- End Values Section -->





</body>
</html>
