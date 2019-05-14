package pnp.admin_crud.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
@Entity
@Table(name="products")
public class Product {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="prod_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int prodId;
	
	@Column(name="category")
	private String productCategory;
	
	@Column(name="prod_name")
	private String prodName;
	
	@Transient
	private MultipartFile prodImage;
	
	@Column(name="description")
	private String description;
	
	@Column(name="price")
	private double price;
	
	private int quantity;
	
	@Column(name="availability")
	private boolean availability;

	public Product() {
		super();
	}

	public Product(int prodId, String prodName, String description, double price, int quantity) {
		super();
		this.prodId = prodId;
		this.prodName = prodName;
		this.description = description;
		this.price = price;
		this.quantity = quantity;
	}

	public int getProdId() {
		return prodId;
	}

	public void setProdId(int prodId) {
		this.prodId = prodId;
	}

	
	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public MultipartFile getProdImage() {
		return prodImage;
	}

	public void setProdImage(MultipartFile prodImage) {
		this.prodImage = prodImage;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public boolean isAvailability() {
		return availability;
	}

	public void setAvailability(boolean availability) {
		this.availability = availability;
	}

}
