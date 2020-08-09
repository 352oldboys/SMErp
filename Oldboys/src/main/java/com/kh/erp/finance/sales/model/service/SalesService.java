package com.kh.erp.finance.sales.model.service;

import java.util.List;
import java.util.Map;

import com.kh.erp.finance.sales.model.vo.Sales;

public interface SalesService {

	/**
	 * 값을 삽입하는 내용
	 * @param sales
	 * @return
	 */
	int insertSal(Sales sales);

	/**
	 * 값을 수정하는 내용
	 * @param sales
	 * @return
	 */
	int updateSal(Sales sales);

	/**
	 * 값을 삭제하는 내용
	 * @param salesNo
	 * @return
	 */
	int deleteSal(int salesNo);

	/**
	 * 모든 값을 처리 후 보여지는 view
	 * @param userNo 
	 * @return
	 */
	List<Sales> selectSalList(int userNo);

	/**
	 * 가격을 알람창으로 보내주는 내용
	 * @param userId
	 * @return
	 */
	int salesPrice(String userId);

	String salesMonthPrice(int userNo);

	Sales selectOneSales(int salesNo);


	
}
