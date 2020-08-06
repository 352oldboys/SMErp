package com.kh.erp.finance.integrated.model.vo;

import java.io.Serializable;

public class Integrate implements Serializable{

	private static final long serialVersionUID = 4885L;
	
	private int totalPrice;
	
	public Integrate() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integrate(int totalPrice) {
		super();
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "Integrate [totalPrice=" + totalPrice + "]";
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	} 
	
	
}
