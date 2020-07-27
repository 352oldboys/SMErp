package com.kh.erp.inventory.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.erp.inventory.model.service.InventoryService;
import com.kh.erp.inventory.model.vo.Inventory;



@Controller
public class InventoryController {

	@Autowired
	InventoryService inventoryService;
	
	@RequestMapping("/inventory/inventoryList.do")
	 public String inventoryList(Inventory inventory, Model model) {
		   
		   List<Inventory> list = inventoryService.selectInventoryList(inventory);
		   
		   model.addAttribute("list", list);
		   
		   System.out.println("list: " +list); // 결과 확인용
		   
		   return "inventory/inventory";
	
	}
	
	@RequestMapping("/inventory/insertInventory.do")
	public String insertInventory(Inventory inventory, Model model) {
			System.out.println("Inventory : " +inventory);
			System.out.println("model : "+model);
		int result;
		
		try {
			
			result = inventoryService.insertInventoryList(inventory);
			
			System.out.println(result);
			
			if(result>0) {
				System.out.println("삽입성공");
			}else {
				System.out.println("삽입실패");
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
			System.out.println(model);
		
		    return "redirect:inventoryList.do";
			                      
	
	}
	
	@RequestMapping("/inventory/deleteInventory.do")
	public String deleteInventory(Inventory inventory, Model model) {
		int result;
		
		try {
			
			
			
			result = inventoryService.deleteInventoryList(inventory);
			
			System.out.println(result);
			
			if(result>0) {
				System.out.println("삭제성공");
			}else {
				System.out.println("삭제실패");
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
			System.out.println(model);
		
		    return "redirect:inventoryList.do";
			                      
	
			
		
	}
	@RequestMapping("/inventory/updateInventory.do")
	public String updateInventory(Inventory inventory, Model model) {
					
		int result;
		
		try {
			
			result = inventoryService.updateInventoryList(inventory);
			
			System.out.println(result);
			
			if(result>0) {
				System.out.println("수정성공");
			}else {
				System.out.println("수정실패");
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
			System.out.println(model);
		
		    return "redirect:inventoryList.do";
			                      
		
	
	
}
}

	
