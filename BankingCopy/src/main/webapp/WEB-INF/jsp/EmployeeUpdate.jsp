<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="/js/employee_validate.js"></script>
<script src="/js/jquery.validate.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

	<div class="content-wrapper">
		<%@include file="HeaderPageTier3.jsp" %>
		<div class="col-md-12" id="page-content" align="center">
			<div class="container panel panel-primary mt-3 p-3">
  				
	  			 <div class="panel-body">
	  			 <form class="mt-5 p-3 shadow-lg p-3 mb-5 rounded w-75" id="EmployeeUpdateSearch" action="emp_update_search" method="post">
					<div class="panel-heading">
						<h3 class="panel-title">Employee Update</h3>
					  </div>
					<div class="form-group">
						      <label for="username_search" class="col-lg-2 control-label">User Name</label>
						      <div class="col-lg-5">
						        <input type="text" class="form-control" id="username_search" name="username_search" placeholder="User Name" required>
								<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
						      </div>
						    </div>
						    <div class="form-group mt-2 p-3">
						      <div class="col-lg-7 col-lg-offset-2">
						      	<button type="reset" class="btn btn-success" style="background-color:rgb(65, 84, 241); border:none;">Reset</button>
						        <button id="emp_update_search" name="action" value="emp_update_search" class="btn btn-success" style="background-color:rgb(65, 84, 241); border:none;">Search</button>
						        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
						      </div>
						      <div>
						      <p class="p-2" style="color: red;">${message}</p>
						      </div>
						    </div>
	  			 </form>
					<form class="mt-5 p-3 shadow-lg p-3 mb-5 rounded w-75" id="EmployeeUpdate" action="emp_update" method="post">
			  			<fieldset>
			  				<div class="form-group mb-3 px-3">
						      <label for="empusername" class="form-label">Employee Username</label>
						      <div class="col-lg-5">
						        <input type="text" class="form-control" name="empusername" id="empusername" placeholder="Username" value=<%=request.getAttribute("empusername") %>>
						      </div>
						    </div>
			  				<div class="form-group mb-3 px-3">
						      <label for="email" class="col-lg-2 control-label">Email</label>
						      <div class="col-lg-5">
						        <input type="email" class="form-control" name="email" id="email" placeholder="Email" value=<%=request.getAttribute("Email") %>>
						      </div>
						    </div>
						    <div class="form-group mb-3 px-3">
						      <label for="firstname" class="col-lg-2 control-label">First Name</label>
						      <div class="col-lg-5">
						        <input type="text" class="form-control" id="firstname" name="firstname" placeholder="First Name" value=<%=request.getAttribute("FirstName") %>>
						      </div>
						    </div>
						    <div class="form-group mb-3 px-3">
						      <label for="middlename" class="col-lg-2 control-label">Middle Name</label>
						      <div class="col-lg-5">
						        <input type="text" class="form-control" id="middlename" name="middlename" placeholder="Middle Name" value=<%=request.getAttribute("MiddleName") %>>
						      </div>
						    </div>
						    <div class="form-group mb-3 px-3">
						      <label for="lastname" class="col-lg-2 control-label">Last Name</label>
						      <div class="col-lg-5">
						        <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last Name" value=<%=request.getAttribute("LastName") %>>
						      </div>
						    </div>
						    <div class="form-group mb-3 px-3">
						      <label for="phone" class="col-lg-2 control-label">Phone Number</label>
						      <div class="col-lg-5">
						        <input type="text" class="form-control" name="phone" id="phone" placeholder="Phone" value=<%=request.getAttribute("Phone") %>>
						      </div>
						    </div>
						    <div class="form-group mb-3 px-3">
						      <label for="date_of_birth" class="col-lg-2 control-label">DOB</label>
						      <div class="col-lg-5">
						        <input type="date" class="form-control" name="date_of_birth" id="date_of_birth" placeholder="Date of Birth" value=<%=request.getAttribute("DOB") %>>
						      </div>
						    </div>
						        <br>
						     <div class="form-group mb-3 px-3">
						      <div class="col-lg-7 col-lg-offset-2">
						      	<button type="reset" class="btn btn-success" style="background-color:rgb(65, 84, 241); border:none;">Reset</button>
						        <button id="update_internal" name="action" value="update_internal" class="btn btn-success" style="background-color:rgb(65, 84, 241); border:none;">Submit</button>
						        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
						      </div>
						    </div>           
			  			</fieldset>
		  			</form>
	 			 </div>
			</div>
			
				
			</div>
		
		</div> <!-- .content-wrapper -->
	
	<script type="text/javascript">
	$(document).ready(function() {
		sideNavigationSettings();
	});
	</script>
</body>
</html>
