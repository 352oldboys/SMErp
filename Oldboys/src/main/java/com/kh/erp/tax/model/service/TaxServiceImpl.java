package com.kh.erp.tax.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.tax.model.dao.TaxDAO;
import com.kh.erp.tax.model.vo.Tax;

@Service("taxService")
public class TaxServiceImpl implements TaxService {
	
	@Autowired
	TaxDAO taxDAO;
	
	@Override
	public List<Tax> selectTaxList(Tax tax) {
		
		return taxDAO.selectTaxList(tax);
		
	}

	@Override
	public int insertTax(Tax tax) {
		return taxDAO.insertTax(tax);
	}

	@Override
	public int deleteTax(Tax tax) {
		return taxDAO.deleteTax(tax);
	}

	@Override
	public int updateTax(Tax tax) {
		return taxDAO.updateTax(tax);
	}

}
