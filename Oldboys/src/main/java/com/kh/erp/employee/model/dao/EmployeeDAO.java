package com.kh.erp.employee.model.dao;

import java.util.List;

import com.kh.erp.employee.model.vo.Employee;

public interface EmployeeDAO {

	List<Employee> selectEmpList(Employee emp);

	int insertEmployee(Employee emp);

	int deleteEmployee(Employee emp);

	int updateEmployee(Employee emp);

	Employee selectEmpOne(String empNo);
	
	

}
