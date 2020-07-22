package com.kh.erp.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.erp.notice.model.vo.Attachment;
import com.kh.erp.notice.model.vo.Notice;

public interface NoticeService {

	static int NOTICE_SERVICE_ERROR = 0;
	   static int NOTICE_SERVICE_COMPLETE = 1;
	   
	   List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);

	   int selectNoticeTotalContents();

	   int insertNotice(Notice notice, List<Attachment> attachList);

	   Notice selectOneNotice(int nNo);

	   List<Attachment> selectAttachmentList(int nNo);

	   int updateNotice(Notice notice, List<Attachment> attachList);
	   
	   int deleteNotice(int nNo);

	   int deleteFile(int attNo);
}
