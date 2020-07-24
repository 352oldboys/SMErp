package com.kh.erp.finance.purchase.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.erp.finance.purchase.model.vo.Purchase;

@Repository("PurchaseDAO")
public interface PurchaseDAO {

	public int insertPur(Purchase purchase);
	
	public int updatePur(Purchase purchase);
	
	public int deletePur(int productNo);

	public List<Purchase> selectPur();
}
