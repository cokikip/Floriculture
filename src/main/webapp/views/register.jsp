<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/includes/header.jsp"></jsp:include>
<div class="container">
            <form action='<spring:url value="/user/register"/>' method="POST" id="register">
                <div class="w3-container text-center w3-text-blue"><h2>Registration</h2></div>
                <div class="row">
                <div class="col-sm-4">      
                        <label class="w3-label">First Name</label>
                        <input name="firstName" class="w3-input" type="text" pattern="[a-zA-Z]+">
                        <br>
                        <label class="w3-label">Last Name</label>
                        <input name="lastName" class="w3-input" type="text" pattern="[a-zA-Z]+">
                        <br>
                        <label class="w3-label">Password</label>
                        <input name="password" class="w3-input" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                   </div>
                      <div class="col-sm-4">
                       <label class="w3-label">User name</label>
                       <input name="username" class="w3-input" type="text">
                        <br>
                            <label class="w3-label">Address</label>
                            <input name="address" class="w3-input" type="text">
                         <br>
                        <label class="w3-label">Role</label>
                        <select name="role" id="user" class="w3-select w3-border">
                            <option value="customer" selected>customer</option>
                            <option value="farmer">farmer</option>
                        </select>
                                        
                    </div>
                    <div class="col-sm-4">   
                        <label class="w3-label">dob</label>
                        <input name="DOB" class="w3-input" type="date" max="">   
                    
                       <br>
                            <label class="w3-label">Email</label>
                            <input name="email" class="w3-input" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                            
                            <br>
                            <label class="w3-label">Mobile Number</label>
                            <input name="phoneNumber" class="w3-input" type="tel" pattern="^\d{10}$" placeholder="eg. 0705247047">
     
                        </div>
                    </div>
                   
                    <sec:csrfInput/>
            	<br>
                    <button class="btn btn-success w3-large w3-right">Register</button>

                    </form>

                        
                        

        </div>
        <br><br>
        <jsp:include page="/includes/footer.jsp"></jsp:include>
        </body>
		</html>