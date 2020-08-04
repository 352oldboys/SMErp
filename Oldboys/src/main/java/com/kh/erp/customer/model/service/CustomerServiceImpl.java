package com.kh.erp.customer.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.customer.model.dao.CustomerDAO;
import com.kh.erp.customer.model.vo.Customer;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDAO customerDAO;
	
	@Override
	public List<Customer> selectCustList(Customer cust) {
		
		return customerDAO.selectCustList(cust);
	}

	@Override
	public int insertCustomer(Customer cust) {
		
		return customerDAO.insertCustomer(cust);
	}

	@Override
	public int deleteCustomer(Customer cust) {
		
		return customerDAO.deleteCustomer(cust);
	}

	@Override
	public int updateCustomer(Customer cust) {
		return customerDAO.updateCustomer(cust);
	}

}
