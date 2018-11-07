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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
    <nav id="navBar" class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">GC Coffee</a>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="nav navbar-nav">
                    <li><a href="/about">About</a></li>
                    <li><a href="/Register">Register</a></li>
                </ul>
            </div>
        </div>
        </nav>
    <div class="topDiv" id="addUserForm">
	    <form action="/AddUser" method="post">
	        <p>
	            First Name:<br><input name="firstName">
	        </p>
	        <p>
	            Last Name:<br><input name="lastName">
	        </p>
	        <p>
	            Email:<br><input type="email" name="userEmail">
	        </p>
	        <p>
	            Phone Number:<br><input type="tel" name="userPhone">
	        </p>
	        <p>
	            Username:<br><input name="username">
	        </p>
	        <p>
	            Password:<br><input type="password" name="userPassword">
	        </p>
	        <p>
	            <input type="hidden" name="timeAccountCreated">
	        </p>
	        <p>
	           <button class="clickThru">Register</button>
	        </p>
	    </form>
    </div>
</body>
</html>