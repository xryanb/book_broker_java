<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Read Share</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">

<style>
.btn{
float:right;
}
</style>

</head>
<body>

<div class="container d-flex justify-content-between align-items-center">
<h1>${book.title}</h1>
<a href="/welcome">back to the shelves</a>
</div>

<div class="container mt-5">
<h3>Here are ${book.postedBy}'s thoughts:</h3>
<hr class="mt-5">
<p>${book.thoughts}</p>
<hr class="mt-5">
<c:if test="${user.id == book.user.id}">
<a href="/books/${user.id}/edit" class="btn btn-danger">Edit</a>
</c:if>
</div>


</body>
</html>