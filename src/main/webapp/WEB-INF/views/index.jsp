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
    <%@include file="partials/header.jsp" %> 
    <div class="container" style="padding-top:30px;">
        <h1 style="padding-bottom:30px;">Welcome to GC Coffee!</h1>
        
        <h2>${ message }</h2>
        <c:choose>
            <c:when test="${ not empty user }">    
                <h3>Welcome back!</h3>
                <h4>Would you like to <a href="/cart/your-items">view your cart</a>?</h4>
            </c:when>
            <c:otherwise>
                <a href="/Register"><button class="clickThru">Create an account?</button></a>
            </c:otherwise>
        </c:choose>
    </div>

</body>
</html>