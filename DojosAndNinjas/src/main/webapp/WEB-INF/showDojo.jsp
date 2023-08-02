<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date"%> <!-- Tells us meta info, what language we're using.. etc.. we can add edits later. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/script.js"></script>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Dojos and Ninjas</title>
</head>
<body>
<div class=card>
	<div class=card-header>
		<h2><c:out value="${dojo.name}"></c:out> Location Ninjas</h2>
	</div>
	<div class=card-body>
		<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">First Name</th>
		      <th scope="col">Last Name</th>
		      <th scope="col">Age</th>
		    </tr>
		  </thead>
		  <tbody>
		   <c:forEach var="ninja" items="${dojo.ninjas}">
		   		<tr>
		   			<td><c:out value="${ninja.first_name}"></c:out></td>
		   			<td><c:out value="${ninja.last_name}"></c:out></td>
		   			<td><c:out value="${ninja.age}"></c:out></td>
		   		</tr>
		   </c:forEach>
		  </tbody>
		</table>
		<a href="/dojos/new">Go back</a>
	</div>
</div>
</body>
</html>