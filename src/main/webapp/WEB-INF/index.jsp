<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Read Share</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">

<style>
input{
float:right;
}

body{
background-color:linen;
}
</style>


</head>
<body>
<div class='container'>
<h1 style="color: purple;">Book Club</h1>
<h3>A place for friends to share thoughts on books.</h3>
</div>
<div class="d-flex justify-content-around align-items-center container mt-5">

<div>
<h1>Register</h1>
	<form:form action="/register" method="post" modelAttribute="newUser">
    <p>
        <form:label path="userName">User Name</form:label>
        <form:errors path="userName"/>
        <form:input path="userName"/>
    </p>
    <p>
        <form:label path="email">Email</form:label>
        <form:errors path="email"/>
        <form:input path="email"/>
    </p>
    <p>
        <form:label path="password">Password</form:label>
        <form:errors path="password"/>
        <form:input path="password"/>
    </p>
    <p>
        <form:label path="confirm">Confirm PW:&nbsp;&nbsp;</form:label>
        <form:errors path="confirm"/>     
        <form:input path="confirm"/>
    </p>    
    <input type="submit" value="Submit" class="btn btn-danger"/>
    </form:form>  
</div>

<div>
<h1>Log in</h1>
	<form:form action="/login" method="post" modelAttribute="newLogin">
    <p>
        <form:label path="email">Email:</form:label>
        <form:errors path="email"/>
        <form:input path="email"/>
    </p>
    <p>
        <form:label path="password">Password &nbsp;&nbsp;</form:label>
        <form:errors path="password"/>
        <form:input path="password"/>
    </p>
   
    <input type="submit" value="Submit" class='btn btn-success'/>
    </form:form>  
</div>





</div>


</body>
</html>