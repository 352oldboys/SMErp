package com.kh.erp.employee.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.employee.model.dao.EmployeeDAO;
import com.kh.erp.employee.model.vo.Employee;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeDAO employeeDAO;
	
	@Override
	public List<Employee> selectEmpList(Employee emp) {
		
		return employeeDAO.selectEmpList(emp);
	}

	@Override
	public int insertEmployee(Employee emp) {
		
		return employeeDAO.insertEmployee(emp);
	}

}
