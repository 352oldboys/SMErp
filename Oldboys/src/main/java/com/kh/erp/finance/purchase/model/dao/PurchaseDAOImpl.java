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
	public int insertPurList(Purchase purchase) {
		return session.insert("PurchaseMapper.insertPurList", purchase);
	}
	
	@Override
	public List<Purchase> selectPurList(int userNo) {
		return session.selectList("PurchaseMapper.selectPurList", userNo);
	}
	
	@Override
	public int updatePurList(Purchase purchase) {
		return session.update("PurchaseMapper.updatePurList", purchase);
	}

	@Override
	public int deletePurList(int purchaseNo) {
		return session.delete("PurchaseMapper.deletePurList", purchaseNo);
	}
	
	@Override
	public int purchasePrice(String userId) {
		System.out.println("DAO : " + userId);
		return session.selectOne("PurchaseMapper.purchasePrice", userId);
	}

	@Override
	public String purchaseMonthPrice(int userNo) {
		
		return session.selectOne("PurchaseMapper.purchaseMonthPrice", userNo);
	}

	@Override
	public Purchase selectOnePurchase(int purchaseNo) {
		
		return session.selectOne("PurchaseMapper.selectOnePurchase", purchaseNo);
	}

}
