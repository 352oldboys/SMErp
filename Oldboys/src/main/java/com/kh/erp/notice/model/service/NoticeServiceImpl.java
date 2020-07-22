package com.kh.erp.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.notice.model.dao.NoticeDAO;
import com.kh.erp.notice.model.exception.NoticeException;
import com.kh.erp.notice.model.vo.Attachment;
import com.kh.erp.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	NoticeDAO noticeDAO;
	
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		
		return noticeDAO.selectNoticeList(cPage, numPerPage);
	}

	@Override
	public int selectNoticeTotalContents() {
		
		return noticeDAO.selectNoticeTotalContents();
	}

	@Override
	public int insertNotice(Notice notice, List<Attachment> attachList) {
		int result = 0;
		int nNo = 0;
		
		try{
			result = noticeDAO.insertNotice(notice);
			if(result == NOTICE_SERVICE_ERROR) throw new NoticeException();
			
			nNo = notice.getnNo(); //boardNo를 리턴함.
			
			//현재 Attachment객체의 boardNo는 값이 없다. 
			//1. 가져온 boardNo를 대입하던지
			//2. mapper의 insert문에서 selectKey를 사용함
			if(attachList.size()>0){
				for(Attachment a : attachList){
					// a.setBoardNo(boardNo); //게시물번호 대입
					
					result = noticeDAO.insertAttachment(a);
					if(result == NOTICE_SERVICE_ERROR) throw new NoticeException();
				}
			}
		} catch(Exception e){
//			throw new BoardException("게시물등록오류");
			throw e;
		}
		return result;
	}

	@Override
	public Notice selectOneNotice(int nNo) {
		return noticeDAO.selectOneNotice(nNo);
	}

	@Override
	public List<Attachment> selectAttachmentList(int nNo) {
		return noticeDAO.selectAttachmentList(nNo);
	}

	@Override
	public int updateNotice(Notice notice, List<Attachment> attachList) {
		int result = 0;
		
		List<Attachment> originList = noticeDAO.selectAttachmentList(notice.getnNo());
		
		try {
		result = noticeDAO.updateNotice(notice);
		
		if(result == NOTICE_SERVICE_ERROR) throw new NoticeException();
		
		if(originList.size() > 0) { // 이전 첨부파일이 있다면 삭제처리하기
			result = noticeDAO.deleteAttachment(notice.getnNo());
			if(result == NOTICE_SERVICE_ERROR) throw new NoticeException();
		}
		
		if(attachList.size() > 0) { // 변경된 첨부파일이 있다면
			for(Attachment a : attachList) {
				result = noticeDAO.updateAttachment(a);
				
				if(result == NOTICE_SERVICE_ERROR) throw new NoticeException();
			}
		}
		
		}catch (Exception e) {
			throw new NoticeException("게시글 수정 오류 발생!" + e.getMessage());
		}
		return result;
	}

	@Override
	public int deleteNotice(int nNo) {
		int result = noticeDAO.deleteNotice(nNo);
		
		if( result == NOTICE_SERVICE_ERROR && noticeDAO.selectAttachmentList(nNo).size()>0)
			throw new NoticeException();
	
		else if(result > NOTICE_SERVICE_ERROR) result = NOTICE_SERVICE_COMPLETE;
		else throw new NoticeException("게시글 삭제 실패!");
			
		return result;
	}

	@Override
	public int deleteFile(int attNo) {

		return noticeDAO.deleteFile(attNo);
	}

}
