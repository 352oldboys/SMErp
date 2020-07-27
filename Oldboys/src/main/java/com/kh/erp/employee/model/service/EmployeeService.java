package com.kh.erp.employee.model.service;

import java.util.List;

import com.kh.erp.employee.model.vo.Employee;


public interface EmployeeService {
	static int EMPLOYEE_SERVICE_ERROR = 0;
	static int EMPLOYEE_SERVICE_COMPLETE = 1;

	List<Employee> selectEmpList(Employee emp);

	int insertEmployee(Employee emp);

	int deleteEmployee(Employee emp);

	int updateEmployee(Employee emp);
	
	
}
