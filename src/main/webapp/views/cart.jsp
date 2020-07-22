<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="/includes/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<meta charset="UTF-8">
<meta name="description" content="Free Web tutorials">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<div class="row">
	<div class="col-sm-3"></div>
	<div class="col-sm-6">
		<br> <a href='<spring:url value="/" />' class="btn btn-primary"> <i class="fa fa-chevron-circle-left"></i> Continue
			buying</a>
		<form action='<spring:url value="/flower/customer/updatec"/>' method="post">
			<table class="w3-table">
				<tr>
					<th>Name</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Sub-total</th>
				</tr>
				<c:if test="cart.isEmpty()">
					<h2>your cart is empty</h2>
				</c:if>

				<c:forEach items="${cart}" var="cart">
				<c:set var="s" value="${s + cart.flower.price*cart.itemquantity  }"/>


					<tr>
						<td>${cart.flower.name }</td>
						<td>${cart.flower.price }</td> 
						<td>${cart.itemquantity}</td>
						<td>Ksh. ${cart.flower.price*cart.itemquantity }</td>
						<td><a class="w3-button w3-red" href='<spring:url value="/flower/customer/clear/${cart.flower.flowerId}"/>'>Remove</a></td>

						<td></td>
					</tr>

				</c:forEach>
				<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>Ksh. ${s }</td>
				</table>
		</form>

		<a href='<spring:url value="/flower/customer/order"/>'
			class="w3-button w3-green w3-right">Check out <i class="fa fa-chevron-circle-right"></i></a>

	</div>
	<div class="col-sm-3"></div>
</div>
<footer class="footer">
	<jsp:include page="/includes/footer.jsp"></jsp:include>
</footer>
</body>
</html>

