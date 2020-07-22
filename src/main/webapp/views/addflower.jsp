<jsp:include page="/includes/header.jsp"></jsp:include>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="container">

	<spring:url value="/flower/farmer/add" var="add" />
	<form action="${add}" method="POST" class="w3-container" id="addform"
		enctype="multipart/form-data">
		<div class="w3-container text-center w3-text-blue">
			<h2>Add a Flower</h2>
		</div>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="col-md-6">

					<label class="w3-label">Name</label> <input name="name" id="name"
						class="w3-input" type="text" required> <br> <label
						class="w3-label">Quantity</label> <input name="quantity"
						id="quantity" class="w3-input" type="number" required min="0">
					<br> <label class="w3-label">Description</label>
					<textarea name="description" id="description" rows="4" cols="3"
						class="w3-input" required></textarea>
					<br>

				</div>
				<div class="col-md-6">
					<label class="w3-label">Price</label> <input name="price"
						type="number" id="price" class="form-control" required min="0">
					<br> <label class="w3-label">Image</label> <input name="file"
						id="file" class="w3-input" type="file" width="25" required>
					<!--  <button class="btn btn-primary">Upload</button>-->
					<br>
					<div class="form-group"></div>
				</div>

			</div>
			<div class="col-sm-1"></div>
		</div>

		<button class="btn btn-success w3-large w3-right" onclick="valid()">Save
			product</button>

	</form>


</div>
<br>
<br>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/additional-methods.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
<jsp:include page="/includes/footer.jsp"></jsp:include>