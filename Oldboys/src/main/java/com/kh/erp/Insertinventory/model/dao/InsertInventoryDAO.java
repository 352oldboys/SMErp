package com.kh.erp.Insertinventory.model.dao;

import java.util.List;

import com.kh.erp.Insertinventory.model.vo.InsertInventory;


public interface InsertInventoryDAO {

	

	List<InsertInventory> selectInsertInventoryList(InsertInventory insertInventory);

	int InsertInventoryList(InsertInventory insertInventory);

	int updateInsertInventoryList(InsertInventory insertInventory);
    
	int deleteInsertInventoryList(InsertInventory insertInventory);
}
