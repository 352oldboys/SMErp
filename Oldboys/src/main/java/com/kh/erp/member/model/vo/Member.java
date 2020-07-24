package com.kh.erp.member.model.vo;

public class Member {

	private int userNo;
	private String userId;
	private String password;
	private String regNo;
	private String businessName;
	private String phone;
	private String gender;
	private String name;
	private int age;
	private String email;
	private String address;
	private String status;
	
	public Member() { super(); }

	public Member(String userId, String password, String regNo, String businessName, String phone, String gender,
			String name, int age, String email, String address, String status, int userNo) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.password = password;
		this.regNo = regNo;
		this.businessName = businessName;
		this.phone = phone;
		this.gender = gender;
		this.name = name;
		this.age = age;
		this.email = email;
		this.address = address;
		this.status = status;
	}

	

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", password=" + password + ", regNo=" + regNo
				+ ", businessName=" + businessName + ", phone=" + phone + ", gender=" + gender + ", name=" + name
				+ ", age=" + age + ", email=" + email + ", address=" + address + ", status=" + status + "]";
	}

	
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public String getPassword() {
		return password;
	}

	public String getRegNo() {
		return regNo;
	}

	public String getBusinessName() {
		return businessName;
	}

	public String getPhone() {
		return phone;
	}

	public String getGender() {
		return gender;
	}

	public String getName() {
		return name;
	}

	public int getAge() {
		return age;
	}

	public String getEmail() {
		return email;
	}

	public String getAddress() {
		return address;
	}

	public String getStatus() {
		return status;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
