package com.kh.erp.finance.integrated.model.vo;

import java.io.Serializable;

public class Total implements Serializable{

	private static final long serialVersionUID = 4885L;

	private int totalPurchase;
	private int totalSales;

	
	public Total() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Total(int totalPurchase, int totalSales) {
		super();
		this.totalPurchase = totalPurchase;
		this.totalSales = totalSales;
	}


	@Override
	public String toString() {
		return "Total [totalPurchase=" + totalPurchase + ", totalSales=" + totalSales + "]";
	}


	public int getTotalPurchase() {
		return totalPurchase;
	}


	public void setTotalPurchase(int totalPurchase) {
		this.totalPurchase = totalPurchase;
	}


	public int getTotalSales() {
		return totalSales;
	}


	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}

	
	
	
}
