package com.kh.erp.customer.model.vo;

import java.io.Serializable;


public class Customer implements Serializable {

	private static final long serialVersionUID = 1008L;

	private String businessCode;
	private int userNo;
	private String businessName;
	private String phone;
	private String email;
	private String representative;
	private String custRegNo;
	private String address;
	
	public Customer() {	}

	public Customer(String businessCode, int userNo, String businessName, String phone, String email,
			String representative, String custRegNo, String address) {
		super();
		this.businessCode = businessCode;
		this.userNo = userNo;
		this.businessName = businessName;
		this.phone = phone;
		this.email = email;
		this.representative = representative;
		this.custRegNo = custRegNo;
		this.address = address;
	}

	@Override
	public String toString() {
		return "Customer [businessCode=" + businessCode + ", userNo=" + userNo + ", businessName=" + businessName
				+ ", phone=" + phone + ", email=" + email + ", representative=" + representative + ", custRegNo="
				+ custRegNo + ", address=" + address + "]";
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getBusinessCode() {
		return businessCode;
	}

	public int getUserNo() {
		return userNo;
	}

	public String getBusinessName() {
		return businessName;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getRepresentative() {
		return representative;
	}

	public String getCustRegNo() {
		return custRegNo;
	}

	public String getAddress() {
		return address;
	}

	public void setBusinessCode(String businessCode) {
		this.businessCode = businessCode;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setRepresentative(String representative) {
		this.representative = representative;
	}

	public void setCustRegNo(String custRegNo) {
		this.custRegNo = custRegNo;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	


}	