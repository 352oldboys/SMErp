package com.kh.erp.schedule.model.service;

import java.util.List;

import com.kh.erp.schedule.model.vo.Schedule;

public interface ScheduleService {

	static int BOARD_SERVICE_ERROR = 0;
	static int BOARD_SERVICE_COMPLETE = 1;
	
	int insertSchedule(Schedule schedule);
	
	List<Schedule> scheduleList(Schedule schedule);

	Schedule selectOneSchedule(int userNo);
	
}
