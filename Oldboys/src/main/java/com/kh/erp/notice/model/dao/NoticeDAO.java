package com.kh.erp.notice.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.erp.notice.model.vo.Attachment;
import com.kh.erp.notice.model.vo.Notice;

public interface NoticeDAO {

	 List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);

	   int selectNoticeTotalContents();

	   int insertNotice(Notice notice);

	   int insertAttachment(Attachment a);

	   Notice selectOneNotice(int nNo);

	   List<Attachment> selectAttachmentList(int nNo);

	   int updateNotice(Notice notice);

	   int updateAttachment(Attachment a);

	   int deleteNotice(int nNo);

	   int deleteAttachment(int nNo);

	   int deleteFile(int attNo);
}

