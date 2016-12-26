<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form method="post" action="/app/reg">
<table>
	<tr>
	<td>FirstName:</td>
	</tr>
	<tr>
	<td><input type="text" name="firstname" /><font color="red"><form:errors path="user.firstname"/></font></td>
	</tr>
	<tr>
	<td>LastName:</td>
	</tr>
	<tr>
	<td><input type="text" name="lastname" /><font color="red"><form:errors path="user.lastname"/></font></td>
	</tr>
	<tr>
	<td>Enter Email:</td>
	</tr>
	<tr>
	<td><input type="text" name="email" /><font color="red"><form:errors path="user.email"/></font></td>
	</tr>
<tr>
<td>Enter Password:</td>
</tr>
<tr>
<td><input type="password" name="password" /> <font color="red"><form:errors path="user.password"/></font></td>
</tr>
<tr>
<td><input type="submit" value="Submit" /></td>
</tr>

</table>
<input type="hidden"
    name="${_csrf.parameterName}"
    value="${_csrf.token}"/>
</form>