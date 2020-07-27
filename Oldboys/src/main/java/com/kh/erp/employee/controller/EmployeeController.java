package com.kh.erp.employee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.erp.employee.model.service.EmployeeService;
import com.kh.erp.employee.model.vo.Employee;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService empService;

	@RequestMapping("/employee/employeeList.do")
	public String employeeList(Employee emp, Model model) {

		List<Employee> list = empService.selectEmpList(emp);

		model.addAttribute("list", list);

		return "employee/employeeList";
 
	}

	@RequestMapping("/employee/insertEmployee.do")
	public String insertEmployee(Employee emp, Model model) {

		System.out.println(emp);
		
		int result; 
		String msg="";
		
		try {
			
			result = empService.insertEmployee(emp);
			
			System.out.println(emp);
			
			if( result > 0 ) { 
				msg="등록 성공"; 
			} else { 
				msg="등록 실패!"; 
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
		String loc="/employee/employeeList.do"; 
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);


		return "redirect:employeeList.do";

	}
	
	@RequestMapping("/employee/deleteEmployee.do")
	public String deleteEmployee(Employee emp, Model model) {
		int result;
		
		try {

			result = empService.deleteEmployee(emp);
			
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
		
		    return "redirect:employeeList.do";

	}

	@RequestMapping("/employee/updateEmployee.do")
	public String updateEmployee(Employee emp, Model model) {
		
		int result;
		
		try {
			
			result = empService.updateEmployee(emp);
			
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
		
		return "redirect:employeeList.do";
		
	}
	
}
