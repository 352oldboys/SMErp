package com.kh.erp.attendance.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;


public class Attendance implements Serializable {
	
	private static final long serialVersionUID = 1010L;
	
	private int attendanceNo;
	private int userNo;
	private Date day;
	private int empNo;
	private String name;
	private String attendanceTime;
	private String leaveTime;
	private String absence;
	private String vacationPeriod1;
	private String vacationPeriod2;
	
	public Attendance() { }

	public Attendance(int attendanceNo, int userNo, Date day, int empNo, String name, String attendanceTime,
			String leaveTime, String absence, String vacationPeriod1, String vacationPeriod2) {
		super();
		this.attendanceNo = attendanceNo;
		this.userNo = userNo;
		this.day = day;
		this.empNo = empNo;
		this.name = name;
		this.attendanceTime = attendanceTime;
		this.leaveTime = leaveTime;
		this.absence = absence;
		this.vacationPeriod1 = vacationPeriod1;
		this.vacationPeriod2 = vacationPeriod2;
	}

	@Override
	public String toString() {
		return "Attendance [attendanceNo=" + attendanceNo + ", userNo=" + userNo + ", day=" + day + ", empNo=" + empNo
				+ ", name=" + name + ", attendanceTime=" + attendanceTime + ", leaveTime=" + leaveTime + ", absence="
				+ absence + ", vacationPeriod1=" + vacationPeriod1 + ", vacationPeriod2=" + vacationPeriod2 + "]";
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getAttendanceNo() {
		return attendanceNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public Date getDay() {
		return day;
	}

	public int getEmpNo() {
		return empNo;
	}

	public String getName() {
		return name;
	}

	public String getAttendanceTime() {
		return attendanceTime;
	}

	public String getLeaveTime() {
		return leaveTime;
	}

	public String getAbsence() {
		return absence;
	}

	public String getVacationPeriod1() {
		return vacationPeriod1;
	}

	public String getVacationPeriod2() {
		return vacationPeriod2;
	}

	public void setAttendanceNo(int attendanceNo) {
		this.attendanceNo = attendanceNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAttendanceTime(String attendanceTime) {
		this.attendanceTime = attendanceTime;
	}

	public void setLeaveTime(String leaveTime) {
		this.leaveTime = leaveTime;
	}

	public void setAbsence(String absence) {
		this.absence = absence;
	}

	public void setVacationPeriod1(String vacationPeriod1) {
		this.vacationPeriod1 = vacationPeriod1;
	}

	public void setVacationPeriod2(String vacationPeriod2) {
		this.vacationPeriod2 = vacationPeriod2;
	}
	
	
	
	
	
	
	
	
}