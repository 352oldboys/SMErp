package com.kh.erp.customer.model.dao;

import java.util.List;

import com.kh.erp.customer.model.vo.Customer;

public interface CustomerDAO {

	List<Customer> selectCustList(Customer cust);

	int insertCustomer(Customer cust);

	int deleteCustomer(Customer cust);

	int updateCustomer(Customer cust);

	Customer selectCustOne(String businessCode);
	
	

}
