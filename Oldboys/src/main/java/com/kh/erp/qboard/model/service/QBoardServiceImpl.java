package com.kh.erp.qboard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.qboard.model.exception.QBoardException;
import com.kh.erp.qboard.model.vo.QBoard;
import com.kh.erp.qboard.model.vo.QBoardFile;
import com.kh.erp.qboard.model.dao.QBoardDAO;


@Service("qboardService")
public class QBoardServiceImpl implements QBoardService{

	@Autowired
	QBoardDAO qboardDAO;
	

	@Override
	public List<Map<String, String>> selectQBoardList(int cPage, int numPerPage) {
		
		return qboardDAO.selectQBoardList(cPage, numPerPage);
	}
	@Override
	public int selectQBoardTotalContents() {
		
		return qboardDAO.selectQBoardTotalContents();
	
}
	@Override
	public int insertQBoard(QBoard qboard, List<QBoardFile> fileList) {
		int result = 0;
		int qNo = 0;
		
		try{
			result = qboardDAO.insertQBoard(qboard);
			if(result == BOARD_SERVICE_ERROR) throw new QBoardException();
			
			qNo = qboard.getqNo();
			
			if(fileList.size()>0){
				for(QBoardFile q : fileList){
					
					
					result = qboardDAO.insertQBoardFile(q);
					if(result == BOARD_SERVICE_ERROR) throw new QBoardException();
				}
			}
		} catch(Exception e){
//			throw new BoardException("게시물등록오류");
			throw e;
		}
		return result;
}
	
	@Override
	public QBoard selectOneQBoard(int qNo) {
		return qboardDAO.selectOneQBoard(qNo);
	}

	@Override
	public List<QBoardFile> selectQBoardFileList(int qNo) {
		return qboardDAO.selectQBoardFileList(qNo);
	}
	
	@Override
	public int updateQBoard(QBoard qboard, List<QBoardFile> fileList) {
		int result = 0;
		
		List<QBoardFile> originList = qboardDAO.selectQBoardFileList(qboard.getqNo());
		
		try {
		result = qboardDAO.updateQBoard(qboard);
		
		if(result == BOARD_SERVICE_ERROR) throw new QBoardException();
		
		if(originList.size() > 0) { // 이전 첨부파일이 있다면 삭제처리하기
			result = qboardDAO.deleteQBoardFile(qboard.getqNo());
			if(result == BOARD_SERVICE_ERROR) throw new QBoardException();
		}
		
		if(fileList.size() > 0) { // 변경된 첨부파일이 있다면
			for(QBoardFile q : fileList) {
				result = qboardDAO.updateQBoardFile(q);
				
				if(result == BOARD_SERVICE_ERROR) throw new QBoardException();
			}
		}
		
		}catch (Exception e) {
			throw new QBoardException("게시글 수정 오류 발생!" + e.getMessage());
		}
		return result;
	}
	@Override
	public int deleteQBoard(int qNo) {
		int result = qboardDAO.deleteQBoard(qNo);
		
		if( result == BOARD_SERVICE_ERROR && qboardDAO.selectQBoardFileList(qNo).size()>0)
			throw new QBoardException();
	
		else if(result > BOARD_SERVICE_ERROR) result = BOARD_SERVICE_COMPLETE;
		else throw new QBoardException("게시글 삭제 실패!");
			
		return result;
}
	
	@Override
	public int deleteFile(int qfNo) {

		return qboardDAO.deleteFile(qfNo);
	}
	
}
	
