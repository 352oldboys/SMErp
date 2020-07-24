package com.kh.erp.finance.purchase.model.vo;

import java.sql.Date;

public class Purchase {

	private int productNo; 
	private String businessCode; 
	private int userNo; 
	private String itemCode; 
	private String product; 
	private int quantity; 
	private int price;
	private String origin;
	private Date day;
	
	public Purchase(int productNo, String businessCode, int userNo, String itemCode, String product, int quantity,
			int price, String origin, Date day) {
		super();
		this.productNo = productNo;
		this.businessCode = businessCode;
		this.userNo = userNo;
		this.itemCode = itemCode;
		this.product = product;
		this.quantity = quantity;
		this.price = price;
		this.origin = origin;
		this.day = day;
	}

	@Override
	public String toString() {
		return "Purchase [productNo=" + productNo + ", businessCode=" + businessCode + ", userNo=" + userNo
				+ ", itemCode=" + itemCode + ", product=" + product + ", quantity=" + quantity + ", price=" + price
				+ ", origin=" + origin + ", day=" + day + "]";
	}

	public int getProductNo() {
		return productNo;
	}

	public String getBusinessCode() {
		return businessCode;
	}

	public int getUserNo() {
		return userNo;
	}

	public String getItemCode() {
		return itemCode;
	}

	public String getProduct() {
		return product;
	}

	public int getQuantity() {
		return quantity;
	}

	public int getPrice() {
		return price;
	}

	public String getOrigin() {
		return origin;
	}

	public Date getDay() {
		return day;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public void setBusinessCode(String businessCode) {
		this.businessCode = businessCode;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public void setDay(Date day) {
		this.day = day;
	}	
	
}
