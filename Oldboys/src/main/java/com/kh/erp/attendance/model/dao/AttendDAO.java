package com.kh.erp.attendance.model.dao;

import java.util.List;

import com.kh.erp.attendance.model.vo.Attendance;

public interface AttendDAO {
	
	List<Attendance> selectAttendList(Attendance att);

	int insertAttend(Attendance att);

	int deleteAttend(Attendance att);

	int updateAttend(Attendance att);
}
