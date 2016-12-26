<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form method="post" action="/app/reg">
<table>
	<tr>
	<td>FirstName:</td>
	</tr>
	<tr>
	<td><input type="text" name="firstname" /></td>
	</tr>
	<tr>
	<td>LastName:</td>
	</tr>
	<tr>
	<td><input type="text" name="lastname" /></td>
	</tr>
	<tr>
	<td>Enter Email:</td>
	</tr>
	<tr>
	<td><input type="text" name="email" /></td>
	</tr>
<tr>
<td>Enter Password:</td>
</tr>
<tr>
<td><input type="password" name="password"/></td>
</tr>
<tr>
<td><input type="submit" value="Submit" /></td>
</tr>

</table>
<input type="hidden"
    name="${_csrf.parameterName}"
    value="${_csrf.token}"/>
</form>