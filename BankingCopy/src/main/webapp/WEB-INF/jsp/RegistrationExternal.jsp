<!-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> -->



<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="/js/cust_validate.js"></script>
<script src="/js/jquery.validate.js"></script> 
<style>
body{
 background-image:url('/img/register.jpg');
			  
			  background-position:right center;
			  background-size:contain;
			  background-repeat:no-repeat;
			 /*  opacity:70%; */
}
.container{
width: 60%;
/* opacity:100%; */
}
/* form{
background: linear-gradient(90deg, #e3ffe7 0%, #d9e7ff 100%);


} */
.form-control{
             border-radius: 25px;
               
        }
.btn-grad {background-image: linear-gradient(to right, #7474BF 0%, #348AC7  51%, #7474BF  100%)}
     .btn-grad {
        width:35%;
        border:none;
       
        text-align: center;
        text-transform: uppercase;
        transition: 0.5s;
        background-size: 200% auto;
        color: white;            
        box-shadow: 0 0 20px #eee;
        border-radius: 10px;
        display: block;
      }

      .btn-grad:hover {
        background-position: right center; /* change the direction of the change here */
        color: #fff;
        text-decoration: none;
        box-shadow: 0 5px 15px rgba(145, 92, 182, .4);
      }
 
 
</style>
</head>

<body>

<div class="container py-5">
<form class="form-horizontal shadow-lg p-3 mb-5 rounded" id="RegistrationExternal" action="/externalregister" method="post" name="myForm">

<div class="row">
    <div class="col-md-4">
        <h3>Register Here</h3>
    </div>
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <div class="form-field m-1 p-1">
            <label for="select" class="form-label">Customer Type</label>
            <select class="form-control" name="designation" id="designation">
              <!-- <option value="">Select Option</option> -->
              <option value="Individual">Personal</option>
              <!-- <option value="Merchant">Merchant</option> -->
            </select>
            <small></small>
          </div>
    </div>
   
  

</div>
<div class="row">
    <div class="col-md-4">
        <div class="m-1 p-1">
            <div class="form-outline">
              <label for="firstname" class="form-label">First Name</label>
              <input type="text" class="form-control" id="firstname" name="firstname"
                placeholder="First Name">
                <small></small>
            </div>
          </div>
    </div>
    <div class="col-md-4">
        <div class="m-1 p-1">
            <div class="form-outline">
              <label for="middlename" class="form-label">Middle Name</label>
              <input type="text" class="form-control" id="middlename" name="middlename"
                placeholder="Middle Name">
                <small></small>
            </div>
          </div>
    </div>
    <div class="col-md-4">
        <div class="m-1 p-1">
            <div class="form-outline">
              <label for="lastname" class="form-label">Last Name</label>
              <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last Name">
              <small></small>
            </div>
          </div>
    </div>
</div>

<div class="row">
    <div class="col-md-4">
        <div class="m-1 p-1">
            <div class="form-outline">
              <label for="email" class="form-label">Desired UserName</label>
              <input type="text" class="form-control" name="username" id="username" placeholder="Username">
              <small></small>
            </div>
          </div>
    </div>
    <div class="col-md-4">
        <div class="m-1 p-1">
            <div class="form-outline">
              <label for="password" class="form-label">Desired Password</label>
              <input type="password" class="form-control" name="password" id="password"
                placeholder="Password">
                <small></small>
            </div>
          </div>
    </div>
    <div class="col-md-4">
        <div class="m-1 p-1">
            <div class="form-outline">
              <label for="confirmpassword" class="form-label">Confirm Password</label>
              <input type="password" class="form-control" name="confirmpassword" id="confirmpassword"
                placeholder="Confirm Password">
                <small></small>
            </div>
          </div>
    </div>
</div>

<div class="row">
    <div class="col-md-4">
        <div class="m-1 p-1">
            <div class="form-outline form-white">
              <label for="date_of_birth" class="form-label">Date Of Birth</label>
              <input type="date" class="form-control" name="date_of_birth" id="date_of_birth"
                placeholder="Date of Birth">
                <small></small>
            </div>
          </div>
       
    </div>
    <div class="col-md-4">
        <div class="m-1 p-1">
            <div class="form-outline form-white">
              <label for="email" class="form-label">Email</label>
              <input type="email" class="form-control" name="email" id="email" placeholder="Email">
              <small></small>
            </div>
          </div>
    </div>
    <div class="col-md-4">
        <div class="m-1 p-1">
            <div class="form-outline form-white">
              <label for="phone" class="form-label">Phone Number</label>
              <input type="text" class="form-control" name="phone" id="phone" placeholder="Phone" min="10">
              <small></small>
            </div>
          </div>

    </div>

</div>

<div class="row">

<div class="col-md-4">
    <br>
    <div class="m-1 p-1">
        <div class="form-outline form-white">
          <label for="ssn" class="form-label">Aadhar Number</label>
          <input type="text" class="form-control" name="ssn" id="aadhar" placeholder="Aadhar Number" min="12">
         
        </div>
      </div>
</div>
<div class="col-md-4">
    <div class="m-1 p-1">
        <div class="form-outline form-white">
            <label for="SecurityQuestion1" class="form-label">What is your childhood nickname?</label>
            <input type="text" class="form-control" name="secquestion1" id="secquestion1"
              placeholder="Security Question 1">
          </div>
      </div>
</div>
<div class="col-md-4">
    <div class="m-1 p-1">
        <div class="form-outline form-white">
            <label for="SecurityQuestion2" class="form-label">Who was your childhood hero?</label>
            <input type="text" class="form-control" name="secquestion2" id="secquestion2"
              placeholder="Security Question 2" >
             
          </div>
      </div>
</div>

</div>
<div class="row">
    <div class="col-md-4">
        <div class="m-1 p-1">
            <div class="form-outline">
              <label for="address" class="form-label">Address</label>
              <textarea class="form-control" name="address" id="address" placeholder="Address"
                style="height: 100px"></textarea>
            </div>
          </div>
      
    </div>
    <div class="col-md-4">
        <br>
        <br>
        &nbsp;
        &nbsp;
        <input type="submit" id="register_external" name="action"         class="btn btn-grad rounded-pill w-50" placeholder="Submit">
        
      </div>
      
      <div class="col-md-4">
        <br>
        <br>
        &nbsp;
        &nbsp;
        
        <button type="reset" class="btn btn-grad rounded-pill w-50" id="btn-grad"><a href="/" style="color:white; text-decoration: none">Go back</a></button>
   

      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

    </div>
      
    </div>
    
</div>

    <!-- <div class="row d-flex justify-content-center align-items-center">
<div class="col-12">
  
    <h3 class="fw-normal text-center p-1">Register Here</h3>
    <div class="row g-0">

      <div class="col-lg-6 ">
        <div class="px-5">


          <div class="row">
            <div class="m-1 p-1">
              <label for="select" class="form-label">Customer Type</label>
              <select class="form-control" name="designation" id="designation">
                <option value="">Select Option</option>
                <option value="Individual">Individual</option>
                <option value="Merchant">Merchant</option>
              </select>

            </div>

            <div class="m-1 p-1">
              <div class="form-outline">
                <label for="firstname" class="form-label">First Name</label>
                <input type="text" class="form-control" id="firstname" name="firstname"
                  placeholder="First Name">
              </div>
            </div>

            <div class="m-1 p-1">
              <div class="form-outline">
                <label for="middlename" class="form-label">Middle Name</label>
                <input type="text" class="form-control" id="middlename" name="middlename"
                  placeholder="Middle Name">
              </div>
            </div>

            <div class="m-1 p-1">
              <div class="form-outline">
                <label for="lastname" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last Name">
              </div>
            </div>


            <div class="m-1 p-1">
              <div class="form-outline">
                <label for="email" class="form-label">Desired UserName</label>
                <input type="text" class="form-control" name="username" id="username" placeholder="Username">
              </div>
            </div>

            <div class="m-1 p-1">
              <div class="form-outline">
                <label for="password" class="form-label">Desired Password</label>
                <input type="password" class="form-control" name="password" id="password"
                  placeholder="Password">
              </div>
            </div>

            <div class="m-1 p-1">
              <div class="form-outline">
                <label for="confirmpassword" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" name="confirmpassword" id="confirmpassword"
                  placeholder="Confirm Password">
              </div>
            </div>

            <div class="m-1 p-1">
              <div class="form-outline">
                <label for="address" class="form-label">Address</label>
                <textarea class="form-control" name="address" id="address" placeholder="Address"
                  style="height: 100px"></textarea>
              </div>
            </div>

          </div>
        </div>
      </div>


      <div class="col-lg-6">
        <div class="px-5">
          <div class="row">
            <div class="m-1 p-1">
              <div class="form-outline form-white">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Email">
              </div>
            </div>

            <div class="m-1 p-1">
              <div class="form-outline form-white">
                <label for="phone" class="form-label">Phone Number</label>
                <input type="text" class="form-control" name="phone" id="phone" placeholder="Phone">
              </div>
            </div>


            <div class="m-1 p-1">
              <div class="form-outline form-white">
                <label for="date_of_birth" class="form-label">Date Of Birth</label>
                <input type="date" class="form-control" name="date_of_birth" id="date_of_birth"
                  placeholder="Date of Birth">
              </div>
            </div>

            <div class="m-1 p-1">
              <div class="form-outline form-white">
                <label for="ssn" class="form-label">Aadhar Number</label>
                <input type="text" class="form-control" name="ssn" id="ssn" placeholder="Aadhar Number">
              </div>
            </div>

            <div class="m-1 p-1">
              <div class="form-outline form-white">
                <label for="SecurityQuestion1" class="form-label">What is your childhood nickname?</label>
                <input type="text" class="form-control" name="secquestion1" id="secquestion1"
                  placeholder="Security Question 1">
              </div>
            </div>

            <div class="m-1 p-1">
              <div class="form-outline form-white">
                <label for="SecurityQuestion2" class="form-label">Who was your childhood hero?</label>
                <input type="text" class="form-control" name="secquestion2" id="secquestion2"
                  placeholder="Security Question 2">
              </div>
            </div>

            <div class="d-flex justify-content-center p-3">
              <button type="reset" class="btn btn-grad rounded-pill" id="btn-grad">Reset</button>
              &nbsp;&nbsp; &nbsp;
              <button id="register_external" name="action" value="register_external"
                class="btn btn-grad rounded-pill" id="btn-grad">Submit</button>
            </div>
          <div class="d-flex justify-content-center">
            <button type="reset" class="btn btn-grad rounded-pill" id="btn-grad"><a href="/" style="color:white; text-decoration: none">Go back</a></button>
          </div>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

          </div>
        </div>
      </div>


    </div>
</div> -->
</form>
</div>

<script src="./reg_form_validate.js"></script>

<script>

$(function () {
var dtToday = new Date();

var month = dtToday.getMonth() + 1;
var day = dtToday.getDate();
var year = dtToday.getFullYear();
if (month < 10)
month = '0' + month.toString();
if (day < 10)
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