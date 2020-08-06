package com.kh.erp.employee.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.erp.common.encrypt.AES256Util;
import com.kh.erp.employee.model.service.EmployeeService;
import com.kh.erp.employee.model.vo.Employee;


@Controller
public class EmployeeController {

	@Autowired
	EmployeeService empService;
	
	@Autowired
    AES256Util aes;

	@RequestMapping("/employee/employeeList.do")
	public String employeeList(Employee emp, Model model,
								@RequestParam(value="userNo") int userNo) {
		
		List<Employee> list = empService.selectEmpList(emp);

		model.addAttribute("list", list);

		return "employee/employeeList";
 
	}

	@RequestMapping(value="/employee/insertEmployee.do", method=RequestMethod.GET)
	public String employeeList() {
		return "employee/insertEmployee.do";
	}
	
	@RequestMapping(value="/employee/insertEmployee.do", method=RequestMethod.POST)
	public String insertEmployee(Employee emp, Model model,
								@RequestParam(value="userNo") int userNo,
								@RequestParam("accountNo") String accountNo) throws NoSuchAlgorithmException,
																					UnsupportedEncodingException, 
																					GeneralSecurityException {
		System.out.println(emp);
		
		System.out.println("암호화 전 계좌번호 : " + accountNo);
		
		accountNo = aes.encrypt(accountNo);
		
		System.out.println("-----------------------------");
        System.out.println("암호화 후 계좌번호 : " + accountNo);
        emp.setAccountNo(accountNo);
        
        System.out.println("-----------------------------");
        System.out.println("복호화 후 계좌번호 : " + aes.decrypt(accountNo));
        
		int result;
		
		String msg="";
		
		try {
			
			result = empService.insertEmployee(emp);
			
			System.out.println(emp);
			
			if( result > 0 ) { 
				msg="등록 성공!"; 
			} else { 
				msg="등록 실패!"; 
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
		String loc="/employee/employeeList.do"; 
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		model.addAttribute("accountNo", accountNo);


		return "redirect:employeeList.do?userNo="+userNo;

	}
	
	@RequestMapping("/employee/deleteEmployee.do")
	public String deleteEmployee(Employee emp, Model model,
								@RequestParam(value="userNo") int userNo) {
		int result;
		
		try {

			result = empService.deleteEmployee(emp);
			
			System.out.println(result);
			
			if(result>0) {
				System.out.println("삭제 성공");
			} else {
				System.out.println("삭제 실패");
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
			System.out.println(model);
		
		    return "redirect:employeeList.do?userNo="+userNo;

	}

	@RequestMapping("/employee/updateEmployee.do")
	public String updateEmployee(Employee emp, Model model,
								@RequestParam(value="userNo") int userNo,
								@RequestParam(value="empNo") int empNo) {
		
		int result;
		
		try {
			
			result = empService.updateEmployee(emp);
			
			System.out.println(result);
			
			if(result>0) {
				System.out.println("수정 성공");
			}else {
				System.out.println("수정 실패");
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
		System.out.println(model);
		
		return "redirect:employeeList.do?userNo="+userNo;
		
	}
	
}
