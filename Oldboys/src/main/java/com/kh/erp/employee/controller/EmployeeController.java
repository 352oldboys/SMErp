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

	@RequestMapping(value = "/employee/insertEmployee.do", method = RequestMethod.POST)
	public String insertEmployee(Employee emp, Model model) {

		System.out.println(emp);
		
		int result = empService.insertEmployee(emp);
		
		System.out.println(emp);
				
		String msg=""; if( result > 0 ) { msg="등록 성공"; } else { msg="등록 실패!"; }
		
		String loc="/employee/employeeList.do"; model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);


		return "employee/employeeList";

	}

}
