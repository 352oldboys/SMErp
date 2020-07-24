package com.kh.erp.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.erp.board.model.vo.BoardFile;
import com.kh.erp.board.model.vo.Board;

public interface BoardService {
		// 만약 에러 결과 등의 0, 1 들을
		// 숫자 이외의 역할로 사용한다면
		// 직접 상수로 등록하여 실수로 
		//숫자 계산에 포함되지 않도록 한다.
		static int BOARD_SERVICE_ERROR = 0;
	   static int BOARD_SERVICE_COMPLETE = 1;
	   
	   List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	   int selectBoardTotalContents();

	   int insertBoard(Board board, List<BoardFile> fileList);

	   Board selectOneBoard(int bNo);

	   List<BoardFile> selectBoardFileList(int bNo);

	   int updateBoard(Board board, List<BoardFile> fileList);
	   
	   int deleteBoard(int bNo);

	   int deleteFile(int bfNo);
}
