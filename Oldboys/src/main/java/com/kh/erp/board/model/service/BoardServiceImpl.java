  package com.kh.erp.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.board.model.dao.BoardDAO;
import com.kh.erp.board.model.exception.BoardException;
import com.kh.erp.board.model.vo.BoardFile;
import com.kh.erp.board.model.vo.Board;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public List<Map<String, String>> selectBoardList(String searchType, String keyword, int cPage, int numPerPage) {
		
		if(searchType != null && (searchType.length()>0 && !searchType.equals("null"))) {
	         
	         return boardDAO.searchSelectList(searchType, keyword, cPage, numPerPage);
	         
	      } else {
	         
	         return boardDAO.selectBoardList(cPage, numPerPage);
	         
	      }
		
	}

	@Override
	public int selectBoardTotalContents(String searchType, String keyword) {
		
		if(searchType != null && (searchType.length()>0 && !searchType.equals("null"))) {
	         
	         return boardDAO.searchSelectListCount(searchType, keyword);
	         
	      } else {
	         
	         return boardDAO.selectBoardTotalContents();
	         
	      }
	      
	}

	@Override
	public int insertBoard(Board board, List<BoardFile> fileList) {
		int result = 0;
		int bNo = 0;
		
		try{
			result = boardDAO.insertBoard(board);
			if(result == BOARD_SERVICE_ERROR) throw new BoardException();
			
			bNo = board.getbNo(); //boardNo를 리턴함.
			
			if(fileList.size()>0){
				for(BoardFile b : fileList){
					
					
					result = boardDAO.insertBoardFile(b);
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
	public Board selectOneBoard(int bNo) {
		return boardDAO.selectOneBoard(bNo);
	}

	@Override
	public List<BoardFile> selectBoardFileList(int bNo) {
		return boardDAO.selectBoardFileList(bNo);
	}

	@Override
	public int updateBoard(Board board, List<BoardFile> fileList) {
		int result = 0;
		
		List<BoardFile> originList = boardDAO.selectBoardFileList(board.getbNo());
		
		try {
		result = boardDAO.updateBoard(board);
		
		if(result == BOARD_SERVICE_ERROR) throw new BoardException();
		
		if(originList.size() > 0) { // 이전 첨부파일이 있다면 삭제처리하기
			result = boardDAO.deleteBoardFile(board.getbNo());
			if(result == BOARD_SERVICE_ERROR) throw new BoardException();
		}
		
		if(fileList.size() > 0) { // 변경된 첨부파일이 있다면
			for(BoardFile b : fileList) {
				result = boardDAO.updateBoardFile(b);
				
				if(result == BOARD_SERVICE_ERROR) throw new BoardException();
			}
		}
		
		}catch (Exception e) {
			throw new BoardException("게시글 수정 오류 발생!" + e.getMessage());
		}
		return result;
	}

	@Override
	public int deleteBoard(int bNo) {
		int result = boardDAO.deleteBoard(bNo);
		
		if( result == BOARD_SERVICE_ERROR && boardDAO.selectBoardFileList(bNo).size()>0)
			throw new BoardException();
	
		else if(result > BOARD_SERVICE_ERROR) result = BOARD_SERVICE_COMPLETE;
		else throw new BoardException("게시글 삭제 실패!");
			
		return result;
	}

	@Override
	public int deleteFile(int bfNo) {

		return boardDAO.deleteFile(bfNo);
	}

}
