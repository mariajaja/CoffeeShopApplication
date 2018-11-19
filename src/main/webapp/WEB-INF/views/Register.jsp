<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register Here!</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="/style.css" />
</head>
<body>
    <%@include file="partials/header.jsp" %>
    <div class="container" style="padding-top:30px;">
	    <form action="/Register" method="post">
	       <fieldset>
	           <legend>Create an Account</legend>
		       <p>
		           First Name*:<br><input name="firstName" required pattern="[A-Z][A-Za-z]{2,25}">
		       </p>
		       <p>
		           Last Name*:<br><input name="lastName" required pattern="[A-Z][A-Za-z]{2,25}">
		       </p>
		       <p>
		           Email*:<br><input type="email" name="userEmail" required>
		       </p>
		       <p>
		           Phone Number:<br><input type="tel" name="userPhone" id="phone" pattern="[\d]{10}" title="Please enter your area code. Do not add any characters other than numbers.">
		       </p>
		       <p>
	               Birthday:<br><input type="date" name="birthdayInput">           
	           </p>
		       <p>
		           Username*:<br><input name="username" required pattern="[A-Za-z!$@#%]{5,25}">
		       </p>
		       <p>
		           Password*:<br><input type="password" name="userPassword" id="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
		              title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 characters">
		       </p>
		       <p>
		           Retype password*:<br><input type="password" name="checkPassword" id="password_confirm" required oninput="check(this)"
		              title="Passwords must match">
		       </p>
		       <p> Sign up for weekly newsletter? 
		          <label><input type="radio" name="newsletter" value="true" />Yes</label>
                  <label><input type="radio" name="newsletter" value="false" checked="checked" />No</label>
		          <br>
		          Sign up for birthday treat?
		          <label><input type="radio" name="birthdayTreat" value="true" />Yes</label>
		          <label><input type="radio" name="birthdayTreat" value="false" checked="checked" />No</label>
		       </p>
		       <p> 
		          <button class="clickThru">Register</button>
		       </p>
		       <p> 
		          * required to register an account
		       </p>
	        </fieldset>
	    </form>
    </div>
    <script>   
        var phone = document.getElementById('phone').value
        function check(input) {
            if (input.value != document.getElementById('password').value) {
                input.setCustomValidity('Password Must be Matching.');
            } else {
                // input is valid -- reset the error message
                input.setCustomValidity('');
            }
        }  
    </script>
</body>
</html>