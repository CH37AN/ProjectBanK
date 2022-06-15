<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="/js/employee_validate.js"></script>
<script src="/js/jquery.validate.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<div class="content-wrapper">
<%@include file="HeaderPageTier3.jsp" %>
</div>
	<div class="container mt-3 p-3">
		<div class="col-md-12" align="center">
			<div class="panel panel-primary">
	  			 <div class="panel-body">
					<form class="mt-5 p-3 shadow-lg p-3 mb-5 rounded w-75" id="EmployeeInsert" action="emp_insert" method="post">
						<h3 class="panel-title p-2">Employee Registration</h3>
						<fieldset>
			  			<div><p>${message}</p></div>
			  				<div class="form-group">
						      <label for="select" class="form-label">Employee Type</label>
						      <div class="col-lg-5">
						        <select class="form-control" name="designation" id="designation">
						          <option value="">Select Option</option>
						          <option value="Tier1">Employee</option>
						          <!-- <option value="Tier2">Tier 2</option> -->
						        </select>
						       </div>
						     </div>
			  				<div class="form-group mb-3 px-3">
						      <label for="firstname" class="form-label">First Name</label>
						      <div class="col-lg-5">
						        <input type="text" class="form-control" id="firstname" name="firstname" placeholder="First Name">
						      </div>
						    </div>
						    <div class="form-group mb-3 px-3">
						      <label for="middlename" class="form-label">Middle Name</label>
						      <div class="col-lg-5">
						        <input type="text" class="form-control" id="middlename" name="middlename" placeholder="Middle Name">
						      </div>
						    </div>
						    <div class="form-group mb-3 px-3">
						      <label for="lastname" class="form-label">Last Name</label>
						      <div class="col-lg-5">
						        <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last Name">
						      </div>
						    </div>
			  				<div class="form-group mb-3 px-3">
						      <label for="username" class="form-label">Desired UserName</label>
						      <div class="col-lg-5">
						        <input type="text" class="form-control" name="username" id="username" placeholder="Username">
						      </div>
						    </div>
						    <div class="form-group mb-3 px-3">
						      <label for="email" class="form-label">Email</label>
						      <div class="col-lg-5">
						        <input type="email" class="form-control" name="email" id="email" placeholder="Email">
						      </div>
						    </div>
						    <div class="form-group mb-3 px-3">
						      <label for="phone" class="form-label">Phone Number</label>
						      <div class="col-lg-5">
						        <input type="text" class="form-control" name="phone" id="phone" placeholder="Phone">
						      </div>
						    </div>
						    <div class="form-group mb-3 px-3">
						      <label for="date_of_birth" class="form-label">DOB</label>
						      <div class="col-lg-5">
						        <input type="date" class="form-control" name="date_of_birth" id="date_of_birth" placeholder="Date of Birth">
						      </div>
						    </div>
						        <br>
						     <div class="form-group mb-3 px-3">
						      <div class="col-lg-7 col-lg-offset-2">
						      	<button type="reset" class="btn btn-success" style="background-color:rgb(65, 84, 241); border:none;">Reset</button>
						        <button id="register_internal" class="btn btn-success" name="action" value="register_internal" style="background-color:rgb(65, 84, 241); border:none;">Submit</button>
						        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
						      </div>
						    </div>
						    <div>
						    <p style="color: red;"><% String message = (String)request.getAttribute("alertMsg");%></p>
						    </div>      
			  			</fieldset>
		  			</form>
	 			 </div>
			</div>
			
				
			</div>
		
		</div> <!-- .content-wrapper -->
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
</body>
</html>