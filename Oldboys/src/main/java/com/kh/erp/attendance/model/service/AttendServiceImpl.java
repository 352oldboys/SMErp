package com.kh.erp.attendance.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.attendance.model.dao.AttendDAO;
import com.kh.erp.attendance.model.vo.Attendance;

@Service("attendService")
public class AttendServiceImpl implements AttendService {
	

	@Autowired
	AttendDAO attendDAO;

	@Override
	public List<Attendance> selectAttendList(Attendance att) {
		
		return attendDAO.selectAttendList(att);
	}

	@Override
	public int insertAttend(Attendance att) {
		
		return attendDAO.insertAttend(att);
	}

	@Override
	public int deleteAttend(Attendance att) {
		
		return attendDAO.insertAttend(att);
	}

	@Override
	public int updateAttend(Attendance att) {
		
		return attendDAO.insertAttend(att);
	}

}
