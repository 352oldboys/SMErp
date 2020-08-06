package com.kh.erp.Insertinventory.model.service;

import java.util.List;


import com.kh.erp.Insertinventory.model.vo.InsertInventory;


public interface InsertInventorySerivce {

	static int INVENTORY_SERVICE_ERROR = 0;
	static int INVENTORY_SERVICE_COMPLETE = 1;

	

	
	List<InsertInventory> selectInsertInventoryList(InsertInventory insertInventory);
     
	int insertInventoryList(InsertInventory insertInventory);
   

	int updateInsertInventoryList(InsertInventory insertInventory);

	int deleteInsertInventoryList(InsertInventory insertInventory);
     
	
	
}
