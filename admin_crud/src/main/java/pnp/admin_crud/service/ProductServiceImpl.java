package pnp.admin_crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pnp.admin_crud.dao.ProductDao;
import pnp.admin_crud.model.Product;

@Service(value="productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	
	public ProductDao getProductDao() { return productDao;}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Transactional
	public List<Product> getAllProducts() {
		
		return productDao.getAllProducts();
		
	}

	public Product getProductById(String productId) {
		
		return productDao.getProductById(productId);
		
	}

	public void addProduct(Product product) {
		
		productDao.addProduct(product);

	}

	public void updateProduct(Product product) {
		
		productDao.updateProduct(product);

	}

	public void deleteProduct(String productId) {
		
		productDao.deleteProduct(productId);

	}

}
