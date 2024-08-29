<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <title>FitHub</title>
    <style>
        <%@ include file="css/register.css" %>
    </style>
</head>
<body>
<div class="navbar">
    <h1>FitHub</h1>
</div>
<%
    String error = (String) request.getAttribute("error");
    if (error != null && !error.isEmpty()) {
%>
<div class="alert alert-danger"><%= error %>
</div>
<%
    }
%>
<div class="main-container">
    <div class="header">
        <h1>FitHub</h1>
    </div>
    <div class="container">
        <h2>Sign in with your Account</h2>
        <form method="post" action="/login">
            <input type="email" id="exampleInputEmail1" name="email" aria-describedby="emailHelp"
                   placeholder="Email Address">
            <input type="password" id="exampleInputPassword1" name="password" placeholder="Password">
            <input type="submit" value="Sign In">
        </form>
    </div>
</div>
</body>
</html>