<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-*" style="background-color: #410B13; padding:30px; font-size:1em;">
      <a class="navbar-brand" href="/" style="font-size:2em;">GC Coffee</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <c:choose>
            <c:when test="${ not empty user }">
                <li class="nav-item"> 
                    <a class="nav-link" href="">Welcome ${ user.username }</a>
                </li>
                <li class="nav-item">
		            <a class="nav-link" href="/menu">Menu</a>
		        </li>
                <li class="nav-item">
                    <a class="nav-link" href="/cart/your-items">Your cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Logout</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="nav-item">
                    <a class="nav-link" href="/menu">Menu</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/Register">Sign Up</a>
                </li>
            </c:otherwise>
          </c:choose>
        </ul>
      </div>
    </nav>  
</body>
</html>