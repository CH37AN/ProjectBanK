<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="js/employee_validate.js"></script>
	<script src="/js/jquery.validate.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	<style>
			form{
				background-color:rgb(242, 245, 252);
			}
	</style>

	<div class="content-wrapper">
	<c:choose>
		<c:when test="${role eq 'Individual'}"><%@include file="HeaderPage.jsp" %></c:when>
		<c:when test="${role eq 'Admin'}"><%@include file="HeaderPageTier3.jsp" %></c:when>
		<c:when test="${role eq 'Tier1'}"><%@include file="HeaderPageTier1.jsp" %></c:when>
		<c:when test="${role eq 'Tier2'}"><%@include file="HeaderPageTier2.jsp" %></c:when>
		<c:otherwise><%@include file="HeaderPageMerchant.jsp" %></c:otherwise>
	</c:choose>
		<div class="content-container p-5" id="page-content" align="center">
			<div class="panel panel-primary">
 				 <p>${message }</p>
 				 
 				 <div class="row">
 				 	<div class="col-md-6">
 				 		<div class="changepwd-image mt-5">
 				 			<img src="/img/changepwd.png" height="400px">
 				 		</div>
 				 	</div>
 				 	
 				 	<div class="col-md-6">
 				 		 <div class="panel-body">
							<form class="mt-5 p-3 shadow-lg p-3 mb-5 rounded w-75" id="ChangePassword" action="/changepassword" method="post">
				
								<h3 class="panel-title p-2">Change Password</h3>
								<!-- form body -->	
								<div class="form-group mb-3 px-3">
								    <label for="email" class="form-label">UserName</label>
									<input type="text" class="form-control" name="username" id="username" placeholder="Username" required>
								</div>
								  			
							    <div class="form-group mb-3 px-3">
									<label for="oldpassword" class="form-label">Old Password</label>
								    <input type="password" class="form-control" name="oldpassword" id="oldpassword" placeholder="Old Password" required>
								</div>
								
								<div class="form-group mb-3 px-3">
									<label for="newpassword" class="form-label">Desired Password</label>
									<input type="password" class="form-control" name="newpassword" id="newpassword" placeholder="New Password" required>
							    </div>
										    
								<div class="form-group mb-3 px-3">
									<label for="confirmpassword" class="form-label">Confirm Password</label>
									<input type="password" class="form-control" name="confirmpassword" id="confirmpassword" placeholder="Confirm Password" required>
								</div>
							  				 
							  	<div class="form-group mb-3 px-3">
									<div class="col-lg-7 ">
										  <button type="reset" class="btn btn-success " style="background-color:rgb(65, 84, 241); border:none;">
										  	Reset
										  </button>
										  &nbsp;&nbsp;
										  <button id="change_password" name="action" value="change_password" class="btn btn-success " style="background-color:rgb(65, 84, 241); border:none;">
										  	Submit
										  </button>
										  <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
									</div>
								</div>           
					  			<!-- form body end -->	
				  			</form>
	 			 </div>
 				 	</div>
 				 </div>
 				 
	  			
			</div>
			
				
			</div>
		
		</div> 
		 <!-- end content-wrapper -->