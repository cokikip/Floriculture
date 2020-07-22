<jsp:include page="/includes/header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8">
<meta name="description" content="Free Web tutorials">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<div class="row container">
<ul class="w3-ul">

	<li class="w3-bar">
    <div class="w3-bar-item">
      <a class="w3-large" href='<spring:url value="/user/about/register"/>'>How to register and login?</a><br>
    </div>
  </li>
  <li class="w3-bar">
    <div class="w3-bar-item">
      <a class="w3-large" href='<spring:url value="/user/about/item"/>'>How to Purchase an item?</a><br>
    </div>
  </li>
  <li class="w3-bar">
    <div class="w3-bar-item">
      <a class="w3-large" href='<spring:url value="/user/about/update"/>'>How to Update products?</a><br>
    </div>
  </li>
  </ul>
</div>
<footer class="footer">
	<jsp:include page="/includes/footer.jsp"></jsp:include>
</footer>
</body>
</html>

