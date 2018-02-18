package Reusability.models;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Item {

	
	String id;
	String name;
	String description;
	String type;
	boolean isNew;  //Condition
	String issue;   //None if no issue
	String location;
	String contact_id;
	float price;
	String isVerified;
	
	
	
	
	
	public Item() {
		
		
		
	}


	public Item(String id, String name, String description, String type, boolean isNew, String issue, String location,
			String contact_id, float price, String isVerified) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.type = type;
		this.isNew = isNew;
		this.issue = issue;
		this.location = location;
		this.contact_id = contact_id;
		this.price = price;
		this.isVerified = isVerified;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}





	public String getName() {
		return name;
	}





	public void setName(String name) {
		this.name = name;
	}





	public String getDescription() {
		return description;
	}





	public void setDescription(String description) {
		this.description = description;
	}





	public String getType() {
		return type;
	}





	public void setType(String type) {
		this.type = type;
	}





	public boolean isNew() {
		return isNew;
	}





	public void setNew(boolean isNew) {
		this.isNew = isNew;
	}





	public String getIssue() {
		return issue;
	}





	public void setIssue(String issue) {
		this.issue = issue;
	}





	public String getLocation() {
		return location;
	}





	public void setLocation(String location) {
		this.location = location;
	}





	public String getContact_id() {
		return contact_id;
	}





	public void setContact_id(String contact_id) {
		this.contact_id = contact_id;
	}





	public float getPrice() {
		return price;
	}





	public void setPrice(float price) {
		this.price = price;
	}





	public String getIsVerified() {
		return isVerified;
	}





	public void setIsVerified(String isVerified) {
		this.isVerified = isVerified;
	}





	@Override
	public String toString() {
		return "Item [id=" + id + ", name=" + name + ", description=" + description + ", type=" + type + ", isNew="
				+ isNew + ", issue=" + issue + ", location=" + location + ", contact_id=" + contact_id + ", price="
				+ price + ", isVerified=" + isVerified + "]";
	}
	

	
	
	
	
	
	

	
	
}
