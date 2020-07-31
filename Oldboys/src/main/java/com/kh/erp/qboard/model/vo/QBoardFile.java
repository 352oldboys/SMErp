package com.kh.erp.qboard.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class QBoardFile implements Serializable{
	
	private static final long serialVersionUID = 4885L;

	
	private int qboardfileNo;
	private int qNo;
	private String originalFileName;
	private String renamedFileName;
	private Date uploadDate;
	private int downloadCount;
	private String status;
	public QBoardFile() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QBoardFile(int qboardfileNo, int qNo, String originalFileName, String renamedFileName, Date uploadDate,
			int downloadCount, String status) {
		super();
		this.qboardfileNo = qboardfileNo;
		this.qNo = qNo;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.uploadDate = uploadDate;
		this.downloadCount = downloadCount;
		this.status = status;
	}
	@Override
	public String toString() {
		return "QBoardFile [qboardfileNo=" + qboardfileNo + ", qNo=" + qNo + ", originalFileName=" + originalFileName
				+ ", renamedFileName=" + renamedFileName + ", uploadDate=" + uploadDate + ", downloadCount="
				+ downloadCount + ", status=" + status + "]";
	}
	public int getQboardfileNo() {
		return qboardfileNo;
	}
	public void setQboardfileNo(int qboardfileNo) {
		this.qboardfileNo = qboardfileNo;
	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getRenamedFileName() {
		return renamedFileName;
	}
	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public int getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
