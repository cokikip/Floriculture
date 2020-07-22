<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/includes/header.jsp"></jsp:include>
<div class="container logopad">
    <div class="col-sm-2">
    <form action="">
    <label>Sort by Price</label>
     <div class="radio">
  		<label><input type="radio" name="price">Low to High</label>
	</div>
	<div class="radio">
		<label><input type="radio" name="price">High to low</label>
	</div>
    </form>

    </div>
    
    <div class="container">
        <div class="col-sm-8">
        <div class="row">
        
        <c:forEach items="${page.content}" var="flowers" >
             <c:if test="${flowers.quantity==0}">
            <div class="col-sm-3 logopad">
            <img src="data:image/jpg;base64,${flowers.base64image}" class="img media-object" alt="${flowers.name }"/>
            <h1 class="">${flowers.name }</h1>
            <p>Price <span>${flowers.price }</span></p>
			<a class="w3-btn w3-middle text-center" style="text-decoration: line-through;">Sold Out</a>
            </div>
            
            </c:if>
            <c:if test="${flowers.quantity>0}">
            <div class="col-sm-3 logopad">
            <img src="data:image/jpg;base64,${flowers.base64image}" class="img media-object" alt="${flowers.name }"/>
            <h1 class="">${flowers.name }</h1>
            <p>Price <span>${flowers.price }</span></p>
			<a class="w3-green w3-btn w3-middle text-center" href='<spring:url value="/flower/customer/${flowers.flowerId}"/>'>Buy</a>
            </div>
            </c:if>
            </c:forEach>
      
        </div>
         <div class="text-center">
         <a href='<spring:url value="/?page=${page.number-1}"/>'>Previous page</a>
         <a href='<spring:url value="/?page=${page.number+1 }"/>'>Next page</a>
         </div>
       
    </div>
</div>
    </div>
   <jsp:include page="/includes/footer.jsp"></jsp:include>
   </body>
</html>