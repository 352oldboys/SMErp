package com.kh.erp.finance.purchase.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.erp.finance.purchase.model.vo.Purchase;

@Repository("PurchaseDAO")
public interface PurchaseDAO {

	public int updatePurList(Purchase purchase);
	
	public int deletePurList(int purchaseNo);

	public List<Purchase> selectPurList(int userNo);

	public int insertPurList(Purchase purchase);

	public int purchasePrice(String userId);

	public String purchaseMonthPrice(int userNo);

	public Purchase selectOnePurchase(int purchaseNo);

}
