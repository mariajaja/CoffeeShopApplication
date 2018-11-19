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
    <%@include file="partials/header.jsp" %> 
    <div class="container">
        <h1>${ message }</h1>
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
			            <td>
	                       <a href="/cart/${ menuItem.id }/add" >Add Item</a>
                        </td>
			        </tr>    
			    </c:forEach>
		    </tbody>
	    </table>
    </div>
</body>
</html>