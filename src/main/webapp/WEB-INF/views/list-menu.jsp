<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Menu</title>
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
    <div class="container">
	    <table class="table table-striped">
	        <thead class="thead-dark" style="background-color:#4B4237">
		        <tr>
		            <th>Item</th>
		            <th>Description</th>
		            <th>Price</th>
		        </tr>
	        </thead>
	        <tbody>
			    <c:forEach items="${list}" var="menuItem">
			        <tr>
			            <td>${ menuItem.name }</td>
			            <td>${ menuItem.description }</td>
			            <td><fmt:formatNumber value ="${ menuItem.price}" type = "currency"/></td>
			        </tr>    
			    </c:forEach>
		    </tbody>
	    </table>
    </div>
</body>
</html>