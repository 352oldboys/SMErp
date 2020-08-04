package com.kh.erp.tax.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.tax.model.vo.Tax;

@Repository("taxDAO")
public class TaxDAOImpl implements TaxDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Tax> selectTaxList(Tax tax) {
		return sqlSession.selectList("taxMapper.selectTaxList", tax);
	}

	@Override
	public int insertTax(Tax tax) {
		
		return sqlSession.insert("taxMapper.insertTax", tax);
	}

	@Override
	public int deleteTax(Tax tax) {
		
		return sqlSession.delete("taxMapper.deleteTax", tax);
	}

	@Override
	public int updateTax(Tax tax) {
		
		return sqlSession.update("taxMapper.updateTax", tax);
	}

}
