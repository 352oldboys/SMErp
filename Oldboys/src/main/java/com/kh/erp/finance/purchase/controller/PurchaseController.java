package com.kh.erp.finance.purchase.controller;

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

import com.kh.erp.finance.purchase.model.service.PurchaseService;
import com.kh.erp.finance.purchase.model.vo.Purchase;

@SessionAttributes(value={"purchase"})
@Controller
public class PurchaseController {
	
	@Autowired
	PurchaseService purchaseService;
	
	@RequestMapping("/finance/purchasePrice.do")
	@ResponseBody
	public Map<String, Object> purchasePrice(@RequestParam String userId) {
		
		int purchasePrice = purchaseService.purchasePrice(userId);
		
		System.out.println("controller :" +userId);
		Map<String, Object> map = new HashMap<>();
		
		map.put("purchasePrice", purchasePrice);
		
		return map;
	}
	
	
	@RequestMapping("/finance/purchase.do")
	public String purchaseList(Model model, @RequestParam(value="userNo") int userNo) {
		
		List<Purchase> list = purchaseService.selectList(userNo);
		
		System.out.println("userNo1 :" + userNo);
		String pMonth = purchaseService.purchaseMonthPrice(userNo);
		System.out.println("userNo2 :" + userNo);
		
		model.addAttribute("list", list).addAttribute("pMonth", pMonth);
		
		/*
		 * Map<String, Object> map = new HashMap<>();
		 * 
		 * map.put("pMonth", pMonth);
		 */
		System.out.println("pMonth : " + pMonth);
		
		//System.out.println("list : " + list); // 결과 확인용
		
		return "finance/purchase";
	}
	
	@RequestMapping("/finance/insertPur.do")
	public String insertPur(Purchase purchase, Model model) {
//		System.out.println("purchase 확인 : " + purchase);
//		System.out.println("model 확인 : " + model);
		
		int result;
		
		try {
			result = purchaseService.insertPurList(purchase);
			System.out.println("insert,result : " + result);
			
			if(result>0) {
				System.out.println("삽입 성공");
			}else {
				System.out.println("삽입 실패");
			}
		}catch(Exception e) {
			throw e;
		}
			
		return "redirect:/finance/purchase.do?userNo="+purchase.getUserNo();
	}

	@RequestMapping("/finance/updatePur.do")
	public String updatePur(Purchase purchase, Model model, @RequestParam("purchaseNo") int purchaseNo,
												@RequestParam("userNo") int userNo) {
		System.out.println("purchase 확인 : " + purchase);
		System.out.println("model 확인 : " + model);
		System.out.println("purchaseNo : " + purchaseNo);
		int result;
		
		try{
			result = purchaseService.updatePurList(purchase);
			System.out.println("update,result : " + result);
			

			if(result>0) {
				System.out.println("삽입 성공");
			}else {
				System.out.println("삽입 실패");
			}
		}catch(Exception e) {
			throw e;
		}
				
		return "redirect:/finance/purchase.do?userNo=" + userNo;
	}
	
	@RequestMapping("/finance/deletePur.do")
	public String deletePur(Purchase purchase, Model model, @RequestParam("purchaseNo") int purchaseNo) {
		System.out.println("purchase 확인 : " + purchase);
		System.out.println("model 확인 : " + model);
		
		purchase = purchaseService.selectOnePurchase(purchaseNo);
		
		int result;
		
		try {
		result = purchaseService.deletePurList(purchaseNo);
		System.out.println("delete,result :" + result);
		
		if(result>0) {
			System.out.println("삭제성공");
		}else {
			System.out.println("삭제실패");
		}
		
	} catch(Exception e) {
		
		throw e;
		
	}
	
	    return "redirect:/finance/purchase.do?userNo="+purchase.getUserNo();
		
	}
	
}
