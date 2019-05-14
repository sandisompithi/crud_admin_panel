package pnp.admin_crud.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import pnp.admin_crud.model.Product;
import pnp.admin_crud.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	// Configuration for MultiPartResolver
	// Multipart resolver is for uploading images and other media
	// maxupload size is for image size should not be maximum than 10240000
	
	@Bean
	public MultipartResolver multipartResolver(){
	
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		
		multipartResolver.setMaxUploadSize(10240000);
		
		return multipartResolver;
		
	}
	
	// Display the list of of products to productList page
	@RequestMapping("/getAllProducts")
	public ModelAndView getAllProducts(){
		
		List<Product> products = productService.getAllProducts();
		
		ModelAndView mv = new ModelAndView("productList");
		
		mv.addObject("products", products);
		
		return mv;
		
	}
	
	// Get the product by productId
	@RequestMapping("getProductById/{productId}")
	public ModelAndView getProductById(@PathVariable(value="productId") String productId){
		
		Product product = productService.getProductById(productId);
		
		ModelAndView mv = new ModelAndView("productPage");
		
		mv.addObject("product", product);
		
		return mv;
		
	}
	
	@RequestMapping("/delete/{productId}")
	public String deleteProduct(@PathVariable(value = "productId") String productId){
		
		// The Path class is used to refer the path of the file
		
		Path path = Paths.get("C:/eclipse_apps/admin_crud/src/webapp/WEB-INF/images/products/"
								+ productId + ".jpg");
		
		if (Files.exists(path)){
			
			try {
				
				Files.delete(path);
				
			} catch (IOException ex){
				
				ex.printStackTrace();
				
			}
		}
		
		productService.deleteProduct(productId);
		
		return "redirect:/getAllProducts";
		
	}
	
	@RequestMapping(value = "/product/addProduct", method = RequestMethod.GET)
	public String getProductForm(Model model) {
		Product product = new Product();
		// New Products
		// set the category as 1 for the Items 
		product.setProductCategory("FRESH FOOD");
		model.addAttribute("productFormObj", product);
		return "addProduct";

	}
	
	@RequestMapping(value = "/product/addProduct", method = RequestMethod.POST)
	public String addProduct(@Valid @ModelAttribute(value = "productFormObj") Product product, BindingResult result){
		
		// Binding Result is used if the form that has any error then it will
		// redirect to the same page without performing any functions
		
		if (result.hasErrors())
			return "addProduct";
		
		productService.addProduct(product);
		
		MultipartFile image = product.getProdImage();
		
		if (image != null && !image.isEmpty()){
			
			Path path = Paths.get("C:/eclipse_apps/admin_crud/src/webapp/WEB-INF/images/products/"
					+ product.getProdId() + ".jpg");
			
			try {
				
				image.transferTo(new File(path.toString()));
				
			} catch (IOException ex){
				
				ex.printStackTrace();
			}
			
		}
		
		return "redirect:/getAllProducts";
		
	}
	
	@RequestMapping(value = "/product/updateProduct/{productId}")
	public ModelAndView getUpdateForm(@PathVariable(value = "productId") String productId){
	
		Product product = productService.getProductById(productId);
		
		ModelAndView mv = new ModelAndView("updateProduct");
		
		mv.addObject("updateProductObj", product);
		
		return mv;
		
	}
	
	@RequestMapping(value = "/product/updateProduct", method = RequestMethod.POST)
	public String updateProduct(@ModelAttribute(value = "updateProductObj") Product product){
		
		productService.updateProduct(product);
		
		return "redirect:/getAllProducts";
		
	}
	
	@RequestMapping("/getProductsList")
	public @ResponseBody List<Product> getProductsListInJson(){
		
		return productService.getAllProducts();
		
	}
	
}
