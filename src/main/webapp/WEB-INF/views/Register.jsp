<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register Here!</title>
    <link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
    <form action="/AddUser" method="post">
        <p>
            First Name:<br><input name="firstName">
        </p>
        <p>
            Last Name:<br><input name="lastName">
        </p>
        <p>
            Email:<br><input type="email" name="userEmail">
        </p>
        <p>
            Phone Number:<br><input type="tel" name="userPhone">
        </p>
        <p>
            Username:<br><input name="username">
        </p>
        <p>
            Password:<br><input type="password" name="userPassword">
        </p>
        <p>
            <input type="hidden" name="timeAccountCreated">
        </p>
        <p>
        <button>Register</button>
        </p>
    </form>
</body>
</html>