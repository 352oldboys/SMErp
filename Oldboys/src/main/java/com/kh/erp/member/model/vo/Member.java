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
	private String address1;
	private String address2;
	private String status;
	private int dice;
	
	public Member() { super(); }

	public Member(int userNo, String userId, String password, String regNo, String businessName, String phone,
			String gender, String name, int age, String email, String address1, String address2, String status,
			int dice) {
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
		this.address1 = address1;
		this.address2 = address2;
		this.status = status;
		this.dice = dice;
	}
	
	

	public Member(int dice) {
		super();
		this.dice = dice;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", password=" + password + ", regNo=" + regNo
				+ ", businessName=" + businessName + ", phone=" + phone + ", gender=" + gender + ", name=" + name
				+ ", age=" + age + ", email=" + email + ", address1=" + address1 + ", address2=" + address2
				+ ", status=" + status + ", dice=" + dice + "]";
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

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRegNo() {
		return regNo;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getDice() {
		return dice;
	}

	public void setDice(int dice) {
		this.dice = dice;
	}


}