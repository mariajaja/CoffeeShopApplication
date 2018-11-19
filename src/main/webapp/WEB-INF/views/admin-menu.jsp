<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
	<title>${ title }</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/sketchy/bootstrap.min.css" />
	<link rel="stylesheet" href="/style.css" />
</head>
<body>
    <%@include file="partials/header.jsp" %> 
    <div class="container">
        <h1>Inventory</h1>
        
        <form class="form-inline" action="/admin/menu" autocomplete="off">
          <label class="sr-only" for="keyword">Keyword</label>
          <input type="text" value="${param.keyword}" class="form-control mb-2 mr-sm-2" id="keyword" name="keyword" placeholder="Keyword">
          
          <label class="sr-only" for="category">Category</label>
          <select class="form-control mb-2 mr-sm-2" id="category" name="category">
            <option value="">Category</option>
            <c:forEach items="${ categories }" var="cat">
                <option <c:if test="${ cat eq param.category }">selected</c:if>>${ cat }</option>
            </c:forEach>
          </select>
        
          <button type="submit">Search</button>
          <c:if test="${not empty param.keyword or not empty param.category}">
            <a href="/admin/menu">Clear</a>
          </c:if>
        </form>
        
        <table class="table table-striped">
            <thead class="thead-dark" style="background-color:#4B4237">
            <tr>
                <th>Item</th>
                <th>Category</th>
                <th>Description</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ items }" var="menuItem">
                <tr>
                    <td>${ menuItem.name }</td>
                    <td><fmt:formatNumber value="${ menuItem.price}" type="currency" /></td>
                    <td>${ menuItem.category }</td>
                    <td>${ menuItem.description }</td>
                    <td>
                        <a href="/admin/menu/modify?id=${ menuItem.id }" >Edit</a>
                        <a href="/admin/menu/delete?id=${ menuItem.id }" >Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        
        <a href="/admin/menu/create">Add</a>
    </div>
</body>
</html>