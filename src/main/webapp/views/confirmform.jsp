<jsp:include page="/includes/header.jsp"></jsp:include>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 

    <div class="container">
    <nav class="navbar navbar-default">
  
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">${user.firstname }</a></li>
      <li><a href="#">${user.lastname }</a></li>
      <li><a href="#">${user.email }</a></li> 
      <li><a href="#" class="text-center">lo</a></li> 
    </ul>
  </nav>
   
    	<spring:url value="/user/save" var="add"/>
            <form action="${add}" method="POST" id="addform" enctype="multipart/form-data">
                <div class="w3-container text-center w3-text-blue"><h2>Add a license</h2></div>
		<div class="row">
				<div class="col-sm-3">
			 
				</div>
				<div class="col-sm-6">
					<input name="file" id="file" class="form-control" type="file" width="25" required>
					<label>Company Name:</label>
					<input name="company" id="company" class="form-control" type="text" required>
				</div>
				<div class="col-sm-3">
					<button class="btn btn-success">Save</button>
				</div>
		</div>
		</form>
        </div>
        <footer class="footer">
		<jsp:include page="/includes/footer.jsp"></jsp:include>
</footer>
</body>
</html>

        