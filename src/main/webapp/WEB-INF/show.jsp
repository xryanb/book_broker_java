<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<title>Read Share</title>

<style>

body{
background-color:linen;
background-size:cover;
}

</style>

</head>
<body>
<div class="container d-flex justify-content-between align-items-center">
<div class="container">
<h1 style="color:purple;">Welcome, <c:out value="${user.userName}"></c:out>!</h1>
<p style="color:white;">Books from everyone's shelves..</p>
</div>
<div class="container">
<p><a href="/logout">logout</a></p>
<p><a href="/books/new">+ Add a to my shelf!</a></p>
</div>
</div>


<div class='container'>


<table class="table table-dark table-hover">

	<thead>
		<tr>
		<th scope="col">Id</th>
		<th scope="col">Title</th>
		<th scope="col">Author Name</th>
		<th scope="col">Posted By</th>
		<th scope="col">Actions</th>
		</tr>
	</thead>

	<tbody>
	<c:forEach var="all" items="${all}"> 
	<tr>
	<td><c:out value="${all.id}"/></td>
	<td><a href="/books/${all.id}"><c:out value="${all.title}"/></a></td>
	<td><c:out value="${all.authorName}"/></td>
	<td><c:out value="${all.postedBy}"/></td>
	<c:if test = "${all.user.id==user.id}">
			       <td><a href="/books/${all.id}/edit">edit</a> <a href="/books/delete/${all.id}">delete</a></td>
			    </c:if>
				<c:if test = "${all.user.id!=user.id}">
			       <td><a href="/bookmarket/${all.id}">borrow</a></td>
			    </c:if>
	</tr>
	</c:forEach>
	</tbody>
</table>
</div>

<div class="container">
<p>Books I'm borrowing..</p>
<table class="table">
	<thead>
		<tr>
		<th scope="col">Id</th>
		<th scope="col">Title</th>
		<th scope="col">Author Name</th>
		<th scope="col">Posted By</th>
		<th scope="col">Actions</th>
		</tr>
	</thead>
    <tbody>
		<c:forEach var="book" items="${myBooks}">
			<tr>
				<td><c:out value="${book.id}"></c:out></td>
				<td><a href="/books/${book.id}"><c:out value="${book.title}"></c:out></a></td>
				<td><c:out value="${book.authorName}"></c:out></td>
				<td><c:out value="${book.user.userName}"></c:out></td>
				<td><a href="/bookmarket/return/${book.id}">return</a></td>
			</tr>	
		</c:forEach>
    </tbody>
</table>

</div>


</body>
</html>