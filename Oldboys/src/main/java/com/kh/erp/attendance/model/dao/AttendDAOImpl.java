package com.kh.erp.attendance.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.attendance.model.vo.Attendance;



@Repository("attendDAO")
public class AttendDAOImpl implements AttendDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Attendance> selectAttendList(Attendance att) {
		return sqlSession.selectList("attendMapper.selectAttendList", att);
	}

	@Override
	public int insertAttend(Attendance att) {
		
		System.out.println(att);
		return sqlSession.insert("attendMapper.insertAttend", att);
	}

	@Override
	public int deleteAttend(Attendance att) {
		
		return sqlSession.delete("attendMapper.deleteAttend", att);
	}

	@Override
	public int updateAttend(Attendance att) {
		
		return sqlSession.update("attendMapper.updateAttend", att);
	}

}
