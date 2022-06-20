<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Read Share</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<style>
/* .btn{
float:right;
} */
</style>
</head>
<body>
<div class="container d-flex justify-content-between align-items-center">
<h1>Add a Book to Your Shelf!</h1>
<a href="/welcome"> back to the shelves</a>
</div>
<div class="container">
<form:form action="/books/create" method="POST" modelAttribute="book">

	
	<p>
		<form:label path="title">Title </form:label>
		<form:input path="title"/>
		<form:errors path="title"/>
	</p>

	<p>
		<form:label path="authorName">Author </form:label>
		<form:input path="authorName"/>
		<form:errors path="authorName"/>
	</p>
	
	<p>
		<form:label path="thoughts">My thoughts: </form:label>
		<form:textarea path="thoughts"/>
		<form:errors path="thoughts"/>
	</p>
		<p>
		<form:hidden path="postedBy" value="${user.userName}"/>
		<form:hidden path="user" value="${user.id}"/>
	</p>
	
	
	<input type="submit" value="create" class="btn btn-success"/>

</form:form>


</div>

</body>
</html>