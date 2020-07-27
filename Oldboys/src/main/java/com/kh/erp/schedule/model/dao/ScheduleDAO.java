package com.kh.erp.schedule.model.dao;

import java.util.List;

import com.kh.erp.schedule.model.vo.Schedule;

public interface ScheduleDAO {
	
	int insertSchedule(Schedule schedule);

	List<Schedule> scheduleList(Schedule schedule);

	Schedule selectOneSchedule(int userNo);

}
