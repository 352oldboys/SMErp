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
	public int insertPurList(Purchase purchase) {
		return purchaseDAO.insertPurList(purchase);
	}

	@Override
	public int updatePurList(Purchase purchase) {
		return purchaseDAO.updatePurList(purchase);
	}

	@Override
	public int deletePurList(Purchase purchase) {
		return purchaseDAO.deletePurList(purchase);
	}

	@Override
	public List<Purchase> selectList(int userNo) {
		return purchaseDAO.selectPurList(userNo);
	}

	@Override
	public int purchasePrice(String userId) {
		System.out.println("service : "+  userId);
		return purchaseDAO.purchasePrice(userId);
	}

	@Override
	public String purchaseMonthPrice(int userNo) {
		
		return purchaseDAO.purchaseMonthPrice(userNo);
	}

}
