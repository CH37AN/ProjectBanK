
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin HomePage</title>
</head>
<body>
<%@include file="HeaderPageTier3.jsp" %>
<div class="container mt-5 p-5">
	<form id="Tier3home" method="post">
    	<table align="center">
        	<tr>
	           <td>
                 <h2>ADMIN HOME</h2>
                 <!-- <div class="card-group">
                  <div class="card text-dark bg-info mb-3 p-3 m-3" style="max-width: 18rem;">
                    <div class="card-header">Customers</div>
                    <div class="card-body">
                      <h5 class="card-title">Info card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                  </div>
                  <div class="card text-white bg-primary mb-3 p-3 m-3" style="max-width: 18rem;">
                    <div class="card-header">Transaction</div>
                    <div class="card-body">
                      <h5 class="card-title">Primary card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                  </div> 
                <div class="card-group card text-dark bg-warning mb-3 p-3 m-3" style="max-width: 18rem;">
                  <div class="card-header">Number of Employees</div>
                  <div class="card-body">
                    <h5 class="card-title">Warning card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  </div>
                </div>
                </div> 
                -->
              </div>
                  
                 <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
              </td>
            </tr>
            <tr>
            <td>${message}</td>
            </tr>
    </table>
 </form>
</div>
</body>
</html>
