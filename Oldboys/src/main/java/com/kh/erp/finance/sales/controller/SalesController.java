package com.kh.erp.finance.sales.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.erp.finance.sales.model.service.SalesService;
import com.kh.erp.finance.sales.model.vo.Sales;

@Controller
public class SalesController {
	
	@Autowired
	SalesService salesService;

	@RequestMapping()
	public String Sales(HttpServletRequest req) {
		int salProductno = Integer.parseInt(req.getParameter("productNo"));
		int salUserno = Integer.parseInt(req.getParameter("userNo"));
		int salQuantity = Integer.parseInt(req.getParameter("quantity"));
		int salUnitPrice = Integer.parseInt(req.getParameter("unitprice"));
		Date salDay = req.getParameter("day");
		
		Sal sal = new Sal();
		sal.setProductno(salProductno);
		sal.setuserno(salUserno);
		sal.setQuantity(salQuantity);
		sal.setUnitprice(salUnitPrice);
		sal.setDay(salDay);
		
		req.setAttribute("sal", sal);
		
		return "/";
	}
	

	@RequestMapping(value="insertSal.do", method="RequestMethod.POST")
	public int insertSal(Sales sales) {
		int result = salesService.insertSal(sales);
		
		return 0;
	}
	

	@RequestMapping("selectSal.do")
	public String selectSalList(Model model) {
		List<Sales> list = salesService.selectSalList();
		
		model.addAttribute("list", list);
		
		return null;
		
	}
	

	@RequestMapping("//deleteSal.do")
	public int deleteSal(@RequestParam int no) {
		int restult = salesService.deleteSal(no);
		
		return 0;
	}
	
	
}
