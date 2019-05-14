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
				<c:url value="/product/addProduct" var="url"></c:url>
				<form:form method="post" action="${url}" commandName="productFormObj" enctype="multipart/form-data">
					<form:label path="prodId">Product Id</form:label>
					<form:input type="text" placeholder="Enter ProductID" path="prodId"></form:input>				
				</form:form>
			</div>
			<div>
				<form:label path="category">Product Category</form:label>
				<form:radiobutton path="category" value="FRESH FOOD"/>FRESH FOOD
				<form:radiobutton path="category" value="FOOD CUPBOARD"/>FOOD CUPBOARD
				<form:radiobutton path="category" value="FROZEN FOOD"/>FROZEN FOOD
				<form:radiobutton path="category" value="CONVENIENCE MEALS"/>CONVENIENCE MEALS
			</div>
			<div>
				<form:label path="prodName">Product Name</form:label>
				<form:input type="text" placeholder="Enter Product Name.." path="prodName"></form:input>
				<form:errors path="prodName"></form:errors>
			</div>
		</div>
		<div>
			<form:label path="description">Product Description</form:label>
			<form:textarea type="text" placeholder="Enter Product Description.." path="description"></form:textarea>
		</div>
		<div>
			<div>
				<form:label path="price">Product Price</form:label>
					<form:input type="text" placeholder="Enter Product Price.." path="price"></form:input>
					<form:errors path="price"></form:errors>
			</div>
			<div>
				<form:label path="quantity">Quantity</form:label>
				<form:input type="text" placeholder="Number of Products.." path="quantity"></form:input>
			</div>
		</div>
		<div>
			<form:label path="prodImage">Product Image</form:label>
			<form:input type="file" path="prodImage"/>
		</div>  
		<div>
			<button type="submit">Submit</button>
		</div>
	</div>
</body>
</html>