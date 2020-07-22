<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="/includes/header.jsp"></jsp:include>
<div class="row">

	<div class="w3-container text-center w3-text-blue">
		<h2>Update delivery information</h2>
	</div>
	<nav class="navbar navbar-default">
		<ul class="w3-bar text-center">
			<li class="w3-bar-item">${userdetail.firstName }</li>
			<li class="w3-bar-item">${userdetail.lastName }</li>
			<li class="w3-bar-item">${userdetail.email }</li>
			<li class="w3-bar-item">${userdetail.address }</li>
			<li class="w3-bar-item">${userdetail.phoneNumber }</li>
		</ul>

	</nav>
</div>
<div>

	<div class="row">
	<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<form role="form" action='<spring:url value="/user/update" />'
				method="POST">
				<div class="form-group">
					<label for="email">Email address:</label> <input type="email"
						class="form-control" id="email" name="email"
						value="${userdetail.email }">
				</div>
				<div class="form-group">
					<label for="pwd">Address Location:</label> <input type="text"
						class="form-control" id="pwd" name="address"
						value="${userdetail.address }">
				</div>
				<div class="form-group">
					<label>Phone Number</label> <input type="text" name="phone"
						class="form-control" value="${userdetail.phoneNumber }">
				</div>
				<button type="submit" class="w3-button w3-green w3-right">Submit</button>
			</form>



		</div>
	</div>

	<sec:csrfInput />
</div>
<br>
<br>
<jsp:include page="/includes/footer.jsp"></jsp:include>
</body>
</html>