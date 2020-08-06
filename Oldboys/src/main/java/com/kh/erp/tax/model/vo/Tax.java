package com.kh.erp.tax.model.vo;

import java.io.Serializable;
import java.sql.Date;


public class Tax implements Serializable {
	
	private static final long serialVersionUID = 1009L;
	
	private int taxNo;
	private int userNo;
	private Date publishDay;
	private String businessCode;
	private String businessName;
	private String custRegNo;
	private String item;
	private String unit;
	private int quantity;
	private int unitCost;
	private int supplyPrice;
	private int taxPrice;
	
	public Tax() {	}

	public Tax(int taxNo, int userNo, Date publishDay, String businessCode, String businessName, String custRegNo,
			String item, String unit, int quantity, int unitCost, int supplyPrice, int taxPrice) {
		super();
		this.taxNo = taxNo;
		this.userNo = userNo;
		this.publishDay = publishDay;
		this.businessCode = businessCode;
		this.businessName = businessName;
		this.custRegNo = custRegNo;
		this.item = item;
		this.unit = unit;
		this.quantity = quantity;
		this.unitCost = unitCost;
		this.supplyPrice = supplyPrice;
		this.taxPrice = taxPrice;
	}
	
	

	public Tax(int taxNo, Date publishDay, String businessCode, String businessName, String custRegNo, String item,
			String unit, int quantity, int unitCost, int supplyPrice, int taxPrice) {
		super();
		this.taxNo = taxNo;
		this.publishDay = publishDay;
		this.businessCode = businessCode;
		this.businessName = businessName;
		this.custRegNo = custRegNo;
		this.item = item;
		this.unit = unit;
		this.quantity = quantity;
		this.unitCost = unitCost;
		this.supplyPrice = supplyPrice;
		this.taxPrice = taxPrice;
	}

	@Override
	public String toString() {
		return "Tax [taxNo=" + taxNo + ", userNo=" + userNo + ", publishDay=" + publishDay + ", businessCode="
				+ businessCode + ", businessName=" + businessName + ", custRegNo=" + custRegNo + ", item=" + item
				+ ", unit=" + unit + ", quantity=" + quantity + ", unitCost=" + unitCost + ", supplyPrice="
				+ supplyPrice + ", taxPrice=" + taxPrice + "]";
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getTaxNo() {
		return taxNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public Date getPublishDay() {
		return publishDay;
	}

	public String getBusinessCode() {
		return businessCode;
	}

	public String getBusinessName() {
		return businessName;
	}

	public String getCustRegNo() {
		return custRegNo;
	}

	public String getItem() {
		return item;
	}

	public String getUnit() {
		return unit;
	}

	public int getQuantity() {
		return quantity;
	}

	public int getUnitCost() {
		return unitCost;
	}

	public int getSupplyPrice() {
		return supplyPrice;
	}

	public int getTaxPrice() {
		return taxPrice;
	}

	public void setTaxNo(int taxNo) {
		this.taxNo = taxNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public void setPublishDay(Date publishDay) {
		this.publishDay = publishDay;
	}

	public void setBusinessCode(String businessCode) {
		this.businessCode = businessCode;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public void setCustRegNo(String custRegNo) {
		this.custRegNo = custRegNo;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setUnitCost(int unitCost) {
		this.unitCost = unitCost;
	}

	public void setSupplyPrice(int supplyPrice) {
		this.supplyPrice = supplyPrice;
	}

	public void setTaxPrice(int taxPrice) {
		this.taxPrice = taxPrice;
	}

	
	
}