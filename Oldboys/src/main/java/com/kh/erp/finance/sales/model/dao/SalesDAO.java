package com.kh.erp.finance.sales.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.finance.sales.model.vo.Sales;

@Repository("salesDAO")
public interface SalesDAO {
	
	public int insertSal(Sales sales);
	
	public List<Sales> selectSalList();
	
	public int updateSal(Sales sales);
	
	public int deleteSal(int no);
}
