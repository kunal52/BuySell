package Reusability.models;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Pictures {

	int id;
	int product_id;
	ArrayList<String>arraylist;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public ArrayList<String> getArraylist() {
		return arraylist;
	}
	public void setArraylist(ArrayList<String> arraylist) {
		this.arraylist = arraylist;
	}
	
	

}
