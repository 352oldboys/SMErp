package com.kh.erp.finance.sales.model.vo;

import java.sql.Date;

public class Sales {
	
	private int productNo;
	private int userNo;
	private int quantity;
	private int unitPrice;
	private Date day;
	
	public Sales() { super(); }

	public Sales(int productNo, int userNo, int quantity, int unitPrice, Date day) {
		super();
		this.productNo = productNo;
		this.userNo = userNo;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.day = day;
	}

	@Override
	public String toString() {
		return "Sales [productNo=" + productNo + ", userNo=" + userNo + ", quantity=" + quantity + ", unitPrice="
				+ unitPrice + ", day=" + day + "]";
	}

	public int getProductNo() {
		return productNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public int getQuantity() {
		return quantity;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public Date getDay() {
		return day;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	
	
}
