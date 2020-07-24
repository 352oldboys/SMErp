package com.kh.erp.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable{
	
	private static final long serialVersionUID = 4885L;

	private int attachmentNo;
	private int nNo;
	private String originalFileName;
	private String renamedFileName;
	private Date uploadDate;
	private int downloadCount;
	private String status;
	
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Attachment(int attachmentNo, int nNo, String originalFileName, String renamedFileName, Date uploadDate,
			int downloadCount, String status) {
		super();
		this.attachmentNo = attachmentNo;
		this.nNo = nNo;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.uploadDate = uploadDate;
		this.downloadCount = downloadCount;
		this.status = status;
	}
	@Override
	public String toString() {
		return "Attachment [attachmentNo=" + attachmentNo + ", nNo=" + nNo + ", originalFileName=" + originalFileName
				+ ", renamedFileName=" + renamedFileName + ", uploadDate=" + uploadDate + ", downloadCount="
				+ downloadCount + ", status=" + status + "]";
	}
	public int getAttachmentNo() {
		return attachmentNo;
	}
	public void setAttachmentNo(int attachmentNo) {
		this.attachmentNo = attachmentNo;
	}
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
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
