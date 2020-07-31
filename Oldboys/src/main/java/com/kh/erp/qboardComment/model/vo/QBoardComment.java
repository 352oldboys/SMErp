package com.kh.erp.qboardComment.model.vo;

import java.io.Serializable;

public class QBoardComment implements Serializable{

	private static final long serialVersionUID = 486L;

	private int qcno;
	private int userNo;
	private int qNo;
	private String qcontent;
	private int qlevel;
	private String qdate;
	private String qdelete;
	private int refcno;
	
	public QBoardComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QBoardComment(int qcno, int userNo, int qNo, String qcontent, int qlevel, String qdate, String qdelete,
			int refcno) {
		super();
		this.qcno = qcno;
		this.userNo = userNo;
		this.qNo = qNo;
		this.qcontent = qcontent;
		this.qlevel = qlevel;
		this.qdate = qdate;
		this.qdelete = qdelete;
		this.refcno = refcno;
	}
	@Override
	public String toString() {
		return "QBoardComment [qcno=" + qcno + ", userNo=" + userNo + ", qNo=" + qNo + ", qcontent=" + qcontent
				+ ", qlevel=" + qlevel + ", qdate=" + qdate + ", qdelete=" + qdelete + ", refcno=" + refcno + "]";
	}
	public int getQcno() {
		return qcno;
	}
	public void setQcno(int qcno) {
		this.qcno = qcno;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public int getQlevel() {
		return qlevel;
	}
	public void setQlevel(int qlevel) {
		this.qlevel = qlevel;
	}
	public String getQdate() {
		return qdate;
	}
	public void setQdate(String qdate) {
		this.qdate = qdate;
	}
	public String getQdelete() {
		return qdelete;
	}
	public void setQdelete(String qdelete) {
		this.qdelete = qdelete;
	}
	public int getRefcno() {
		return refcno;
	}
	public void setRefcno(int refcno) {
		this.refcno = refcno;
	}
	
	
}
