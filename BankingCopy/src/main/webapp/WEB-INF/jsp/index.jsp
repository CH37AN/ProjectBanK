<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<div class="banner-container">
			<header role="banner">
		        <nav role="navigation">
		            <ul class="top-bar">
		                <li class="cta"><a class="OutLineButton" href="../ManualUploadForm">View Something</a></li>
		                <li class="cta"><a class="OutLineButton" href="../ManualUploadForm">View Something</a></li>
		                <li class="cta"><a class="OutLineButton" href="../ExcelUploadForm">Profile</a></li>
		                <li class="cta"><a class="OutLineButton" href="/login">Log Out</a></li>
<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/> 
		            </ul>
		        </nav>
			</header>
	    </div>
		    
	</body>
</html>