<jsp:include page="/includes/admin.jsp"></jsp:include>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-6">
 <table class="w3-table">
  <tr>
    <th>Name</th>
    <th>Quantity</th>
    <th>Price</th>
  </tr>
  <tbody>
  <c:forEach items="${order}" var="flowers">
  <tr>
    <td>${flowers.flowerName }</td>
    <td>${flowers.itemquantity }</td>
    <td>${flowers.subprice }</td>
  </tr>
  </c:forEach>
  </tbody>
</table>
		<a href='<spring:url value="/admin/list"/>' class="w3-bar-item w3-button w3-blue"> <i class="<i class="fa fa-chevron-circle-right"></i>"></i> Go Back</a>
		<a href='<spring:url value="/admin/deliver/${orderlist.orderNumber }"/>' class="w3-bar-item w3-button w3-right w3-green">Confirm Delivery</a>
</div>
</div>
<footer class="footer">
	<jsp:include page="/includes/footer.jsp"></jsp:include>
</footer>
</body>
</html>