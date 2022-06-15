<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity4">
	<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="/js/jquery.keyboard.js"></script>
	<script src="/js/jquery.keyboard.extension-typing.js"></script>
	<script src="/js/jquery.mousewheel.js"></script>
	<link rel="stylesheet" href="/css/keyboard.css">
	<link rel="stylesheet" href="/css/jquery-ui.css">
	
	<!-- CSS only -->
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	
	 <!-- JavaScript Bundle with Popper -->
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

    
      <!-- Favicons -->
      <link href="/img/logo.png" rel="icon">
      <link href="/img/logo.png" rel="apple-touch-icon">
    
      <!-- Google Fonts -->
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    
</head>
<body>
	<%@include file="./HeaderPage.jsp"%>
	
	<div class="container mt-5 p-5">
		<div class="starter-template">
			<h4>OTP - Validate your OTP</h4>
			<form id="validateOtp" action="/OpenAccount" method="post">
				<fieldset>
					<%-- <div th:if="${param.error}">
						<div class="alert alert-danger">Invalid Otp Try Again</div>
					</div> --%>
					<div class="form-group">
						<input type="number" name="otpnum" id="otpnum" step="1"
							max="1000000" class="form-control input-lg" required="true"
							autofocus="true" />
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
						<br>
							<button id="otpsender" class="btn btn-md btn-primary btn-block" style="background-color:rgb(65, 84, 241); border:none; color:white;">Submit</button>

							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6"></div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>

	<script type="text/javascript">
$(document).ready(function () {
    $("#otpsender").click(function (event) {
        //stop submit the form, we will post it manually.
        event.preventDefault();
        var data  = 'otpnum='+$("#otpnum").val();
        $.ajax({
            type: "GET",
            url:  "/validateOtp",
            data: data,
            dataType: 'text',
            cache: false,
            timeout: 600000,
            success : function(response) {
                    alert( response );
                    $( "#validateOtp" ).submit();
                },
                error : function(xhr, status, error) {
                    alert(xhr.responseText);
                    return false;
                }
        });
    });
});
$('#otpnum')
.keyboard({
	layout : 'num',
	restrictInput : true, // Prevent keys not in the displayed keyboard from being typed in
	preventPaste : true,  // prevent ctrl-v and right click
	autoAccept : true
})
.addTyping();
</script>
</body>
</html>