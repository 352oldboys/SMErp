package com.kh.erp.finance.purchase.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.erp.finance.purchase.model.service.PurchaseService;
import com.kh.erp.finance.purchase.model.vo.Purchase;

@Controller
public class PurchaseController {
	
	@Autowired
	PurchaseService purchaseService;
	
	@RequestMapping("finance/purchase.do")
	public String purchase(Model model) {
		List<Purchase> list = purchaseService.selectList();
		
		//System.out.println("list : " + list); // 결과 확인용
		
		model.addAttribute("list", list);
		
		return "/finance/purchase";
	}
	
	@RequestMapping("/purchase/insertPur.do")
	public String insertAction(HttpServletRequest req,
			@RequestParam(value="productNo",required=false)int productNo,
			@RequestParam("itemCode")String itemCode,
			@RequestParam("businessCode")String businessCode,
			@RequestParam("userNo")int userNo,
			@RequestParam(required = false)String dayStr,
			@RequestParam("origin")String origin,
			@RequestParam("product")String product,
			@RequestParam("price")int price,
			@RequestParam("quantity")int quantity){
		
		Date day = Date.valueOf(dayStr);

		//확인
		//System.out.println(productNo);
		//System.out.println(itemCode);
		//System.out.println(businessCode);
		//System.out.println(userNo);
		//System.out.println(dayStr);
		//System.out.println(origin);
		//System.out.println(product);
		//System.out.println(price);
		//System.out.println(quantity);
		
		Purchase pur = new Purchase(0, businessCode, userNo, itemCode, product, 
				quantity, price, origin, day);
		
		int result = purchaseService.insertPur(pur);
		
		req.setAttribute("pur", pur);
		
		return "redirect:/finance/purchase.do";
	}
	
}
