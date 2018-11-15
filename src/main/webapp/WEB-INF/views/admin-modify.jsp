<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>${ title }</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/sketchy/bootstrap.min.css" />
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
        <h1>${ title }</h1>
        
        <form method="post">
            <input type="hidden" name="id" value="${ item.id }" />
            <div class="form-group">
                <label for="name">Item</label>
                <input class="form-control" id="name" name="name" value="${ item.name }" required min="2" autocomplete="off">
            </div>
            <div class="form-group">
                <label for="description">Price</label>
                <input class="form-control" id="price" name="price" value="${ item.price }" required min="3">
            </div>
            <div class="form-group">
                <label for="category">Category</label>
                <input class="form-control" id="category" name="category" value="${ item.category }" required>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <input class="form-control" id="description" name="description" value="${ item.description }" required min="3">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="/admin/menu" class="btn btn-link">Cancel</a>
        </form>
    </div>

</body>
</html>