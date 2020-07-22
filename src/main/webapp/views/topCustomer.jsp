<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/includes/admin.jsp"></jsp:include>
<br><br>
<button id="btn">Print</button>
	  		<div class="container">
	  	<table class="w3-table w3-bordered w3-striped w3-border" id="table">
		<tr>
		  <th>Customers Name</th>
		  <th>Address Location</th>
		  <th>Shopping Times</th>
		</tr>
		  <c:forEach items="${customer}" var="customer" >
		<tr>
		  <td>${customer.firstName} &nbsp  ${customer.lastName }</td>
		  <td>${customer.address }</td>
		  <td>${customer.shoppingTimes }</td>
		</tr>
		</c:forEach>
			</table>
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
	   
<footer class="footer">
<jsp:include page="/includes/footer.jsp"></jsp:include>
</footer>
</body>
</html>