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
				href='<spring:url value="/resources/css/w3.css"></spring:url>'>
			<link rel="stylesheet"
				href='<spring:url value="/resources/css/style.css"></spring:url>'>
			<link rel="stylesheet"
				href='<spring:url value="/resources/css/datatables.min.css"></spring:url>'>
			<link rel="stylesheet"
				href='<spring:url value="/resources/css/font-awesome.min.css"></spring:url>'>
			<script src='<spring:url value="/resources/js/jquery.js"></spring:url>'></script>
			<script	src='<spring:url value="/resources/js/bootstrap.min.js"></spring:url>'></script>
				<script src='<spring:url value="/resources/js/jquery.validate.js"></spring:url>'></script>
			<script src='<spring:url value="/resources/js/additional-methods.js"></spring:url>'></script>
			<script src='<spring:url value="/resources/js/datatables.min.js"></spring:url>'></script>
			<script src='<spring:url value="/resources/js/home.js"></spring:url>'></script>

</head>
<div>
	<div class="logodiv img-responsive">
		<img alt='logo' class="logo"
			src='<spring:url value="/resources/images/logo.png"/>'>
	</div>
</div>
	<div class="container-fluid head">
		<div class="w3-bar  w3-gray">
			<ul>
			<li class="w3-bar-item"><a
					href='<spring:url value="/" />'>Home</a></li>
				
				<sec:authorize access="authenticated" var="authenticated" />
				<c:choose>
					<c:when test="${authenticated }">
					<sec:authorize access='hasRole("ROLE_CUSTOMER")'>
						<li class="w3-bar-item">Welcome <sec:authentication
									property="name" /> 
						</li>
					</sec:authorize>
					<sec:authorize access='hasRole("ROLE_FARMER")'>
					 		<li class="w3-bar-item">Welcome farmer <sec:authentication
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

				<sec:authorize access='hasRole("ROLE_CUSTOMER")'>
				 <li class="w3-bar-item w3-right"><a href='<spring:url value="/user/update" />'>Personal Information</a></li>
				 <!--  <li class="w3-bar-item"><a href='<spring:url value="/flower/customer/find" />'>Flowers</a></li>-->
					<li class="w3-bar-item w3-right"><a href='<spring:url value="/flower/customer/yourorders"/>'>Your Order</a></li>
					<li class="w3-bar-item w3-right "><i
						class="fa fa-shopping-cart "
						style="font-size: 25px; margin-right: 5px;"></i><a
						href='<spring:url value="/flower/customer/cart"/>'>${cartsize} Cart</a></li>

				</sec:authorize>
					<sec:authorize access='hasRole("ROLE_FARMER")'>
					<li class="w3-bar-item"><a href='<spring:url value="/flower/customer/yourorders"/>'>Your Order</a></li>
					<li class="w3-bar-item w3-right ">${cartsize }<i
						class="fa fa-shopping-cart "
						style="font-size: 25px; margin-right: 5px;"></i><a
						href='<spring:url value="/flower/customer/cart"/>'>Cart</a></li>
				 <div class="w3-dropdown-hover">
					  <button class="w3-button">Help</button>
					  <div class="w3-dropdown-content w3-bar-block w3-border">
					  <a href='<spring:url value="/user/guide" />'class="w3-bar-item w3-button">Help Contents</a>
					  <a href='<spring:url value="/user/aboutus" />' class="w3-bar-item w3-button">About Us</a>
					 </div>
					 </div>

				</sec:authorize>

				

				<sec:authorize access='hasRole("ROLE_FARMER")'>
					<li class="w3-bar-item w3-right"><a href='<spring:url value="/user/update" />'>Personal Information</a></li>
					<div class="w3-dropdown-hover w3-right">
					  <button class="w3-button">Farmers Dashboard</button>
					  <div class="w3-dropdown-content w3-bar-block w3-border">
					  <a href='<spring:url value="/flower/farmer/products" />'class="w3-bar-item w3-button">Products List</a>
					  <a href='<spring:url value="/flower/farmer/add" />' class="w3-bar-item w3-button">Create Product</a>
					 </div>
					 </div>
				</sec:authorize>
			</ul>

		</div>
	</div>
<body>
			