package com.kh.erp.boardComment.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class BoardComment implements Serializable{

	private static final long serialVersionUID = 486L;

	private int cno;
	private int userNo;
	private int bNo;
	private String ccontent;
	private int clevel;
	private String bcdate;
	private String bcdelete;
	private int refcno;
	public BoardComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardComment(int cno, int userNo, int bNo, String ccontent, int clevel, String bcdate, String bcdelete,
			int refcno) {
		super();
		this.cno = cno;
		this.userNo = userNo;
		this.bNo = bNo;
		this.ccontent = ccontent;
		this.clevel = clevel;
		this.bcdate = bcdate;
		this.bcdelete = bcdelete;
		this.refcno = refcno;
	}
	
	
	public BoardComment(int bNo) {
		super();
		this.bNo = bNo;
	}
	@Override
	public String toString() {
		return "BoardComment [cno=" + cno + ", userNo=" + userNo + ", bNo=" + bNo + ", ccontent=" + ccontent
				+ ", clevel=" + clevel + ", bcdate=" + bcdate + ", bcdelete=" + bcdelete + ", refcno=" + refcno + "]";
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public int getClevel() {
		return clevel;
	}
	public void setClevel(int clevel) {
		this.clevel = clevel;
	}
	public String getBcdate() {
		return bcdate;
	}
	public void setBcdate(String bcdate) {
		this.bcdate = bcdate;
	}
	public String getBcdelete() {
		return bcdelete;
	}
	public void setBcdelete(String bcdelete) {
		this.bcdelete = bcdelete;
	}
	public int getRefcno() {
		return refcno;
	}
	public void setRefcno(int refcno) {
		this.refcno = refcno;
	}
	
	
	
	

}