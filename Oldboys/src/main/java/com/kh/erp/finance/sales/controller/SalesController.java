package com.kh.erp.finance.sales.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.erp.finance.sales.model.service.SalesService;
import com.kh.erp.finance.sales.model.vo.Sales;

@SessionAttributes(value= {"productNo"} )
@Controller("SalesController")
public class SalesController {
	
	@Autowired
	SalesService salesService;
	
	@RequestMapping("/finance/sales.do")
	public String SalesList(Model model, @RequestParam(value="userNo") int userNo) {
		
		List<Sales> list = salesService.selectSalList(userNo);
		
		String sMonth = salesService.salesMonthPrice(userNo);
		
		model.addAttribute("list", list).addAttribute("sMonth", sMonth);
		
		return "finance/sales";
	}
	
	@RequestMapping("/finance/salesPrice.do")
	@ResponseBody
	public Map<String, Object> salesPrice(@RequestParam String userId) {
		
		int salesPrice = salesService.salesPrice(userId);
		System.out.println("controller :" +userId);
		Map<String, Object> map = new HashMap<>();
		
		map.put("salesPrice", salesPrice);
		
		return map;
	}
	
	@RequestMapping("/finance/insertSal.do")
	public String insertSal(Sales sales, Model model) {
		int result;
		
		try {
			result = salesService.insertSal(sales);
			
			if(result > 0) {
				System.out.println("삽입 성공");
			}else {
				System.out.println("삽입 실패");
			}
			
		}catch(Exception e) {
			throw e;
		}
		
		return "redirect:/finance/sales.do?userNo="+sales.getUserNo();
	}
	
	@RequestMapping("/finance/updateSal.do")
	public String updateSal(Sales sales, Model model) {
//		System.out.println("sales check : " + sales);
//		System.out.println("model check : " + model);
		int result;
		
		try {
			result = salesService.updateSal(sales);
			
			if(result > 0) {
				System.out.println("수정 성공");
			}else {
				System.out.println("수정 실패");
			}
			
		}catch(Exception e) {
			throw e;
		}
	
		return "redirect:/finance/sales.do?userNo="+sales.getUserNo();
	}
	
	
	@RequestMapping("/finance/deleteSal.do")
	public String deleteSal(Sales sales, Model model) {
		int result;
		
		try {
			result = salesService.deleteSal(sales);
			
			if(result > 0) {
				System.out.println("삭제 성공");
			} else {
				System.out.println("삭제 실패");
			}
		}catch(Exception e){
			throw e;
		}
		
		return "redirect:/finance/sales.do?userNo="+sales.getUserNo();
	}
	
}
