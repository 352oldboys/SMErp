package com.kh.erp.finance.purchase.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.erp.finance.purchase.model.vo.Purchase;

@Service("PurchaseService")
public interface PurchaseService {
	
	public int updatePurList(Purchase purchase);
	
	public int deletePurList(Purchase purchase);
	
	public List<Purchase> selectList(int userNo);

	public int insertPurList(Purchase purchase);

	public int purchasePrice(String userId);
		
}
