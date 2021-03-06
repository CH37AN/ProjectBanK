
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
<body>
<div class="content-wrapper">
		<c:choose>
		<c:when test="${role eq 'Tier1'}"><%@include file="HeaderPageTier1.jsp" %></c:when>
		<c:otherwise><%@include file="HeaderPageTier2.jsp" %></c:otherwise>
	</c:choose>	
</div>
<div class="col-md-12 mt-5 p-5" id="page-content" align="center">
			<div class="panel panel-primary">
  				<div class="panel-heading">
    				<h3 class="panel-title">Search for an Account</h3>
 				 </div>
	  			 <div class="panel-body">
					<form class="form-horizontal" id="SearchAccount" action="/searchaccount" method="post">
			  			<fieldset>
			  			<div class="form-group p-4">
						      <label for="accountnumber" class="form-label">Account Number</label>
						      <div class="col-lg-5">
						        <input type="text" class="form-control" id="accountnumber" name="accountnumber" placeholder="Account Number" required>
						      </div>
						    </div>
						    <div class="form-group">
						      <div class="col-lg-7 col-lg-offset-2">
						      	<button type="reset" class="btn btn-default"  style="background-color:rgb(65, 84, 241); border:none; color:white;">Reset</button>
									&nbsp; &nbsp;
								  <button id="search_account"  class="btn btn-default" name="action" value="search_account"  style="background-color:rgb(65, 84, 241); border:none; color:white;">Search</button>
						        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
						         
						      </div>
						      <div class="p-3">
						      <p style="color: red;">${message}</p>
						      </div>
						    </div>
			  			</fieldset>
			  			</form>
			  			<c:forEach var="entry" items="${accountinfo}">
					<div class="account-detail cards">
					<div>
						<div class="account-header">
							<h1>Personal Details</h1>
						</div>
						<div class="account-body">
							<div>
									<label>Account Number:</label>
							 		<label>${entry.accountNumber}</label>
							</div>
							<div>		
									<label>Creation Date: </label>
									<label> ${entry.creationDate}</label>
							</div>
							<div>
								<label>Balance: </label>
								<label>${entry.balance}</label>
							</div>
							
							<div>
								<label>Approval Status: </label>
								<label><c:choose>
		<c:when test="${entry.approvalStatus}">Approved</c:when>
		<c:otherwise>
		Declined/Pending/Deleted
		</c:otherwise>
	</c:choose>
	</label>
							</div>
							
							<div>
							</div>
							
							<div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
						</div>
			  			</div>
			  			</div>
			  			
</body>
</html>