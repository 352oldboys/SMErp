package com.kh.erp.tax.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.erp.tax.model.vo.Tax;
import com.kh.erp.tax.model.service.TaxService;

@Controller
public class TaxController {

	@Autowired
	TaxService taxService;
	
	@RequestMapping("/tax/taxList.do")
	public String taxList(Tax tax, Model model,
						  @RequestParam(value="userNo") int userNo) {
		
		List<Tax> list = taxService.selectTaxList(tax);
		
		model.addAttribute("list", list);
		
		return "tax/taxList";
		
	}
	
	@RequestMapping("/tax/insertTax.do")
	public String insertTax(Tax tax, Model model,
							@RequestParam(value="userNo") int userNo) {
		int result;
		
		System.out.println("userNo : " + userNo);
		
		try {

			result = taxService.insertTax(tax);
			
			System.out.println(result);
			
			if(result > 0) {
				System.out.println("등록성공");
			} else {
				System.out.println("등록실패");
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
			System.out.println(model);
		
		    return "redirect:taxList.do?userNo="+userNo;

	}
	
	@RequestMapping("/tax/deleteTax.do")
	public String deleteTax(Tax tax, Model model,
							@RequestParam(value="userNo") int userNo,
							@RequestParam(value="taxNo") int taxNo) {
		int result;
		
		try {

			result = taxService.deleteTax(tax);
			
			System.out.println(result);
			
			if(result > 0) {
				System.out.println("삭제성공");
			} else {
				System.out.println("삭제실패");
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
			System.out.println(model);
		
		    return "redirect:taxList.do?userNo="+userNo;

	}

	@RequestMapping("/tax/updateTax.do")
	public String updateTax(Tax tax, Model model,
							@RequestParam(value="userNo") int userNo,
							@RequestParam(value="taxNo") int taxNo) {
		
		int result;
		
		try {
			
			result = taxService.updateTax(tax);
			
			System.out.println(result);
			
			if(result > 0) {
				System.out.println("수정성공");
			}else {
				System.out.println("수정실패");
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
		System.out.println(model);
		
		return "redirect:taxList.do?userNo="+userNo;
		
	}
	
}
