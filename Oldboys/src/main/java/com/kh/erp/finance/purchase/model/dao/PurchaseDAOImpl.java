package com.kh.erp.finance.purchase.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.finance.purchase.model.vo.Purchase;

@Repository("PurchaseDAO")
public class PurchaseDAOImpl implements PurchaseDAO {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int insertPur(Purchase purchase) {
		return session.insert("PurchaseMapper.insertPur", purchase);
	}
	
	@Override
	public List<Purchase> selectPur() {
		return session.selectList("PurchaseMapper.selectPurList");
	}
	
	@Override
	public int updatePur(Purchase purchase) {
		return session.update("PurchaseMapper.updatePur", purchase);
	}

	@Override
	public int deletePur(int productNo) {
		return session.delete("PurchaseMapper.deletePur", productNo);
	}

}
