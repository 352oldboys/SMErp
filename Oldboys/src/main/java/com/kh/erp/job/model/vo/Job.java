package com.kh.erp.job.model.vo;

import java.io.Serializable;

public class Job implements Serializable {
	
	private static final long serialVersionUID = 1011L;
	
	private String jobCode;
	private String jobName;
	private int userNo;
	
	public Job() { }
	
	public Job(String jobCode, String jobName, int userNo) {
		super();
		this.jobCode = jobCode;
		this.jobName = jobName;
		this.userNo = userNo;
	}
	
	@Override
	public String toString() {
		return "Job [jobCode=" + jobCode + ", jobName=" + jobName + ", userNo=" + userNo + "]";
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getJobCode() {
		return jobCode;
	}
	public String getJobName() {
		return jobName;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
	
	


	
}