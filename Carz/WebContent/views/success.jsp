<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container">
WELCOME
${name}
[${role}]
<br/>
<br/>
<sec:authorize access="hasRole('ROLE_ADMIN')">
 <br/>
<div class="row">
	<div class="col-sm-2">
	<table class="table table-bordered table-condensed" width="30px">
	<thead>
		<th>Users</th>
	</thead>
	<tbody>
		<html:forEach items="${allUsers}" var="sta" varStatus="status">
		<tr>
			<td>
				<p><html:out value="${sta.getFirstname()}"/></p>
			</td>
		</tr>
		</html:forEach>
	</tbody>
</table>
	</div>
</div>
</sec:authorize>
<br/>
<br/>


<html:url value="/logout" var="logoutUrl" />

	<!-- csrt for log out-->
	<form action="${logoutUrl}" method="post">
	  <input type="hidden"
		name="${_csrf.parameterName}"
		value="${_csrf.token}" />
		
		<input class="btn btn-success" type="submit" value="logout" />
	</form>
</div>
</body>
</html>