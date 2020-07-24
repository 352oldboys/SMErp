package com.kh.erp.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.kh.erp.notice.model.vo.Attachment;

public class Notice implements Serializable{
	
private static final long serialVersionUID = 486L;
	
	private int nNo;
	private String nTitle;
	private String nWriter;
	private String nContent;
	private Date nDate;
	private int readCount;
	private int fileCount;
	private List<Attachment> files = new ArrayList<Attachment>();
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(int nNo, String nTitle, String nWriter, String nContent, Date nDate, int readCount, int fileCount,
			List<Attachment> files) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nWriter = nWriter;
		this.nContent = nContent;
		this.nDate = nDate;
		this.readCount = readCount;
		this.fileCount = fileCount;
		this.files = files;
	}
	@Override
	public String toString() {
		return "Notice [nNo=" + nNo + ", nTitle=" + nTitle + ", nWriter=" + nWriter + ", nContent=" + nContent
				+ ", nDate=" + nDate + ", readCount=" + readCount + ", fileCount=" + fileCount + ", files=" + files
				+ "]";
	}
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnWriter() {
		return nWriter;
	}
	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public Date getnDate() {
		return nDate;
	}
	public void setnDate(Date nDate) {
		this.nDate = nDate;
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
	public List<Attachment> getFiles() {
		return files;
	}
	public void setFiles(List<Attachment> files) {
		this.files = files;
	}

	
}
