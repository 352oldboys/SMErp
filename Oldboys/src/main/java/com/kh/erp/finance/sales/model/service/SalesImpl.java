package com.kh.erp.finance.sales.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.finance.sales.model.dao.SalesDAO;
import com.kh.erp.finance.sales.model.vo.Sales;

@Service("salesService")
public class SalesImpl implements SalesService {

	@Autowired
	SalesDAO salesDAO;
	
	@Override
	public int insertSal(Sales sales) {
		return salesDAO.insertSal(sales);
	}

	@Override
	public List<Sales> selectSalList() {
		return salesDAO.selectSalList();
	}

	@Override
	public int updateSal(Sales sales) {
		return salesDAO.updateSal(sales);
	}

	@Override
	public int deleteSal(int no) {
		return salesDAO.deleteSal(no);
	}

}
