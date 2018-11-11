<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Home</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="/style.css" />
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-*" style="background-color: #410B13; padding:30px; font-size:1em;">
	  <a class="navbar-brand" href="/" style="font-size:2em;">GC Coffee</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNav">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="/menu">Menu</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/Register">Register</a>
	      </li>
	      <li class="nav-item">
	       <%-- TO BE ADDED --%>
	        <a class="nav-link disabled" href="#">Log-In</a>
	      </li>
	    </ul>
	  </div>
	</nav>  
    <div class="container" style="padding-top:30px;">
        <h1 style="padding-bottom:30px;">Welcome to GC Coffee!</h1>
        <a href="/Register"><button class="clickThru">Create an account?</button></a>
    </div>

</body>
</html>