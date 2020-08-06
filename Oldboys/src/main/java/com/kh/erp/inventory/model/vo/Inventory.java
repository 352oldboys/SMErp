package com.kh.erp.inventory.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Inventory implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8482L;
	public int productNo;
	private int userNo;
	private String itemcode;
	private String product;
	private int quantity;
	private int unitprice;
	private String origin;
	private Date expirationdate;
	private String note;
	private String itemname;
	private int inventoryNo;
	
	public Inventory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Inventory(int productNo, int userNo, String itemcode, String product, int quantity, int unitprice,
			String origin, Date expirationdate, String note, String itemname, int inventoryNo) {
		super();
		this.productNo = productNo;
		this.userNo = userNo;
		this.itemcode = itemcode;
		this.product = product;
		this.quantity = quantity;
		this.unitprice = unitprice;
		this.origin = origin;
		this.expirationdate = expirationdate;
		this.note = note;
		this.itemname = itemname;
		this.inventoryNo = inventoryNo;
	}

	@Override
	public String toString() {
		return "Inventory [productNo=" + productNo + ", userNo=" + userNo + ", itemcode=" + itemcode + ", product="
				+ product + ", quantity=" + quantity + ", unitprice=" + unitprice + ", origin=" + origin
				+ ", expirationdate=" + expirationdate + ", note=" + note + ", itemname=" + itemname + ", inventoryNo="
				+ inventoryNo + "]";
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getItemcode() {
		return itemcode;
	}

	public void setItemcode(String itemcode) {
		this.itemcode = itemcode;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(int unitprice) {
		this.unitprice = unitprice;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public Date getExpirationdate() {
		return expirationdate;
	}

	public void setExpirationdate(Date expirationdate) {
		this.expirationdate = expirationdate;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public int getInventoryNo() {
		return inventoryNo;
	}

	public void setInventoryNo(int inventoryNo) {
		this.inventoryNo = inventoryNo;
	}

	

}