package com.kh.erp.inventory.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.inventory.model.vo.Inventory;


@Repository("inventoryDAO")
public class InventoryDAOImpl implements InventoryDAO {

 @Autowired
 SqlSessionTemplate sqlSession;
 
 @Override
 public List<Inventory> selectInventoryList(Inventory inventory) {
		return sqlSession.selectList("inventoryMapper.selectInventory" ,inventory);
		
	}
 
 
 @Override
 public int insertInventoryList(Inventory inventory) {
	 	
	 		
	 	 return sqlSession.insert("inventoryMapper.insertInventory" ,inventory);

 }
 @Override
 public int deleteInventoryList(Inventory inventory) {
	 	
	 		
	 	 return sqlSession.delete("inventoryMapper.deleteInventory" ,inventory);

 }
 
 @Override
 public int updateInventoryList(Inventory inventory) {
	 	
	 		
	 	 return sqlSession.update("inventoryMapper.updateInventory" ,inventory);

 }
 


 
}
