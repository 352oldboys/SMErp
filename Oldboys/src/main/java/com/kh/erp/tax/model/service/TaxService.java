package com.kh.erp.tax.model.service;

import java.util.List;

import com.kh.erp.tax.model.vo.Tax;

public interface TaxService {
	static int TAX_SERVICE_ERROR = 0;
	static int TAX_SERVICE_COMPLETE = 1;
	
	List<Tax> selectTaxList(Tax tax);

	int insertTax(Tax tax);

	int deleteTax(Tax tax);

	int updateTax(Tax tax);
}
