$().ready(function(){
	$("#RegistrationExternal").validate({
		rules:{
			designation: "required",
			firstname: {required:true,
				alphabet:true},
			lastname:{required:true,
				alphabet:true},
			username:{minlength:2,
				required: true},
			password:{minlength:6,
				required: true,
				passwordvalidation: true},
			confirmpassword:{minlength:6,
				required: true,
				equalTo:"#password",
				passwordvalidation: true},
			email:{required:true,
				emailvalidation:true},
			address:{required:true,
				addressfilter:true},
			phone:{required:true,
				phoneUS:true},
			date_of_birth:"required",
			ssn:{required:true,
				SSNvalidation:true},
			secquestion1:{required:true,
				secvalidation:true},
			secquestion2:{required:true,
				secvalidation:true}
		},
		messages:{
			designation:"Please select a customer type",
			firstname:{
				required:"Please enter your first name",
				},
			lastname:{
				required:"Please enter your last name",
			},
			ssn:{required:"Please enter your Aadhar No."},
			date_of_birth:{required:"Please enter your DOB"},
			address:{required:"Please enter your Address"},
			phone:{required:"Please enter your phone number"},
			secquestion1:{required:"Please answer the security question"},
			secquestion2:{required:"Please answer the security question"},
			email:{required:"Please enter your email"},
			username:{
				minlength:"Username should be atleast 2 characters long",
				required:"Please enter a username"
			},
			password:{
				minLength:"Password should be atleast 6 characters long",
				required:"Please enter a password"
			},
			confirmpassword:{
				minLength:"Password should be atleast 6 characters long",
				required:"Please enter a password",
				equalTo:"Passwords dont match"
			}
		}
	});
	
	$("#username").focus(function(){
		var firstname= $("#firstname").val();
		var lastname=$("#lastname").val();
		if(firstname && lastname && !this.value){
			this.value = firstname + "." + lastname;
		}
	});
	
	jQuery.validator.addMethod("alphabet", function(value, element) {
	    return this.optional(element) || /^[A-z]+$/i.test(value);
	}, "Letters only please");
	
	jQuery.validator.addMethod("secvalidation", function(value, element) {
	    return this.optional(element) || /^[A-z0-9]+$/i.test(value);
	}, "Letters or Numbers only please");
	
	// jQuery.validator.addMethod("SSNvalidation", function(value, element) {
	//     return this.optional(element) || /^[0-9]{3}\-?[0-9]{2}\-?[0-9]{4}$/i.test(value);
	// }, "Please Enter a Valid SSN(XXX-XX-XXXX)");
	
	jQuery.validator.addMethod("addressfilter", function(value, element) {
	    return this.optional(element) || /^[A-z0-9\s]+$/i.test(value);
	}, "Letters or Numbers with spaces only please");
	
	jQuery.validator.addMethod("passwordvalidation", function(value, element) {
	    return this.optional(element) || /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/i.test(value);
	}, "Enter a proper valid password");
	
	// jQuery.validator.addMethod( "phoneUS", function( phone_number, element ) {
	// 	phone_number = phone_number.replace( /\s+/g, "" );
	// 	return this.optional( element ) || phone_number.length > 9 &&
	// 		phone_number.match( /^(\+?1-?)?(\([2-9]([02-9]\d|1[02-9])\)|[2-9]([02-9]\d|1[02-9]))-?[2-9]\d{2}-?\d{4}$/ );
	// }, "Please specify a valid phone number(+1(XXX)-XXX-XXXX)" );
	
	jQuery.validator.addMethod("emailvalidation", function(value, element) {
	    return this.optional(element) || /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i.test(value);
	}, "Enter a proper email format");

	// jQuery.validator.addMethod( "phoneUS", function( phone_number, element ) {
	// 	phone_number = phone_number.replace( /\s+/g, "" );
	// 	return this.optional( element ) || phone_number.length > 9 &&
	// 		phone_number.match( /^((\+){0,1}91(\s){0,1}(\-){0,1}(\s){0,1}){0,1}98(\s){0,1}(\-){0,1}(\s){0,1}[1-9]{1}[0-9]{7}$/);
	// }, "Please specify a valid phone number(+91-XXX-XXX-XXXX)" );


	
	$("#ScheduleAppointment").validate({
		rules:{
			appointment: "required",
			schedule_date:"required"
	},
	messages:{
		appointment:"Please select a customer type",
		schedule_date:{required:"Please enter your DOB"},
	}
});

	$("#OpenAccount").validate({
		rules:{
			account_type: "required",
			firstname: {required:true,
				alphabet:true},
			lastname:{required:true,
				alphabet:true},
			email:{required:true,
				emailvalidation:true},
			date_of_birth:"required",
			secquestion1:{required:true,
				secvalidation:true},
			secquestion2:{required:true,
				secvalidation:true}
		},
		messages:{
			account_type:"Please select an account type",
			firstname:{
				required:"Please enter your first name",
				},
			lastname:{
				required:"Please enter your last name",
			},
			date_of_birth:{required:"Please enter your DOB"},
			secquestion1:{required:"Please answer the security question"},
			secquestion2:{required:"Please answer the security question"},
			email:{required:"Please enter your email"}
		}
	});
	
})


// function validate() {
//     const firstNameVal = firstname.value
//     const lastNameVal = lastname.value
// 	const usernameVal = username.value
//     const addressVal = address.value    
//     const emailVal = email.value
//     const phoneVal = phone.value
//     const passwordVal = password.value
//     const password2Val = confirmpassword.value
    
//      const DOBVal = date_of_birth.value

     

//     //first name
//     if (firstNameVal === ''||firstNameVal.trim()=="") {
//         setErrorMsg(firstname, 'First Name is Required')
//     } else if (firstNameVal.length < 2) {
//         setErrorMsg(firstname, 'Please enter name properly')
//     } else {
//         setSuccessMsg(firstname)
//     }

//     //last name
//     if (lastNameVal === '') {
//         setErrorMsg(lastname, 'lastname required')
//     } else if (lastNameVal.length < 2) {
//         setErrorMsg(lastname, 'username atleast 2 char')
//     } else {
//         setSuccessMsg(lastname)
//     }

//     //Username
//     if (usernameVal === ''|| usernameVal.trim()=="") {
//         setErrorMsg(username, 'First Name is Required')
//     } else if (usernameVal.length < 2) {
//         setErrorMsg(username, 'Please enter name properly')
//     } else {
//         setSuccessMsg(username)
//     }

//     //Address
//     if (addressVal === ''||addressVal.trim()=="") {
//         setErrorMsg(address, 'address is Required')
//     } else if (addressVal.length < 15) {
//         setErrorMsg(address, 'Please enter address properly')
//     } else {
//         setSuccessMsg(address)
//     }
    
//     // email validate
//     let regEx= /^\w+([-+.']\w+)@\w+([-.]\w+)\.\w+([-.]\w+)*$/
    
//     if (emailVal === '') {
//         setErrorMsg(email, 'Write an Email')
//     } else if(!regEx.test(String(emailVal))){
//         setErrorMsg(email, 'Not a valid email')
//     } else {
//         setSuccessMsg(email)
//     }

//     //phone validate
//     if (phoneVal === '') {
//         setErrorMsg(phone, 'Mobile cannot be blank')
//     } else if (isNaN(phoneVal)) {
//         setErrorMsg(phone, 'Enter number only!')
//     }
//     else if (phoneVal.length != 10) {
//         setErrorMsg(phone, 'Number should be 10 digit')
//     }
//      else {
//         setSuccessMsg(phone)
//     }
    
//     if (DOBVal === '') {
//         setErrorMsg(DOBVal, 'Enter date of birth')
//     }else {
//         setSuccessMsg(DOBVal)
//     }

//     //password validate
//     if (passwordVal === '') {
//         setErrorMsg(password, 'Enter a password')
//     } else if (passwordVal.length <= 7) {
//         setErrorMsg(password, 'Use minimum 8 character')
//     } else {
//         setSuccessMsg(password)
//     }

//     //confirm password validate
//     if (passwordVal === '') {
//         setErrorMsg(password2, 'Confirm password')
//     } else if (passwordVal != password2Val) {
//         setErrorMsg(password2, 'Password does not match! Try again')
//     } else {
//         setSuccessMsg(password2)
//     }

//     successMsgAlert(firstNameVal)

// }

// function setErrorMsg(input, errMsg) {
//     let formControl = input.parentElement;
//     let small = formControl.querySelector('small')
//     formControl.className = 'Fields error'
//     small.innerText = errMsg;
// }

// function setSuccessMsg(input) {
//     const formControl = input.parentElement;
//     formControl.className = 'Fields success'
// }


// function successMsgAlert(firstNameVal) {
//     let formControll = document.getElementsByClassName('Fields')
//     let count = formControll.length - 1
//     for (let i = 0; i <= formControll.length; i++) {
//         if (formControll[i].className === 'Fields success') {
//             let sRate = 0 + i
//             sendData(firstNameVal, sRate, count)
//         } else {
//             return false;
//         }
//     }
// }

// function sendData(firstNameVal, sRate, count) {
//     if (sRate === count) {

//         Swal.fire(
//             'Welcome! ' + firstNameVal,
//             'Registration Successfully Done',
//             'success'
//         )
//         form.reset()

//         let formCon = document.getElementsByClassName('Fields success');
//         [...formCon].forEach((element) => {
//             element.className = 'Fields'
//         })
//     }
// }