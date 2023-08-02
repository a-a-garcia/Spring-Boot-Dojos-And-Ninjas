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
		<h2>Create a Ninja</h2>
	</div>
	<form:form action="/ninjas/new" method="post" modelAttribute="ninja" class="mx-5 my-2">
	<div class="errors">
		<form:errors path="first_name" class="error"/>
		<form:errors path="last_name" class="error"/>
		<form:errors path="age" class="error"/>
	</div>
		<div class="form-group mb-4">
	    	<form:label path="first_name">First Name</form:label>
	    	<form:input type="text" class="form-control" path="first_name" />
	  	</div>
		<div class="form-group mb-4">
	    	<form:label path="last_name">Last Name</form:label>
	    	<form:input type="text" class="form-control" path="last_name"/>
	  	</div>
		<div class="form-group mb-4">
	    	<form:label path="age">Age</form:label>
	    	<form:input type="int" class="form-control" path="age"/>
	  	</div>
		<form:select path="dojo">
	        <c:forEach var="dojo" items="${allDojos}">
	            <!--- Each option VALUE is the id of the person --->
	            <form:option value="${dojo.id}" path="dojo">
	            <!--- This is what shows to the user as the option --->
	                <c:out value="${dojo.name}"/>
	            </form:option>
	        </c:forEach>
    	</form:select>
	  	<input type="submit" class="btn btn-primary" value="submit"/>	
	</form:form>
</div>
</body>
</html>