package com.kh.erp.inventory.model.dao;

import java.util.List;

import com.kh.erp.inventory.model.vo.Inventory;






public interface InventoryDAO {

	
	
	List<Inventory> selectInventoryList(Inventory inventory);
    
	int insertInventoryList(Inventory inventory);

	int deleteInventoryList(int inventoryNo);

	int updateInventoryList(Inventory inventory);
	
	
}
