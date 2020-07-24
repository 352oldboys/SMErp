package com.kh.erp.finance.purchase.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.erp.finance.purchase.model.vo.Purchase;

@Service("PurchaseService")
public interface PurchaseService {
	
	public int insertPur(Purchase purchase);
	
	public int updatePur(Purchase purchase);
	
	public int deletePur(int productNo);
	
	public List<Purchase> selectList();
		
}
