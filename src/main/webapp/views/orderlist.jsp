<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/includes/admin.jsp"></jsp:include>
<br>
<div class="form-search text-center" style="width: 300px;">
         	 <input type="text" id="search" class="form-control w3-right input-sm" placeholder="Enter the flower name..." >
        </div>
        <div class="row">
            <div class="col-sm-2"> </div>
        <div class="col-sm-8">
               <table class="w3-table stripped">
		            <tr>
		                <th>Customer name</th>
		                <th>Email</th>
		                <th>Address</th>
		                <th>Amount</th>
		                <th>Order Date</th>
		            </tr>
           
               
                <c:forEach items="${orders}" var="orders">
                  <tr class="box">   
	                <td>${orders.customerName}</td>
	                <td>${orders.email}</td>
	                <td>${orders.address}</td>
	                <td>${orders.amount}</td>
	                <td>${orders.orderDate}</td>
	                <td class="btn btn-primary" ><a href='<spring:url value="/admin/view/${orders.orderNumber}"/>'>
	                <c:if test="${orders.confirmed==0 }">View</c:if></a>
	                <c:if test="${orders.confirmed==1 }">Already Confirmed</c:if>
	                </td>
                </tr> 
                </c:forEach> 
            
        </table>
            </div>
            <div class="col-sm-2">  
            </div>
               </div>
    
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