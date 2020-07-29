package com.kh.erp.schedule.model.vo;

public class Schedule {
	
	private int userNo;
	private int scheduleNo;
	private String allDay;
	private String title;
	private String startDate;
	private String endDate;
	private String color;
	private String content;
	
	public Schedule() {
		super();
	}

	public Schedule(int userNo, int scheduleNo, String allDay, String title, String startDate, String endDate,
			String color, String content) {
		super();
		this.userNo = userNo;
		this.scheduleNo = scheduleNo;
		this.allDay = allDay;
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.color = color;
		this.content = content;
	}

	@Override
	public String toString() {
		return "Schedule [userNo=" + userNo + ", scheduleNo=" + scheduleNo + ", allDay=" + allDay + ", title=" + title
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", color=" + color + ", content=" + content
				+ "]";
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public String getAllDay() {
		return allDay;
	}

	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	

	}