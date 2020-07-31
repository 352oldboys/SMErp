package com.kh.erp.qboard.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class QBoard implements Serializable{

	private static final long serialVersionUID = 486L;
	
	private int qNo;
	private String qTitle;
	private String qWriter;
	private String qContent;
	private Date qDate;
	private int readCount;
	private int fileCount;
	private List<QBoardFile> files = new ArrayList<QBoardFile>();
	public QBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QBoard(int qNo, String qTitle, String qWriter, String qContent, Date qDate, int readCount, int fileCount,
			List<QBoardFile> files) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qWriter = qWriter;
		this.qContent = qContent;
		this.qDate = qDate;
		this.readCount = readCount;
		this.fileCount = fileCount;
		this.files = files;
	}
	@Override
	public String toString() {
		return "QBoard [qNo=" + qNo + ", qTitle=" + qTitle + ", qWriter=" + qWriter + ", qContent=" + qContent
				+ ", qDate=" + qDate + ", readCount=" + readCount + ", fileCount=" + fileCount + ", files=" + files
				+ "]";
	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqWriter() {
		return qWriter;
	}
	public void setqWriter(String qWriter) {
		this.qWriter = qWriter;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public Date getqDate() {
		return qDate;
	}
	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getFileCount() {
		return fileCount;
	}
	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}
	public List<QBoardFile> getFiles() {
		return files;
	}
	public void setFiles(List<QBoardFile> files) {
		this.files = files;
	}
	
	
}
