package model;

public class User {
	
	protected int id;
	protected String name;
	protected String surname;
	protected String gender;
	protected String birthdate;
	protected String workAddress;
	protected String homeAddress;
	
	public User() {

	}
	public User(String name, String surname, String gender, String birthdate, String workAddress, String homeAddress) {
		super();
		this.name = name;
		this.surname = surname;
		this.gender = gender;
		this.birthdate = birthdate;
		this.workAddress = workAddress;
		this.homeAddress = homeAddress;
	}
	public User(int id, String name, String surname, String gender, String birthdate, String workAddress,
			String homeAddress) {
		super();
		this.id = id;
		this.name = name;
		this.surname = surname;
		this.gender = gender;
		this.birthdate = birthdate;
		this.workAddress = workAddress;
		this.homeAddress = homeAddress;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getWorkAddress() {
		return workAddress;
	}
	public void setWorkAddress(String workAddress) {
		this.workAddress = workAddress;
	}
	public String getHomeAddress() {
		return homeAddress;
	}
	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}
	
	
}
