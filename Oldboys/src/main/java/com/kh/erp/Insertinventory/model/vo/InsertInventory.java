package com.kh.erp.Insertinventory.model.vo;

public class InsertInventory {

	public int productNo;
	private String product;
	private int userNo;
	public InsertInventory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InsertInventory(int productNo, String product, int userNo) {
		super();
		this.productNo = productNo;
		this.product = product;
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "InsertInventory [productNo=" + productNo + ", product=" + product + ", userNo=" + userNo + "]";
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
}
	
	
