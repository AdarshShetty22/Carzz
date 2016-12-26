<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="html"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="row">
		<div class="col-md-4">
		<font color="blue"><h3>LOGIN:</h3></font>


<form action="/Carz/authentication" method="post">
	
	<div class="form-group">
		<label>Email:</label>
		<input class="form-control" placeholder="Enter Username" type="text" name="j_username"/>
	</div>
	<div class="form-group">
		<label for="password">Password:</label>
		<input class="form-control" placeholder="Enter Password" type="password" name="j_password"/>
	</div>
	<button class="btn btn-info" type="submit">Login</button>
<input type="hidden"
    name="${_csrf.parameterName}"
    value="${_csrf.token}"/>
</form>
		
		</div>
	</div>


<html:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
      <font color="red">
      	<h5>
      	<html:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
        	Username or Password Incorrect
      	</h5>
      </font>
</html:if>
</body>
</html>