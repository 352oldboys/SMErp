package com.kh.erp.employee.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.employee.model.vo.Employee;

@Repository("employeeDAO")
public class EmployeeDAOImpl implements EmployeeDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Employee> selectEmpList(Employee emp) {
		
		return sqlSession.selectList("employeeMapper.selectEmpList", emp);
	}

	@Override
	public int insertEmployee(Employee emp) {
		
		return sqlSession.insert("employeeMapper.insertEmp", emp);
	}

}
