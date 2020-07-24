package com.kh.erp.finance.purchase.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.erp.finance.purchase.model.dao.PurchaseDAO;
import com.kh.erp.finance.purchase.model.vo.Purchase;

@Service("PurchaseService")
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	PurchaseDAO purchaseDAO;
	
	@Override
	public int insertPur(Purchase purchase) {
		return purchaseDAO.insertPur(purchase);
	}

	@Override
	public int updatePur(Purchase purchase) {
		return purchaseDAO.updatePur(purchase);
	}

	@Override
	public int deletePur(int productNo) {
		return purchaseDAO.deletePur(productNo);
	}

	@Override
	public List<Purchase> selectList() {
		return purchaseDAO.selectPur();
	}


}
