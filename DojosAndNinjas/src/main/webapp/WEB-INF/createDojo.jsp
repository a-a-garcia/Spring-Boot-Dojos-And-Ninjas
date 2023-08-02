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
		<h2>New Dojo</h2>
	</div>
	<form:form action="/dojos/new" method="post" modelAttribute="dojo" class="mx-5 my-2">
	<div class="errors">
		<form:errors path="name" class="error"/>
	</div>
		<div class="form-group mb-4">
	    	<form:label path="name">Name</form:label>
	    	<form:input type="text" class="form-control" path="name" />
	  	</div>
	  	<input type="submit" class="btn btn-primary" value="submit"/>	
	</form:form>
</div>
</body>
</html>