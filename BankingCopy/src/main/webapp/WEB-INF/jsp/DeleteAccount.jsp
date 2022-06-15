<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
<body>
	<div class="content-wrapper">
		<%@include file="HeaderPageTier1.jsp"%>
	</div>
	<div class="col-md-12 w-50 m-auto" id="page-content">
		<div class="panel panel-primary">
			
			<div class="panel-body">
				<form class="mt-5 p-4 shadow-lg p-2 mb-5 rounded w-100"  align="center" id="DeleteAccount"
					action="/deleteaccount" method="post">
					<div class="panel-heading">
						<h3 class="panel-title">Delete an Account</h3>
					</div>
					<fieldset class="m-auto" align="center">
						<div class="form-group">
							<label for="accountnumber" class="form-label">Account
								Number</label>
							
								<input type="text" class="form-control m-2" id="accountnumber"
									name="accountnumber" placeholder="Account Number" required>
							
						</div>
						<br>
						
						<div class="form-group">
							
								<button class="btn btn-success" style="background-color:rgb(65, 84, 241); border:none;" type="reset" class="btn btn-default">Reset</button>
								&nbsp;&nbsp;
								<button class="btn btn-success" style="background-color:rgb(65, 84, 241); border:none;" id="delete_account" name="action" value="delete_account">Delete</button>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							
							<div>
								<p style="color: red;">${message}</p>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

</body>
</html>