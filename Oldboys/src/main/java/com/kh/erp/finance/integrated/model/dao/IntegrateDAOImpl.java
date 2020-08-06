package com.kh.erp.finance.integrated.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.finance.integrated.model.vo.Integrate;
import com.kh.erp.finance.integrated.model.vo.Total;

@Repository("integrateDAO")
public class IntegrateDAOImpl implements IntegrateDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Integrate> selectTotalList(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("integrateMapper.selectTotalList", userNo);
	}
	
	@Override
	public  List<Total> selectToList(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("integrateMapper.selectToList", userNo);
}

}
