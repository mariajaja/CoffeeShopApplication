<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>${ title }</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="/style.css" />
</head>
<body>
    <%@include file="partials/header.jsp" %> 
    <div class="container">
        <h1>${ title }</h1>
        
        <form method="post">
            <input type="hidden" name="id" value="${ item.id }" />
            <div class="form-group">
                <label for="name">Item</label>
                <input class="form-control" id="name" name="name" required min="2" autocomplete="off">
            </div>
            <div class="form-group">
                <label for="category">Category</label>
                <input class="form-control" id="category" name="category" required>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <input class="form-control" id="description" name="description" required min="3">
            </div>
            <div class="form-group">
                <label for="description">Price</label>
                <input class="form-control" id="price" name="price" required min="3">
            </div>
            <button type="submit" class="btn btn-dark">Submit</button>
            <a href="/admin/menu" class="btn btn-outline-dark">Cancel</a>
        </form>
    </div>
    

</body>
</html>