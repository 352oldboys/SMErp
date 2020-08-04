package com.kh.erp.customer.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.customer.model.vo.Customer;

@Repository("customerDAO")
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Customer> selectCustList(Customer cust) {
		
		return sqlSession.selectList("customerMapper.selectCustList", cust);
	}

	@Override
	public int insertCustomer(Customer cust) {
		
		return sqlSession.insert("customerMapper.insertCust", cust);
	}

	@Override
	public int deleteCustomer(Customer cust) {
		return sqlSession.delete("customerMapper.deleteCust", cust);
	}

	@Override
	public int updateCustomer(Customer cust) {
		return sqlSession.update("customerMapper.updateCust", cust);
	}

}
