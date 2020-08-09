package com.kh.erp.finance.sales.model.vo;

import java.sql.Date;

public class Sales {
	
	private int productNo;
	private String productName;
	private int userNo;
	private int quantity;
	private int unitPrice;
	private Date day;
	private int salesNo;
	
	public Sales() { super(); }

	public Sales(int productNo, String productName, int userNo, int quantity, int unitPrice, Date day, int salesNo) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.userNo = userNo;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.day = day;
		this.salesNo = salesNo;
	}

	@Override
	public String toString() {
		return "Sales [productNo=" + productNo + ", productName=" + productName + ", userNo=" + userNo + ", quantity="
				+ quantity + ", unitPrice=" + unitPrice + ", day=" + day + ", salesNo=" + salesNo + "]";
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	public int getSalesNo() {
		return salesNo;
	}

	public void setSalesNo(int salesNo) {
		this.salesNo = salesNo;
	}

	
	
}