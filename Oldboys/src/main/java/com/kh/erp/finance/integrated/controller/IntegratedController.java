package com.kh.erp.finance.integrated.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.erp.finance.purchase.model.service.PurchaseService;
import com.kh.erp.finance.purchase.model.vo.Purchase;
import com.kh.erp.finance.sales.model.service.SalesService;
import com.kh.erp.finance.sales.model.vo.Sales;

@Controller
public class IntegratedController {
	
	@Autowired
	SalesService salesService;
	
	@Autowired
	PurchaseService purchaseService;
	
	@RequestMapping("finance/integrated.do")
	public String integerted(Model model, 
												@RequestParam(value="userNo") int userNo) {
		
		List<Purchase> pList = purchaseService.selectList(userNo);
		
		List<Sales> sList = salesService.selectSalList(userNo);
		
		model.addAttribute("pList", pList);
		
		model.addAttribute("sList", sList);		
		
		return "finance/integrated";
		
	}
	
}
