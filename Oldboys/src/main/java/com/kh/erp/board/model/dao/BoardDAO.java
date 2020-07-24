package com.kh.erp.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.erp.board.model.vo.BoardFile;
import com.kh.erp.board.model.vo.Board;

public interface BoardDAO {
	
	 List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	   int selectBoardTotalContents();

	   int insertBoard(Board board);

	   int insertBoardFile(BoardFile b);

	   Board selectOneBoard(int bNo);

	   List<BoardFile> selectBoardFileList(int bNo);

	   int updateBoard(Board board);

	   int updateBoardFile(BoardFile b);

	   int deleteBoard(int bNo);

	   int deleteBoardFile(int bNo);

	   int deleteFile(int bfNo);
}
