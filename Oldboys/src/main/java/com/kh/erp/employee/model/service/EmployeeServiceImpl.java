package com.kh.erp.employee.model.service;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.GeneralSecurityException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.common.encrypt.AES256Util;
import com.kh.erp.employee.model.dao.EmployeeDAO;
import com.kh.erp.employee.model.vo.Employee;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeDAO employeeDAO;
	
	@Autowired
    AES256Util aes;
	
	@Override
	public List<Employee> selectEmpList(Employee emp) {
		List<Employee> list = employeeDAO.selectEmpList(emp);
		for(Employee e : list) {
			try {
				e.setAccountNo(aes.decrypt(e.getAccountNo()));
			} catch (UnsupportedEncodingException | GeneralSecurityException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public int insertEmployee(Employee emp) {
		
		return employeeDAO.insertEmployee(emp);
	}

	@Override
	public int deleteEmployee(Employee emp) {
		
		return employeeDAO.deleteEmployee(emp);
	}

	@Override
	public int updateEmployee(Employee emp) {
		return employeeDAO.updateEmployee(emp);
	}

	@Override
	public Employee selectEmpOne(String empNo) {
		return employeeDAO.selectEmpOne(empNo);
	}

}
