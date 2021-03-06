package com.kh.erp.finance.sales.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.finance.sales.model.vo.Sales;

@Repository("SalesDAO")
public class SalesDAOImpl implements SalesDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertSal(Sales sales) {
		return sqlSession.insert("SalesMapper.insertSal", sales);
	}

	@Override
	public int updateSal(Sales sales) {
		return sqlSession.update("SalesMapper.updateSal", sales);
	}

	@Override
	public int deleteSal(int salesNo) {
		return sqlSession.delete("SalesMapper.deleteSal", salesNo);
	}

	@Override
	public List<Sales> selectSalList(int userNo) {
		return sqlSession.selectList("SalesMapper.selectSalList", userNo);
	}
	
	@Override
	public int salesPrice(String userId) {
		System.out.println("DAO : " + userId);
		return sqlSession.selectOne("SalesMapper.salesPrice", userId);
	}

	@Override
	public String salesMonthPrice(int userNo) {
		
		return sqlSession.selectOne("SalesMapper.salesMonthPrice", userNo);
	}

	@Override
	public Sales selectOneSales(int salesNo) {
		
		return sqlSession.selectOne("SalesMapper.selectOneSales", salesNo);
	}
	

}
