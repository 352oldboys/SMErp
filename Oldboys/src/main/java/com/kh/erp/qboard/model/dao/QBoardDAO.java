package com.kh.erp.qboard.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.erp.board.model.vo.Board;
import com.kh.erp.board.model.vo.BoardFile;
import com.kh.erp.qboard.model.vo.QBoard;
import com.kh.erp.qboard.model.vo.QBoardFile;

public interface QBoardDAO {

	
	List<Map<String, String>> selectQBoardList(int cPage, int numPerPage);

	   int selectQBoardTotalContents();

	   int insertQBoard(QBoard qboard);

	   int insertQBoardFile(QBoardFile q);

	   QBoard selectOneQBoard(int qNo);

	   List<QBoardFile> selectQBoardFileList(int qNo);

	   int updateQBoard(QBoard qboard);

	   int updateQBoardFile(QBoardFile q);

	   int deleteQBoard(int qNo);

	   int deleteQBoardFile(int qNo);

	   int deleteFile(int qfNo);
	   
}
