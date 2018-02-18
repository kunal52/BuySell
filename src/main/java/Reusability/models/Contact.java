package Reusability.models;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Contact {
	
	String id;
	String f_name;
	String l_name;
	String email;
	String location;
	String ph;
	String other;
	
	public Contact() {
	
	}
	
	
	public Contact(String id, String f_name, String l_name, String email, String location, String ph, String other) {
		this.id = id;
		this.f_name = f_name;
		this.l_name = l_name;
		this.email = email;
		this.location = location;
		this.ph = ph;
		this.other = other;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPh() {
		return ph;
	}
	public void setPh(String ph) {
		this.ph = ph;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	
		
}
