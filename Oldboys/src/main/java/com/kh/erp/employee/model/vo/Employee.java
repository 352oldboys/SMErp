package com.kh.erp.employee.model.vo;

import java.io.Serializable;
import java.sql.Date;


public class Employee implements Serializable {

	private static final long serialVersionUID = 1007L;

	private int empNo;
	private int userNo;
	private String jobCode;
	private String name;
	private String phone;
	private int age;
	private String email;
	private String gender;
	private int salary;
	private String status;
	private String hireDate;
	private String leaveDate;
	private String bank;
	private String accountNo;
	
	public Employee() {	}

	public Employee(int empNo, int userNo, String jobCode, String name, String phone, int age, String email,
			String gender, int salary, String status, String hireDate, String leaveDate, String bank,
			String accountNo) {
		super();
		this.empNo = empNo;
		this.userNo = userNo;
		this.jobCode = jobCode;
		this.name = name;
		this.phone = phone;
		this.age = age;
		this.email = email;
		this.gender = gender;
		this.salary = salary;
		this.status = status;
		this.hireDate = hireDate;
		this.leaveDate = leaveDate;
		this.bank = bank;
		this.accountNo = accountNo;
	}

	@Override
	public String toString() {
		return "Employee [empNo=" + empNo + ", userNo=" + userNo + ", jobCode=" + jobCode + ", name=" + name
				+ ", phone=" + phone + ", age=" + age + ", email=" + email + ", gender=" + gender + ", salary=" + salary
				+ ", status=" + status + ", hireDate=" + hireDate + ", leaveDate=" + leaveDate + ", bank=" + bank
				+ ", accountNo=" + accountNo + "]";
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getEmpNo() {
		return empNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public String getJobCode() {
		return jobCode;
	}

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	public int getAge() {
		return age;
	}

	public String getEmail() {
		return email;
	}

	public String getGender() {
		return gender;
	}

	public int getSalary() {
		return salary;
	}

	public String getStatus() {
		return status;
	}

	public String getHireDate() {
		return hireDate;
	}

	public String getLeaveDate() {
		return leaveDate;
	}

	public String getBank() {
		return bank;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	

}
