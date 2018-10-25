package Main;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Userbean implements Serializable {

	/**
	 * 
	 */
	private String userID;
	private String firstName;
	private String lastName;
	private String email;
	private String homeAddress;
	private String dob;
	private boolean isAdmin;
	
	
	public Userbean(String _userID, String _firstName, String _lastName, String _email, String _homeAddress, String _dob, boolean _isAdmin) {
		userID = _userID;
		firstName = _firstName;
		lastName = _lastName;
		email = _email;
		homeAddress = _homeAddress;
		dob = _dob;
		isAdmin = _isAdmin;
	}
	
	public String getUserID() {
		return userID;
	}
	
	
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	
	public String getFirstName() {
		return firstName;
	}
	
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	
	public String getLastName() {
		return lastName;
	}
	
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public boolean isAdmin() {
		return isAdmin;
	}


	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	public String testData() {
		return userID + " " + firstName;
	}
	
	
}
