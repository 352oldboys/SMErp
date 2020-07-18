package com.kh.erp.finance.sales.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.finance.sales.model.vo.Sales;

@Repository
public class SalesDAoImpl implements SalesDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertSal(Sales sales) {
		return 0;
	}

	@Override
	public List<Sales> selectSalList() {
		return null;
	}

	@Override
	public int updateSal(Sales sales) {
		return 0;
	}

	@Override
	public int deleteSal(int no) {
		return 0;
	}

}
