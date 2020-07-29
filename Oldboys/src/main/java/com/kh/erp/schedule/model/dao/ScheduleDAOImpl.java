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
	public List<Schedule> selectListSchedule(int userNo) {
		
		return sqlSession.selectList("scheduleMapper.selectListSchedule", userNo);
	}

	@Override
	public Schedule selectOneSchedule(int scheduleNo) {
		
		return sqlSession.selectOne("scheduleMapper.selectOneSchedule", scheduleNo);
	}

	@Override
	public int updateSchedule(Schedule schedule) {
		
		return sqlSession.update("scheduleMapper.updateSchedule", schedule);
	}

	@Override
	public int deleteSchedule(int scheduleNo) {
		
		return sqlSession.delete("scheduleMapper.deleteSchedule", scheduleNo);
	}

}
