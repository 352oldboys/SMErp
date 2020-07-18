package com.kh.erp.finance.sales.model.vo;

import java.sql.Date;

public class Sales {
	private int productno;
	private int userno;
	private int quantity;
	private int unitprice;
	private Date day;
	
	public Sales() { super(); }
	
	public Sales(int productno, int userno, int quantity, int unitprice, Date day) {
		super();
		this.productno = productno;
		this.userno = userno;
		this.quantity = quantity;
		this.unitprice = unitprice;
		this.day = day;
	}
	@Override
	public String toString() {
		return "Sales [productno=" + productno + ", userno=" + userno + ", quantity=" + quantity + ", unitprice="
				+ unitprice + ", day=" + day + "]";
	}
	public int getProductno() {
		return productno;
	}
	public int getUserno() {
		return userno;
	}
	public int getQuantity() {
		return quantity;
	}
	public int getUnitprice() {
		return unitprice;
	}
	public Date getDay() {
		return day;
	}
	public void setProductno(int productno) {
		this.productno = productno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public void setUnitprice(int unitprice) {
		this.unitprice = unitprice;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	

	
}
