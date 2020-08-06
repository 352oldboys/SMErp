package com.kh.erp.inventory.model.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.inventory.model.dao.InventoryDAO;
import com.kh.erp.inventory.model.vo.Inventory;


@Service("inventoryService")
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	InventoryDAO inventoryDAO;

	@Override
	public List<Inventory> selectInventoryList(Inventory inventory) {
		return inventoryDAO.selectInventoryList(inventory);

	}

	@Override
	public int insertInventoryList(Inventory inventory) {
		return inventoryDAO.insertInventoryList(inventory);
	}

	@Override
	public int deleteInventoryList(int inventoryNo) {
		return inventoryDAO.deleteInventoryList(inventoryNo);
	}

	@Override
	public int updateInventoryList(Inventory inventory) {
		return inventoryDAO.updateInventoryList(inventory);
	}

//@Override
//public List<Inventory2> selectInventoryList(Inventory2 inventory2) {
//	return inventoryDAO.selectInventoryList(inventory2);
//	
//}

}
