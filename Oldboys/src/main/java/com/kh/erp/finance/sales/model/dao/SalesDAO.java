package com.kh.erp.finance.sales.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.erp.finance.sales.model.vo.Sales;

public interface SalesDAO {

	int insertSal(Sales sales);

	int updateSal(Sales sales);

	int deleteSal(int salesNo);

	List<Sales> selectSalList(int userNo);

	int salesPrice(String userId);

	String salesMonthPrice(int userNo);

	Sales selectOneSales(int salesNo);

}
