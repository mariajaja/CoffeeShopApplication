<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="/style.css" />
</head>
<body>
    <%@include file="partials/header.jsp" %> 
    
    <h1>Login</h1>
    
    <p class="message">${ message }</p>
    
    <form action="/login" method="post">
        <p>
            <label for="username">Username:</label> <input id="username" name="username" value="${ param.username }" required min="2" />
        </p>        <p>
            <label for="password">Password:</label> <input id="password" type="password" name="userPassword" required min="2" />
        </p>
        <p>
            <button>Submit</button>
        </p>
    </form>
    
    <p>
        Don't have an account yet? <a href="/Register">Sign up here</a>.
    </p>
    
</body>
</html>