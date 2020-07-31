package com.kh.erp.finance.integrated.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntegratedController {
	
	@RequestMapping("finance/integrated.do")
	public String integerted() {
		
		return "finance/integrated";
		
	}
	
}
