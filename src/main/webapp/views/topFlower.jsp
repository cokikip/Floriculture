<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 <jsp:include page="/includes/admin.jsp"></jsp:include>
 
 <br><br>
  
 <button id="btn">Print</button>
	  		<div class="container">
	  	<table class="w3-table w3-bordered w3-striped w3-border" id="table">
		<tr>
		  <th>Flower name</th>
		  <th>Type of flower</th>
		  <th>Bought times</th>
		  <th>Company </th>
		  <th>Company Owner Username</th>
		</tr>
		  <c:forEach items="${topflowers}" var="flower" >
		<tr>
		  <td>${flower.name }</td>
		  <td>${flower.type }</td>
		  <td>${flower.boughtTimes }</td>
		  <td>${flower.company }</td>
		  <td>${flower.farmersName }</td>
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