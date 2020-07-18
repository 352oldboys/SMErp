package com.kh.erp.finance.sales.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.finance.sales.model.dao.SalesDAO;
import com.kh.erp.finance.sales.model.vo.Sales;

@Service("SalesService")
public interface SalesService {

	
	/**
	 * 테이블 추가
	 * @param sales
	 * @return
	 */
	int insertSal(Sales sales);
	
	/**
	 * 테이블 검색
	 * @param sales
	 * @return 
	 */
	List<Sales> selectSalList();
	
	/**
	 * 테이블 수정
	 * @param sales
	 * @return
	 */
	int updateSal(Sales sales);
	
	/**
	 * 테이블 삭제 
	 * @param no
	 * @return
	 */
	int deleteSal(int no);
}
