<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 <jsp:include page="/includes/header.jsp"></jsp:include>
  <div class="container">
            <form action='<spring:url value="/login"/>' method="post">
                
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                <div class="w3-mobile"> 
                        <div class="w3-text-blue text-center"><h2>Login to purchase</h2></div>     

                        <label class="w3-label">User name</label>
                        <input class="w3-input" type="text" name="username">

                        <label class="w3-label">Password</label>
                        <input class="w3-input" type="password" name="password">
                        <br>
                       <sec:csrfInput/>
                          <c:if test="${param.logout !=null }">
                       		<p class="alert alert-success">You have logged out successfully</p>
                          </c:if>
                       <c:if test="${param.error !=null }">
                       		<p class="alert alert-danger">Invalid username or password</p>
                       </c:if>

                        <button class="btn btn-success w3-large w3-right w3-small">Login</button>

                    </div>
                </div>
             </form>

        </div>
       <footer class="footer">
        <jsp:include page="/includes/footer.jsp"></jsp:include>
       </footer>
       
        </body>
		</html>