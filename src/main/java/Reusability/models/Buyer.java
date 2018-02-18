package Reusability.models;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Buyer {
	
	private String name;
    private String email;
    private String phone_no;
    private String address;
    
    public Buyer() {
		
	}

	public Buyer(String name, String email, String phone_no, String address) {
		
		this.name = name;
		this.email = email;
		this.phone_no = phone_no;
		this.address = address;
		
	}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_no() {
        return phone_no;
    }

    public void setPhone_no(String phone_no) {
        this.phone_no = phone_no;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    @Override
    public String toString() {
        return "Buyer{" +
                "name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone_no='" + phone_no + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
