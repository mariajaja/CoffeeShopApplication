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
        <h1>${ message }</h1>
        <table class="table table-striped">
            <thead class="thead-dark" style="background-color:#4B4237">
                <tr>
                    <th>Item</th>
                    <th>Description</th>
                    <th>Price (per item)</th>
                    <th>Quantity</th>
                    <th>Add to Cart</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${cart}" var="item">
                    <tr>
                        <td>${ item.menuItem.name }</td>
                        <td>${ item.menuItem.description }</td>
                        <td><fmt:formatNumber value ="${ item.menuItem.price}" type = "currency"/></td>
                        <td>${ item.quantity }</td>
                        <td>
                           <a href="/admin/menu/delete?id=${ item.id }" >Delete</a>
                        </td>
                    </tr>    
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>