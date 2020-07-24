package com.kh.erp.employee.model.service;

import java.util.List;

import com.kh.erp.employee.model.vo.Employee;


public interface EmployeeService {
	

	List<Employee> selectEmpList(Employee emp);

	int insertEmployee(Employee emp);
	
	
}
