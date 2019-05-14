<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product</title>
</head>
<body>
	<div style="margin-bottom:19px">
		<h1>Add Product !</h1>
		<div>
			<div>
				<c:url value="/addProduct" var="url"></c:url>
				<form:form method="post" action="${url}" commandName="productFormObj" enctype="multipart/form-data">
					<form:label path="prodId">Product Id</form:label>
					<form:input type="text" placeholder="Enter ProductID" path="prodId"></form:input>				
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>