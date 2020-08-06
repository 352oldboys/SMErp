package com.kh.erp.Insertinventory.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.Insertinventory.model.dao.InsertInventoryDAO;
import com.kh.erp.Insertinventory.model.vo.InsertInventory;


@Service("InsertInventoryService")
public class InsertInventoryServiceImpl implements InsertInventorySerivce {

	@Autowired
	InsertInventoryDAO insertInventoryDAO;
	
	@Override
	public List<InsertInventory> selectInsertInventoryList(InsertInventory insertInventory) {
		return insertInventoryDAO.selectInsertInventoryList(insertInventory);

	}
	
	@Override
	public int insertInventoryList(InsertInventory insertInventory) {
		return insertInventoryDAO.InsertInventoryList(insertInventory);
	}
	@Override
	public int updateInsertInventoryList(InsertInventory insertInventory) {
		return insertInventoryDAO.updateInsertInventoryList(insertInventory);
	}

	@Override
	public int deleteInsertInventoryList(InsertInventory insertInventory) {
		
		return insertInventoryDAO.deleteInsertInventoryList(insertInventory);
	}
	
}
