
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Approve/Decline Account Request</title>
        <link rel="stylesheet" href="css/cstyles.css"/>   
	</head>
	<body>
		<%@include file="HeaderPageTier1.jsp" %>
		<div class="table-responsive p-3 mt-5">
		
			<table class="table table-hover p-5 mt-5 w-75" align="center">
				<thead>
					<tr>
						<th>Date</th>
						<th>Account ID</th>
						<th>Balance</th>
						<th>Status</th>
					</tr>
				</thead>
				
				
				    					
				    		
				    		
				<tbody>
				<tr>
				<td>
				<p>${message}</p>
				</td>
				</tr>
				
				    <c:forEach items="${accounts}" var="account" varStatus="i">
				    
				    	<tr>
				    	
				    	
				    		<td>${account.creationDate}</td>
				    		<td>${account.accountNumber}</td>
				    		<td>${account.balance}</td>
				    		<td>
				    			<c:choose>
				    				<c:when test="${account.approvalStatus}">Approved</c:when>
				    				<c:otherwise>Pending</c:otherwise>
				    			</c:choose>
				    		</td>
				    		<td>
				    		<form method="post" action="/approveaccount" id="authorize">
				    		<input type="hidden" name="accountID" id="accountID" value="${account.accountNumber}">
				    		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
				    		<input type="submit" class="btn btn-success btn-sm" value="Authorize">
				    		</form>
				    		</td>
				    		
				    		<td>
				    		<form method="post" action="/declineaccount" id="decline">
				    		<input type="hidden" name="accountID" id="accountID" value="${account.accountNumber}">
				    		<input type="hidden" class="btn btn-success btn-danger" name="${_csrf.parameterName}"   value="${_csrf.token}"/>
				    		 
				    		<input type="submit" value="Decline">
				    		</form>
				    		</td>
				    						    	</tr>
				    
				    </c:forEach>
				    
			    </tbody>
		    </table>
		   
		</div>
	</body>
</html>