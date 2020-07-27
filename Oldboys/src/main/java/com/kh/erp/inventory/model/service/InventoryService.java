package com.kh.erp.inventory.model.service;

import java.util.List;

import com.kh.erp.inventory.model.vo.Inventory;


public interface InventoryService {
	static int INVENTORY_SERVICE_ERROR = 0;
	static int INVENTORY_SERVICE_COMPLETE = 1;

	

	
	List<Inventory> selectInventoryList(Inventory inventory);
     
	int insertInventoryList(Inventory inventory);
	
	int deleteInventoryList(Inventory inventory);

	int updateInventoryList(Inventory inventory);
	

}
