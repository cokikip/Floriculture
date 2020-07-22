<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/includes/header.jsp"></jsp:include>
<div class="container">
<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-6">
	<spring:url value="/flower/farmer/update/${command.flowerId }" var="add" />
	     <h1>Update flower</h1>  
       <form:form method="POST" action="${add}" enctype="multipart/form-data">    
        <table class="form-group">    
        <tr>  
        <td></td>    
         <td><form:hidden  path="flowerId" /></td>  
         </tr>   
         <tr>    
          <td>Name  </td>   
          <td><form:input path="name"  class="form-control"/></td>  
         </tr>    
         <tr>    
          <td>Quantity </td>    
          <td><form:input path="quantity" class="form-control"/></td>  
         </tr>   
         <tr>    
          <td>description </td>    
          <td><form:input path="description" class="form-control"/></td>  
         </tr>
         <tr>    
          <td>price </td>    
          <td><form:input path="price" class="form-control"/></td>  
         </tr>
         <tr> 
          <td><label class="w3-label">Image</label> </td>
          <td><form:input path="file"  type="file"/></td>
          <td><img src="data:image/jpg;base64,${command.base64image}" class="img1 media-object" alt="${flowers.name }"/></td>
         </tr>   
           
         <tr>    
          <td></td>    
          <td><input type="submit" value="Save Updates" /></td>    
         </tr>    
        </table>    
       </form:form>    
       </div>
       </div>
</div>
<br>
<br>

<footer class="footer">
		<jsp:include page="/includes/footer.jsp"></jsp:include>
</footer>
</body>
</html>