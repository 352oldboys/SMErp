package com.kh.erp.Insertinventory.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.Insertinventory.model.vo.InsertInventory;


@Repository("InsertinventoryDAO")
public class InsertInventoryDAOImpl implements InsertInventoryDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	 public List<InsertInventory> selectInsertInventoryList(InsertInventory insertInventory) {
			return sqlSession.selectList("insertinventoryMapper.selectInsertInventory",insertInventory);
			
		}
	
	@Override
	 public int InsertInventoryList(InsertInventory insertInventory) {
			return sqlSession.insert("insertinventoryMapper.insertInventory",insertInventory);
			
		}
	@Override
	 public int updateInsertInventoryList(InsertInventory insertInventory) {
			return sqlSession.update("insertinventoryMapper.updateinsertInventory",insertInventory);
			
		}
	@Override
	 public int deleteInsertInventoryList(InsertInventory insertInventory) {
			return sqlSession.insert("insertinventoryMapper.deleteinsertInventory",insertInventory);
			
		}
	
}
