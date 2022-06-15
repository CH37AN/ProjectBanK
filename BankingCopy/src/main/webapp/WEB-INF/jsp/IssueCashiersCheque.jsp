<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
<body>
<div class="content-wrapper">
		<%@include file="HeaderPageTier1.jsp" %>
</div>
<div class="col-md-12 mt-5 p-4" id="page-content" align="center">
			<div class="panel panel-primary">
  				<div class="panel-heading p-3">
    				<h3 class="panel-title">Search For a Cheque</h3>
 				 </div>
	  			 <div class="panel-body">
					<form class="form-horizontal" id="SearchCheque" action="/searchcheque" method="post">
			  			<fieldset>
			  			<div class="form-group p-4 w-50">
						      <label for="chequeid" class="col-lg-2 control-label p-2">Cheque ID</label>
						      
						        <input type="text" class="form-control" id="chequeid" name="chequeid" placeholder="Cheque ID" required>
						     
						    </div>
						    <div class="form-group">
						      <div class="col-lg-7 col-lg-offset-2">
						      	<button type="reset" class="btn btn-default"  style="background-color:rgb(65, 84, 241); border:none; color:white;">Reset</button>
						        &nbsp; &nbsp;
								  <button id="searchcheque" class="btn btn-default"  style="background-color:rgb(65, 84, 241); border:none; color:white;" name="action" value="searchcheque">Issue Cheque</button>
						        <input type="hidden" class="btn btn-default"  style="background-color:rgb(65, 84, 241); border:none; color:white;"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
						      </div>
						      <div class="p-2">
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