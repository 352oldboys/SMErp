package com.kh.erp.finance.purchase.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.erp.finance.purchase.model.dao.PurchaseDAO;

@Component("PurchaseService")
public interface PurchaseService {
	
	@Autowired
	PurchaseDAO PurchaseDao;
	
	

	
	
}
