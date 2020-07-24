package com.kh.erp.schedule.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.schedule.model.vo.Schedule;

@Repository("scheduleDAO")
public class ScheduleDAOImpl implements ScheduleDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertSchedule(Schedule schedule) {
		
		return sqlSession.insert("scheduleMapper.insertSchedule", schedule);
		
	}

	@Override
	public List<Schedule> scheduleList(Schedule schedule) {
				
		return sqlSession.selectList("scheduleMapper.selectScheduleList", schedule);
	}

	@Override
	public Schedule selectOneSchedule(int userNo) {
		
		return sqlSession.selectOne("scheduleMapper.selectOneSchedule", userNo);
	}

}
