
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Transactions</title>
        <link rel="stylesheet" href="/css/cstyles.css"/>   
	</head>
	<body>
		<%@include file="HeaderPage.jsp" %>

		<table class="table">
			<thead>
			  <tr>
				<th scope="col">#</th>
				<th scope="col">First</th>
				<th scope="col">Last</th>
				<th scope="col">Handle</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
				<th scope="row">1</th>
				<td>Mark</td>
				<td>Otto</td>
				<td>@mdo</td>
			  </tr>
			  <tr>
				<th scope="row">2</th>
				<td>Jacob</td>
				<td>Thornton</td>
				<td>@fat</td>
			  </tr>
			  <tr>
				<th scope="row">3</th>
				<td colspan="2">Larry the Bird</td>
				<td>@twitter</td>
			  </tr>
			</tbody>
		  </table>
		<!-- <div class="content-container">
			<table>
				<thead>
					<tr>
						<th>Date</th>
						<th>Transaction ID</th>
						<th>Transaction Type</th>
						<th>Recipient/Sender Account Number</th>
						<th>Amount</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
				 
				    <c:forEach items="${transactions}" var="transaction">
				    	<tr>
				    		<td>${transaction.date}</td>
				    		<td>${transaction.transactionID}</td>
				    		<td>
				    			<c:choose>
				    				<c:when test="${transaction.payee.accountNumber == accountid}">Credit</c:when>
				    				<c:otherwise>Debit</c:otherwise>
				    			</c:choose>
				    		</td>
				    		<td>
				    			<c:choose>
				    				<c:when test="${transaction.payee.accountNumber == accountid}">${transaction.payer.accountNumber}</c:when>
				    				<c:otherwise>${transaction.payee.accountNumber}</c:otherwise>
				    			</c:choose>
				    		</td>
				    		<td>
				    		<c:choose>
				    				<c:when test="${transaction.payee.accountNumber == accountid}">$ ${transaction.amount}</c:when>
				    				<c:otherwise>-$ ${transaction.amount}</c:otherwise>
				    			</c:choose>
				    		</td>
				    		<td>
				    			<c:choose>
				    				<c:when test="${transaction.approvalStatus}">Approved</c:when>
				    				<c:otherwise>Pending</c:otherwise>
				    			</c:choose>
				    		</td>
				    	</tr>
				    </c:forEach>
			    </tbody>
		    </table>
		</div> -->
	</body>
</html>