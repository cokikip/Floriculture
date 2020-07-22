<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/includes/admin.jsp"></jsp:include>
   
   <div class="container">
   	<h3 class="text-center"></h3>
   </div>
   
<div class="container">
  <h2>Farmers Request</h2>           
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Farmers license</th>
        <th>Farmers Names</th>
        <th>Email</th>
        <th>Address</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${farmers}" var="farmer">
    <c:if test="${farmer.confirmed==0 }">
      <tr>
        <td><img src="data:image/jpg;base64,${farmer.base64image}"  alt="${farmer.farmersName }" width=250px; height=250px /></td>
        <td>${farmer.farmersName }</td>
        <td>${farmer.email }</td>
        <td>${farmer.address }</td>
        <td><a href='<spring:url value="/admin/confirmsave/${farmer.userId }"/>'>confirm</a></td>
      </tr>
      </c:if>
     </c:forEach>
    </tbody>
  </table>
</div>
 <footer class="footer">
        <jsp:include page="/includes/footer.jsp"></jsp:include>
     </footer> 
  </body>
</html>