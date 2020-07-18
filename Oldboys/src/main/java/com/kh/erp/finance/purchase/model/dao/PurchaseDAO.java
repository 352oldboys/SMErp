package com.kh.erp.finance.purchase.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("PurchaseDAO")
public interface PurchaseDAO {
	
	@Autowired
	SqlSession sqlsession;
	

}
