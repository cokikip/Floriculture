<jsp:include page="/includes/header.jsp"></jsp:include>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link
	rel="https://cdn.datatables.net/select/1.3.0/css/select.dataTables.min.css">
<script
	src="https://cdn.datatables.net/select/1.3.0/js/dataTables.select.min.js"></script>
<div class="alert alert-block alert-success messages status">
	<span onclick="this.parentElement.style.display='none'" 
    class="w3-bar-item w3-button w3-white w3-xlarge w3-right">&times;</span>You have successful added a product</div>
<button id="btn">Print</button>
<div class="row">

	<div class="col-sm-3"></div>

	<div class="col-sm-6">
		<table class="w3-table" id="table" >
			<tr>
				<th>Photo</th>
				<th>Name</th>
				<th>Quantity</th>
				<th>Price</th>
				<th>Quantity Sold</th>

			</tr>
			<tbody>
				<c:forEach items="${flowerlist}" var="flowers">
					<c:if test="${flowers.deleted==0 }">
						<tr>
							<td><img src="data:image/jpg;base64,${flowers.base64image}"
								class="img1 media-object" alt="${flowers.name }" /></td>
							<td>${flowers.name }<br></td>
							<td>${flowers.quantity }</td>
							<td>${flowers.price }</td>
							<td>${flowers.sold }</td>
							<td><a class="w3-btn w3-green"
								href='<spring:url value="/flower/update/${flowers.flowerId}"/>'>Update</a></td>
							<td><a class="w3-btn w3-red"
								href='<spring:url value="delete?id=${flowers.flowerId }"></spring:url>'><span
									class="glyphicon glyphicon-remove"></span></a></td>

						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>

	</div>
</div>
<script>
	$('#btn').click(function(){
		var printme=document.getElementById('table');
		var mem = window.open("","","width=900,height=700");
		mem.document.write(printme.outerHTML);
		mem.document.close();
		mem.focus();
		mem.print();
		mem.close();
		
	})
</script>

<footer >
	<jsp:include page="/includes/footer.jsp"></jsp:include>
</footer>
	<script type="text/javascript"  src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript"  src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

</body>
</html>