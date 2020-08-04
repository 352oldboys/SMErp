package com.kh.erp.tax.model.dao;

import java.util.List;

import com.kh.erp.tax.model.vo.Tax;

public interface TaxDAO {
	
	List<Tax> selectTaxList(Tax tax);

	int insertTax(Tax tax);

	int deleteTax(Tax tax);

	int updateTax(Tax tax);
}
