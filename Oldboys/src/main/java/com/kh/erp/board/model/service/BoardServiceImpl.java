package com.kh.erp.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.board.model.dao.BoardDAO;
import com.kh.erp.board.model.exception.BoardException;
import com.kh.erp.board.model.vo.Attachment;
import com.kh.erp.board.model.vo.Board;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		
		return boardDAO.selectBoardList(cPage, numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {
		
		return boardDAO.selectBoardTotalContents();
	}

	@Override
	public int insertBoard(Board board, List<Attachment> attachList) {
		int result = 0;
		int boardNo = 0;
		
		try{
			result = boardDAO.insertBoard(board);
			if(result == BOARD_SERVICE_ERROR) throw new BoardException();
			
			boardNo = board.getBoardNo(); //boardNo를 리턴함.
			
			//현재 Attachment객체의 boardNo는 값이 없다. 
			//1. 가져온 boardNo를 대입하던지
			//2. mapper의 insert문에서 selectKey를 사용함
			if(attachList.size()>0){
				for(Attachment a : attachList){
					// a.setBoardNo(boardNo); //게시물번호 대입
					
					result = boardDAO.insertAttachment(a);
					if(result == BOARD_SERVICE_ERROR) throw new BoardException();
				}
			}
		} catch(Exception e){
//			throw new BoardException("게시물등록오류");
			throw e;
		}
		return result;
	}

	@Override
	public Board selectOneBoard(int boardNo) {
		return boardDAO.selectOneBoard(boardNo);
	}

	@Override
	public List<Attachment> selectAttachmentList(int boardNo) {
		return boardDAO.selectAttachmentList(boardNo);
	}

	@Override
	public int updateBoard(Board board, List<Attachment> attachList) {
		int result = 0;
		
		List<Attachment> originList = boardDAO.selectAttachmentList(board.getBoardNo());
		
		try {
		result = boardDAO.updateBoard(board);
		
		if(result == BOARD_SERVICE_ERROR) throw new BoardException();
		
		if(originList.size() > 0) { // 이전 첨부파일이 있다면 삭제처리하기
			result = boardDAO.deleteAttachment(board.getBoardNo());
			if(result == BOARD_SERVICE_ERROR) throw new BoardException();
		}
		
		if(attachList.size() > 0) { // 변경된 첨부파일이 있다면
			for(Attachment a : attachList) {
				result = boardDAO.updateAttachment(a);
				
				if(result == BOARD_SERVICE_ERROR) throw new BoardException();
			}
		}
		
		}catch (Exception e) {
			throw new BoardException("게시글 수정 오류 발생!" + e.getMessage());
		}
		return result;
	}

	@Override
	public int deleteBoard(int boardNo) {
		int result = boardDAO.deleteBoard(boardNo);
		
		if( result == BOARD_SERVICE_ERROR && boardDAO.selectAttachmentList(boardNo).size()>0)
			throw new BoardException();
	
		else if(result > BOARD_SERVICE_ERROR) result = BOARD_SERVICE_COMPLETE;
		else throw new BoardException("게시글 삭제 실패!");
			
		return result;
	}

	@Override
	public int deleteFile(int attNo) {

		return boardDAO.deleteFile(attNo);
	}

}
