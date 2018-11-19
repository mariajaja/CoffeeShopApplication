<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="/style.css" />
</head>
<body>
    <%@include file="partials/header.jsp" %> 
    <div class="container">
    <c:choose>
    <c:when test="${ not empty user and not empty cart }">
        <h1>${ message }</h1>
        <table class="table table-striped">
            <thead class="thead-dark" style="background-color:#4B4237">
                <tr>
                    <th>Item</th>
                    <th>Description</th>
                    <th style="text-align:center">Price (per item)</th>
                    <th style="text-align:center">Quantity</th>
                    <th style="text-align:center">Add to Cart</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${cart}" var="item">
                    <tr>
                        <td>${ item.menuItem.name }</td>
                        <td>${ item.menuItem.description }</td>
                        <td style="text-align:center"><fmt:formatNumber value ="${ item.menuItem.price }" type = "currency"/></td>
                        <td style="text-align:center">${ item.quantity }</td>
                        <td style="text-align:center">
                           <a href="/cart/remove" class="btn btn-outline-dark btn-sm" >Remove</a>
                        </td>
                    </tr>    
                </c:forEach>
            </tbody>
        </table>
        <h2>Your total is: <fmt:formatNumber value ="${ total }" type = "currency"/></h2>
    </c:when>
    <c:when test="${ not empty user }">
        <h1>${ message }</h1>
        <h2>There are not any items in your cart! Please see our <a href="/menu">menu</a> to add items to your cart.</h2>
    </c:when>
    <c:otherwise>
        <h1>Sorry, you need to <a href="/login">login</a> to see this page!</h1>
    </c:otherwise>
    </c:choose>
    </div>
</body>
</html>