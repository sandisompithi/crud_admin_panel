<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Management</title>
</head>
<body>
	<div style="width: 1145px; margin-bottom: 180px;">
		<h2>Admin Product Management</h2>
		<p>The List of Products in our Database</p>
		<table id="productList">
			<thead>
				<tr>
					<th>Product Image</th>
					<th>Product Id</th>
					<th>Category</th>
					<th>Product Name</th>
					<th>Description</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>/Update/Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${products}" var="prod">
					<tr>
						<td style="width: 171px"><img
							src="<c:url value="/resource/images/products/${prod.prodId}.jpg"/>"
							style="width: 100px; height: 90px;" ${prod.prodName}"  /></td>
						<td>${prod.prodId}</td>
						<td>${prod.category}</td>
						<td>${prod.prodName}</td>
						<td>${prod.price}</td>
						<td>${prod.unitStock}</td>
						<td style="width: 180px">${prod.description}</td>
						<td>
							<a href="product/updateProduct/${prod.prodId}" style="margin-left: 5px"> <span></span></a>
							<a href="delete/${prod.prodId}" style="margin-left: 5px"> <span></span></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<ul>
			<li><a href=" <c:url value="/product/addProduct" />">Add Product</a></li>
		</ul>
	</div>
</body>
</html>