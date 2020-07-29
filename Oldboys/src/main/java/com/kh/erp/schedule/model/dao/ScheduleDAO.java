package com.kh.erp.schedule.model.dao;

import java.util.List;

import com.kh.erp.schedule.model.vo.Schedule;

public interface ScheduleDAO {
	
	int insertSchedule(Schedule schedule);

	List<Schedule> scheduleList(Schedule schedule);

	List<Schedule> selectListSchedule(int userNo);

	Schedule selectOneSchedule(int scheduleNo);

	int updateSchedule(Schedule schedule);

	int deleteSchedule(int scheduleNo);

}
