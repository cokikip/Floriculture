<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/includes/admin.jsp"></jsp:include>
<button id="btn">Print</button>
   <br><br>
    <div class="form-search " style="width: 300px;">
         	 <input type="text" id="search" class="form-control w3-right input-sm" placeholder="Enter the flower name..." >
    
        </div>
   <div class="container">
   	<h3 class="text-center">Farmers</h3>
   	<table class="w3-table w3-border w3-striped" id="table">
<tr>
  <th>Farmers Name</th>
  <th>Email</th>
  <th>Flowers Company</th>
  <th>Address Location</th>
  <th>Phone Number</th>
  
</tr>
<c:forEach items="${farmerslist }" var="farmers">
<tr class="box">
  <td>${farmers.firstName} &nbsp  ${farmers.lastName }</td>
  <td>${farmers.email }</td>
  <td>${farmers.company}</td>
  <td>${farmers.address }</td>
  <td>${farmers.phoneNumber }</td>
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
<script type="text/javascript">
$(document).ready(function(){
	  $("#search").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $(".box").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
</script>


 <footer class="footer">
        <jsp:include page="/includes/footer.jsp"></jsp:include>
     </footer> 
  
  </body>
</html>