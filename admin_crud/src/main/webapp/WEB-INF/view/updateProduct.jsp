<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Product</title>
</head>
<body>
	<div class="container" style="margin-bottom: 19px">
		<h1 class="well">Update Product !</h1>
		<div class="col-lg-12 well">
			<div class="row">

				<!--  RegisterServlet  form -->
				<c:url value="/admin/product/updateProduct" var="url"></c:url>
				<form:form method="post" action="${url}"
					commandName="updateProductObj">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<form:label path="prodId">Product Id</form:label>
								<form:input type="text" placeholder="Enter ProductId.."
									class="form-control" path="prodId" disabled="true"></form:input>
							</div>
							<div class="col-sm-6 form-group">
								<form:label path="prodName">Product Name</form:label>
								<form:input type="text" placeholder="Enter Product Name.."
									class="form-control" path="prodName"></form:input>
							</div>
						</div>
						<div class="form-group">
							<form:label path="description">Product Description</form:label>
							<form:textarea type="text" placeholder="Enter First Name.."
								class="form-control" path="prodId"></form:textarea>
						</div>
						<div class="form-group">
							<form:label path="category">Product Category</form:label>
							<form:radiobutton path="category" value="FRESH FOOD"/>
							FRESH FOOD
							<form:radiobutton path="category" value="FOOD CUPBOARD"/>
							FOOD CUPBOARD
							<form:radiobutton path="category" value="FROZEN FOOD"/>
							FROZEN FOOD
							<form:radiobutton path="category" value="CONVENIENCE MEALS"/>
							CONVENIENCE MEALS
						</div>
						<div class="row">
							<div class="col-sm-4 form-group">
								<form:label path="price">Product Price</form:label>
								<form:input type="text" placeholder="Enter Product Price.."
									class="form-control" path="price"></form:input>
							</div>
							<div class="col-sm-4 form-group">
								<form:label path="quantity">Number of Products</form:label>
								<form:input type="text" placeholder="Number of Products.."
									class="form-control" path="quantity"></form:input>
							</div>
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-lg btn-info">Update</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>