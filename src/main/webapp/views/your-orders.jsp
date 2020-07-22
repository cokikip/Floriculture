<jsp:include page="/includes/header.jsp"></jsp:include>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <div class="container">
 <table class="w3-table">
  <tr>
    <th>Customer Name</th>
    <th>Email</th>
    <th>Delivery Address</th>
    <th>Amount</th>
    <th>Order Date</th>
  </tr>
  <tbody>
  <c:forEach items="${customer}" var="orders">
  <tr>
     <tr>   
          <td>${orders.customerName}</td>
          <td>${orders.email}</td>
          <td>${orders.address}</td>
          <td>${orders.amount}</td>
          <td>${orders.orderDate}</td>
    <c:if test="${orders.confirmed ==0}">
     	<td>Order not confirmed</td>
    </c:if>
     <c:if test="${orders.confirmed ==1}">
    	 <td>Order is confirmed for delivery</td>
    </c:if>
    
  </tr>
  </c:forEach>
  </tbody>
</table>
</div>
<footer class="footer">
	<jsp:include page="/includes/footer.jsp"></jsp:include>
</footer>
</body>
</html>