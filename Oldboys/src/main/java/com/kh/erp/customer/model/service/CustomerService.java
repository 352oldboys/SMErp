package com.kh.erp.customer.model.service;

import java.util.List;

import com.kh.erp.customer.model.vo.Customer;


public interface CustomerService {
	static int EMPLOYEE_SERVICE_ERROR = 0;
	static int EMPLOYEE_SERVICE_COMPLETE = 1;

	List<Customer> selectCustList(Customer cust);

	int insertCustomer(Customer cust);

	int deleteCustomer(Customer cust);

	int updateCustomer(Customer cust);

	Customer selectCustOne(String businessCode);


	
	
}
