<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <title>Employee Registration</title>
            <%@ page isELIgnored="false" %>
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="/js/employee_validate.js"></script>
<script src="/js/jquery.validate.js"></script>
        </head>

<body>
<div class="content-wrapper">
<%@include file="HeaderPageTier3.jsp" %>
</div>
<div class="container m-auto p-5 mt-3 text-center align-content-center">
    <div class="row">
        <div class="col-md-6 p-2">
            <div class="changepwd-image mt-5 p-4">
                <img src="/img/features-2.png" height="300px">
            </div>
        </div>
        <div class="col-md-6 p-2">
            <form class="mt-5 p-3 shadow-lg p-3 mb-5 rounded w-100" id="EmployeeDelete"  action="emp_delete" method="post">
                <p align="center" class="alert alert-primary" role="alert">To Delete an Employee please provide the following information.</p>
            
                            <table align="center" class="form-group mb-3 px-3">
                                <tr>
                                    <td><p>${message}</p></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label path="firstname">First Name: </label>
                                    </td>
                                    <td>
                                        <input class="form-control m-2" path="firstname" name="firstname" id="firstname"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label path="lastname">Last Name: </label>
                                    </td>
                                    <td>
                                        <input class="form-control m-2" path="lastname" name="lastname" id="lastname"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label path="username">User Name: </label>
                                    </td>
                                    <td>
                                        <input class="form-control m-2" path="username" name="username" id="username"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td align="left">
                                        <button class="btn btn-success form-group mb-3 px-3" style="background-color:rgb(65, 84, 241); border:none;" id="emp_del_search" name="action" value="emp_del_search">Submit</button>
                                        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                                    </td>
                                </tr>
                            </table>
                            
            </form>  
        </div>
    </div>
  
</div>           
</body>
</html>
