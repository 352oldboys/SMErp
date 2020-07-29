package com.kh.erp.schedule.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.schedule.model.dao.ScheduleDAO;
import com.kh.erp.schedule.model.vo.Schedule;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	ScheduleDAO scheduleDAO;

	@Override
	public int insertSchedule(Schedule schedule) {
		
		return scheduleDAO.insertSchedule(schedule);
		
	}

	@Override
	public List<Schedule> scheduleList(Schedule schedule) {
				
		return scheduleDAO.scheduleList(schedule);
	}

	@Override
	public List<Schedule> selectListSchedule(int userNo) {
		
		return scheduleDAO.selectListSchedule(userNo);
	}

	@Override
	public Schedule selectOneSchedule(int scheduleNo) {
		
		return scheduleDAO.selectOneSchedule(scheduleNo);
	}

	@Override
	public int updateSchedule(Schedule schedule) {
		
		return scheduleDAO.updateSchedule(schedule);
	}

	@Override
	public int deleteSchedule(int scheduleNo) {
		
		return scheduleDAO.deleteSchedule(scheduleNo);
	}

}
