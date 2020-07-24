package com.kh.erp.board.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.kh.erp.board.model.vo.BoardFile;

public class Board implements Serializable{

	private static final long serialVersionUID = 486L;
	
	private int bNo;
	private String bTitle;
	private String bWriter;
	private String bContent;
	private Date bDate;
	private int readCount;
	private int fileCount;
	private List<BoardFile> files = new ArrayList<BoardFile>();
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Board(int bNo, String bTitle, String bWriter, String bContent, Date bDate, int readCount, int fileCount,
			List<BoardFile> files) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.bContent = bContent;
		this.bDate = bDate;
		this.readCount = readCount;
		this.fileCount = fileCount;
		this.files = files;
	}
	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bWriter=" + bWriter + ", bContent=" + bContent
				+ ", bDate=" + bDate + ", readCount=" + readCount + ", fileCount=" + fileCount + ", files=" + files
				+ "]";
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
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
	public List<BoardFile> getFiles() {
		return files;
	}
	public void setFiles(List<BoardFile> files) {
		this.files = files;
	}
	



}
