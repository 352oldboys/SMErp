package com.kh.erp.customer.model.dao;

import java.util.List;

import com.kh.erp.customer.model.vo.Customer;

public interface CustomerDAO {

	List<Customer> selectCustList(Customer emp);

	int insertCustomer(Customer emp);

	int deleteCustomer(Customer emp);

	int updateCustomer(Customer emp);
	
	

}
