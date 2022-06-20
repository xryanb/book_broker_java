<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit my Task</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

</head>
<body>

<div class="d-flex justify-content-between align-items-center container">
<h1 style="color: green;">Change your Entry</h1>
<a href="/welcome">back to shelves</a>
</div>
<div class='container'>
<form:form action="/books/${book.id}" method="post" modelAttribute="book">
    <input type="hidden" name="_method" value="put">
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
    <input type="submit" value="Submit"/>
</form:form>
</div>
</body>
</html>