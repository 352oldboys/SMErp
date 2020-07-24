package com.kh.erp.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BoardFile implements Serializable{
	
	private static final long serialVersionUID = 4885L;
	
	private int boardfileNo;
	private int bNo;
	private String originalFileName;
	private String renamedFileName;
	private Date uploadDate;
	private int downloadCount;
	private String status;
	
	public BoardFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardFile(int boardfileNo, int bNo, String originalFileName, String renamedFileName, Date uploadDate,
			int downloadCount, String status) {
		super();
		this.boardfileNo = boardfileNo;
		this.bNo = bNo;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.uploadDate = uploadDate;
		this.downloadCount = downloadCount;
		this.status = status;
	}

	@Override
	public String toString() {
		return "BoardFile [boardfileNo=" + boardfileNo + ", bNo=" + bNo + ", originalFileName=" + originalFileName
				+ ", renamedFileName=" + renamedFileName + ", uploadDate=" + uploadDate + ", downloadCount="
				+ downloadCount + ", status=" + status + "]";
	}

	public int getBoardfileNo() {
		return boardfileNo;
	}

	public void setBoardfileNo(int boardfileNo) {
		this.boardfileNo = boardfileNo;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
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