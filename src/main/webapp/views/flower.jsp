<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 <jsp:include page="/includes/header.jsp"></jsp:include>
 <div class="container logopad">
        <div class="col-sm-2">
    
        </div>
        <div class="col-sm-8">
         <div >
        <div class="col-sm-6">
        	<img src="data:image/jpg;base64,${flower.base64image}"  alt="${flower.name }" width=300px; height=300px/>
        	
        </div>
        <div class="col-sm-6">
        <form action="<spring:url value='/flower/customer/buy/${flower.flowerId}'/>" method="post">
        <h1 class="text-center">${flower.company }</h1>
        <h2>${flower.name}</h2>
		         <p >${flower.description}</p>
		         <label>Maximum Quantity: </label><span>${flower.quantity}</span>
		         <br>
               <label>Price:</label><span>Ksh. ${flower.price}</span>
               <br>
               <label class="w3-label w3-left">Quantity: </label>
               <input min="1" class="input-sm form-control" type="number" value="1" max="${flower.quantity }" name="itemquantity"> 
               <br>
               <button class="btn btn-sucess w3-large w3-green w3-right" type="submit">Add to Cart</button>  
        </form>
        </div>
                
            
               </div>
           </div>
           </div>
       
    <footer class="footer">
		<jsp:include page="/includes/footer.jsp"></jsp:include>
   </footer>
</body>
</html>