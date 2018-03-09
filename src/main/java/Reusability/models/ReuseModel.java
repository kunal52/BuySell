package Reusability.models;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class ReuseModel {

	
	String id;
	String product_name;
	String product_description;
	String customer_id;
	String customer_name;
	String customer_email;
	String customer_phone;
	String product_adress;
	String isSolve;
	

	public ReuseModel() {
		
	}

	public ReuseModel(String id, String product_name, String product_description, String customer_id,
			String customer_name, String customer_email, String customer_phone, String product_adress,String isSolve) {
		super();
		this.id = id;
		this.product_name = product_name;
		this.product_description = product_description;
		this.customer_id = customer_id;
		this.customer_name = customer_name;
		this.customer_email = customer_email;
		this.customer_phone = customer_phone;
		this.product_adress = product_adress;
		this.isSolve=isSolve;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	public String getProduct_adress() {
		return product_adress;
	}
	public void setProduct_adress(String product_adress) {
		this.product_adress = product_adress;
	}
	public String getIsSolve() {
		return isSolve;
	}


	public void setIsSolve(String isSolve) {
		this.isSolve = isSolve;
	}

	
}
