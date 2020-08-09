package com.kh.erp.finance.sales.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.finance.sales.model.dao.SalesDAO;
import com.kh.erp.finance.sales.model.vo.Sales;

@Service("SalesService")
public class SalesServiceImpl implements SalesService {

	@Autowired
	SalesDAO salesDAO;
	
	@Override
	public List<Sales> selectSalList(int userNo) {
		return salesDAO.selectSalList(userNo);
	}

	@Override
	public int insertSal(Sales sales) {
		return salesDAO.insertSal(sales);
	}

	@Override
	public int updateSal(Sales sales) {
		return salesDAO.updateSal(sales);
	}

	@Override
	public int deleteSal(int salesNo) {
		return salesDAO.deleteSal(salesNo);
	}
	
	@Override
	public int salesPrice(String userId) {
		System.out.println("service : "+  userId);
		return salesDAO.salesPrice(userId);
	}

	@Override
	public String salesMonthPrice(int userNo) {
		
		return salesDAO.salesMonthPrice(userNo);
	}

	@Override
	public Sales selectOneSales(int salesNo) {
		
		return salesDAO.selectOneSales(salesNo);
	}

}
