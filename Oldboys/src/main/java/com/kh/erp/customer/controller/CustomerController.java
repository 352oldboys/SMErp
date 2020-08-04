package com.kh.erp.customer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.erp.customer.model.service.CustomerService;
import com.kh.erp.customer.model.vo.Customer;

@Controller
public class CustomerController {

	@Autowired
	CustomerService custService;

	@RequestMapping("/customer/customerList.do")
	public String customerList(Customer cust, Model model) {

		List<Customer> list = custService.selectCustList(cust);

		model.addAttribute("list", list);

		return "customer/customerList";
 
	}

	@RequestMapping("/customer/insertCustomer.do")
	public String insertCustomer(Customer cust, Model model) {

		System.out.println(cust);
		
		int result; 
		String msg="";
		
		try {
			
			result = custService.insertCustomer(cust);
			
			System.out.println(cust);
			
			if( result > 0 ) { 
				msg="등록 성공"; 
			} else { 
				msg="등록 실패!"; 
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
		String loc="/customer/customerList.do"; 
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);


		return "redirect:customerList.do";

	}
	
	@RequestMapping("/customer/deleteCustomer.do")
	public String deleteCustomer(Customer cust, Model model) {
		int result;
		
		try {

			result = custService.deleteCustomer(cust);
			
			System.out.println(result);
			
			if(result>0) {
				System.out.println("삭제성공");
			} else {
				System.out.println("삭제실패");
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
			System.out.println(model);
		
		    return "redirect:customerList.do";

	}

	@RequestMapping("/customer/updateCustomer.do")
	public String updateCustomer(Customer cust, Model model) {
		
		int result;
		
		try {
			
			result = custService.updateCustomer(cust);
			
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
		
		return "redirect:customerList.do";
		
	}
	
}
