package pnp.admin_crud.dao;

import java.util.List;

import pnp.admin_crud.model.Product;

public interface ProductDao {

	List<Product> getAllProducts();

	Product getProductById(String productId);

	void addProduct(Product product);
	
	void updateProduct(Product product);

	void deleteProduct(String productId);
}
