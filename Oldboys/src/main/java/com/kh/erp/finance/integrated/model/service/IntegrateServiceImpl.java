package com.kh.erp.finance.integrated.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.employee.model.dao.EmployeeDAO;
import com.kh.erp.finance.integrated.model.dao.IntegrateDAO;
import com.kh.erp.finance.integrated.model.vo.Integrate;
import com.kh.erp.finance.integrated.model.vo.Total;

@Service("integrateService")
public class IntegrateServiceImpl implements IntegrateService {

	@Autowired
	IntegrateDAO integrateDAO;
	
	@Override
	public List<Integrate> selectTotalList(int userNo) {
		// TODO Auto-generated method stub
		return integrateDAO.selectTotalList(userNo);
	}

	@Override
	public List<Total> selectToList(int userNo) {
		// TODO Auto-generated method stub
		return integrateDAO.selectToList(userNo);
	}

	
}
