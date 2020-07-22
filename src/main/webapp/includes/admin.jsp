<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<meta http-equiv="X-UA-Compatible" content="ie=edge">
			<sec:csrfMetaTags />
			<title>Florist</title>
			<link rel="stylesheet"
				href='<spring:url value="/resources/css/bootstrap.min.css"></spring:url>'>
				<link rel="stylesheet"
				href='<spring:url value="/resources/css/datatables.min.css"></spring:url>'>
			<link rel="stylesheet"
				href='<spring:url value="/resources/css/w3.css"></spring:url>'>
			<link rel="stylesheet"
				href='<spring:url value="/resources/css/style.css"></spring:url>'>
				<link rel="stylesheet"
				href='<spring:url value="/resources/css/jquery.dataTables.min.css"></spring:url>'>
			<link rel="stylesheet"
				href='<spring:url value="/resources/css/font-awesome.min.css"></spring:url>'>
			<link rel="stylesheet" 	href='<spring:url value="/resources/css/buttons.dataTables.min.css"></spring:url>'>
			<script src='<spring:url value="/resources/js/jquery.js"></spring:url>'></script>
			<script	src='<spring:url value="/resources/js/bootstrap.min.js"></spring:url>'></script>
			<script src='<spring:url value="/resources/js/jquery.dataTables.min.js"></spring:url>'></script>
			<script src='<spring:url value="/resources/js/jquery.validate.js"></spring:url>'></script>
			<script src='<spring:url value="/resources/js/additional-methods.js"></spring:url>'></script>
			<script src='<spring:url value="/resources/js/home.js"></spring:url>'></script>	
			<script type="text/javascript" src='<spring:url value="/resources/js/buttons.print.min.js"></spring:url>'></script>		
			<script type="text/javascript" src='<spring:url value="/resources/js/buttons.html5.min.js"></spring:url>'></script>
			<link rel="stylesheet" href="http://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
   				 <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
			<script src='<spring:url value="/resources/js/dataTables.buttons.min.js"></spring:url>'></script>
</head>
<script>
$(document).ready(function(){
$('#myTable1').DataTable();
});
</script>
<div class="w3-bar w3-border w3-dark-grey adminhead w3-middle">
	  <a href='<spring:url value="/admin/confirm"/>' class="w3-bar-item w3-button">Confirm Farmers</a>
	  <a href='<spring:url value="/admin/list"/>' class="w3-bar-item w3-button">Confirm orders</a>
	  <a href='<spring:url value="/admin/farmers"/>'class="w3-bar-item w3-button">Farmers</a>
	  <a href='<spring:url value="/admin/topproduct"/>'class="w3-bar-item w3-button">Top Products</a>
	  <a href='<spring:url value="/admin/customer"/>'class="w3-bar-item w3-button">Top Customers</a>

 <sec:authorize access="authenticated" var="authenticated" />
 <c:choose>
					<c:when test="${authenticated }">
					<sec:authorize access='hasRole("ROLE_CUSTOMER")'>
						<li class="w3-bar-item">Welcome <sec:authentication
									property="name" /> 
						</li>
					</sec:authorize>
					
					<li class="w3-bar-item w3-right"><a id="logout" href="#">Logout</a></li>	
						<form id="logout-form" action='<c:url value="/logout"/>'
							method="post">
							<sec:csrfInput />
						</form>
					</c:when>

					<c:otherwise>
						<li class="w3-bar-item w3-right"><a
							href='<spring:url value="/user/register"/>'>Register</a></li>
						<li class="w3-bar-item w3-right"><a
							href='<spring:url value="/login"/>'>Login</a></li>
					</c:otherwise>
				</c:choose>
 </div>
