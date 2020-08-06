package com.kh.erp.Insertinventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.erp.Insertinventory.model.service.InsertInventorySerivce;
import com.kh.erp.Insertinventory.model.vo.InsertInventory;


@Controller
public class InsertInventoryController {

	
	@Autowired
	InsertInventorySerivce insertInventoryService;
	
	@RequestMapping("/insertinventory/InsertinventoryList.do")
	public String InsertinventoryList(InsertInventory insertInventory,Model model, @RequestParam(value="userNo") int userNo ) {
		   
		   List<InsertInventory> list = insertInventoryService.selectInsertInventoryList(insertInventory);
		   
		   System.out.println(list);
		   model.addAttribute("list", list);
		   
//		   System.out.println("list: " +list); // 결과 확인용
		   
		   return "inventory/Insertinventory";   // jsp페이지로 리턴
}
	
	@RequestMapping("/insertinventory/insertInventory.do")
	public String insertInventory(InsertInventory insertInventory, Model model, @RequestParam(value="userNo") int userNo) {
					
		int result;
		
		try {
			
			result = insertInventoryService.insertInventoryList(insertInventory);
			
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
		
		    return "redirect:InsertinventoryList.do?userNo="+userNo;
			                      
	
	}

	@RequestMapping("/insertinventory/updateinsertInventory.do")
	public String updateInsertInventory(InsertInventory insertInventory, Model model, @RequestParam(value="userNo") int userNo) {
					
		int result;
		
		try {
			
			result = insertInventoryService.updateInsertInventoryList(insertInventory);
			
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
		
		    return "redirect:InsertinventoryList.do?userNo="+userNo;
			                      
		
	
	
}
	
	@RequestMapping("/insertinventory/deleteinsertInventory.do")
	public String deleteInsertInventory(InsertInventory insertInventory, Model model, @RequestParam(value="userNo") int userNo) throws Exception {
		int result;
		
		try {
			
			
			
			result = insertInventoryService.deleteInsertInventoryList(insertInventory);
			
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
		
		    return "redirect:InsertinventoryList.do?userNo="+userNo;
			                      
	
			
		
	}
	
}
