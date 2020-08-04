package com.kh.erp.attendance.model.service;

import java.util.List;

import com.kh.erp.attendance.model.vo.Attendance;

public interface AttendService {
	static int TAX_SERVICE_ERROR = 0;
	static int TAX_SERVICE_COMPLETE = 1;
	
	List<Attendance> selectAttendList(Attendance att);

	int insertAttend(Attendance att);

	int deleteAttend(Attendance att);

	int updateAttend(Attendance att);
}
