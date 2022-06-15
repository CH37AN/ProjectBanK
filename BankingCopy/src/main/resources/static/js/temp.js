function validate() {
    const firstNameVal = firstname.value
    const lastNameVal = lastname.value
	const usernameVal = username.value
    const addressVal = address.value    
    const emailVal = email.value
    const phoneVal = phone.value
    const passwordVal = password.value
    const password2Val = confirmpassword.value
    
     const DOBVal = date_of_birth.value

     

    //first name
    if (firstNameVal === ''||firstNameVal.trim()=="") {
        setErrorMsg(firstname, 'First Name is Required')
    } else if (firstNameVal.length < 2) {
        setErrorMsg(firstname, 'Please enter name properly')
    } else {
        setSuccessMsg(firstname)
    }

    //last name
    if (lastNameVal === '') {
        setErrorMsg(lastname, 'lastname required')
    } else if (lastNameVal.length < 2) {
        setErrorMsg(lastname, 'username atleast 2 char')
    } else {
        setSuccessMsg(lastname)
    }

    //Username
    if (usernameVal === ''|| usernameVal.trim()=="") {
        setErrorMsg(username, 'First Name is Required')
    } else if (usernameVal.length < 2) {
        setErrorMsg(username, 'Please enter name properly')
    } else {
        setSuccessMsg(username)
    }

    //Address
    if (addressVal === ''||addressVal.trim()=="") {
        setErrorMsg(address, 'address is Required')
    } else if (addressVal.length < 15) {
        setErrorMsg(address, 'Please enter address properly')
    } else {
        setSuccessMsg(address)
    }
    
    // email validate
    let regEx= /^\w+([-+.']\w+)@\w+([-.]\w+)\.\w+([-.]\w+)*$/
    
    if (emailVal === '') {
        setErrorMsg(email, 'Write an Email')
    } else if(!regEx.test(String(emailVal))){
        setErrorMsg(email, 'Not a valid email')
    } else {
        setSuccessMsg(email)
    }

    //phone validate
    if (phoneVal === '') {
        setErrorMsg(phone, 'Mobile cannot be blank')
    } else if (isNaN(phoneVal)) {
        setErrorMsg(phone, 'Enter number only!')
    }
    else if (phoneVal.length != 10) {
        setErrorMsg(phone, 'Number should be 10 digit')
    }
     else {
        setSuccessMsg(phone)
    }
    
    if (DOBVal === '') {
        setErrorMsg(DOBVal, 'Enter date of birth')
    }else {
        setSuccessMsg(DOBVal)
    }

    //password validate
    if (passwordVal === '') {
        setErrorMsg(password, 'Enter a password')
    } else if (passwordVal.length <= 7) {
        setErrorMsg(password, 'Use minimum 8 character')
    } else {
        setSuccessMsg(password)
    }

    //confirm password validate
    if (passwordVal === '') {
        setErrorMsg(password2, 'Confirm password')
    } else if (passwordVal != password2Val) {
        setErrorMsg(password2, 'Password does not match! Try again')
    } else {
        setSuccessMsg(password2)
    }

    successMsgAlert(firstNameVal)

}

function setErrorMsg(input, errMsg) {
    let formControl = input.parentElement;
    let small = formControl.querySelector('small')
    formControl.className = 'Fields error'
    small.innerText = errMsg;
}

function setSuccessMsg(input) {
    const formControl = input.parentElement;
    formControl.className = 'Fields success'
}


function successMsgAlert(firstNameVal) {
    let formControll = document.getElementsByClassName('Fields')
    let count = formControll.length - 1
    for (let i = 0; i <= formControll.length; i++) {
        if (formControll[i].className === 'Fields success') {
            let sRate = 0 + i
            sendData(firstNameVal, sRate, count)
        } else {
            return false;
        }
    }
}

function sendData(firstNameVal, sRate, count) {
    if (sRate === count) {

        Swal.fire(
            'Welcome! ' + firstNameVal,
            'Registration Successfully Done',
            'success'
        )
        form.reset()

        let formCon = document.getElementsByClassName('Fields success');
        [...formCon].forEach((element) => {
            element.className = 'Fields'
        })
    }
}