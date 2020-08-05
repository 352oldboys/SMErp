package com.kh.erp.qboard.model.service;

import java.util.List;
import java.util.Map;

import com.kh.erp.qboard.model.vo.QBoard;
import com.kh.erp.qboard.model.vo.QBoardFile;

public interface QBoardService {

		static int BOARD_SERVICE_ERROR = 0;
	   static int BOARD_SERVICE_COMPLETE = 1;
	
	   List<Map<String, String>> selectQBoardList(String searchType, String keyword, int cPage, int numPerPage);

	   int selectQBoardTotalContents(String searchType, String keyword);

	   int insertQBoard(QBoard qboard, List<QBoardFile> fileList);

	   QBoard selectOneQBoard(int qNo);

	   List<QBoardFile> selectQBoardFileList(int qNo);

	   int updateQBoard(QBoard qboard, List<QBoardFile> fileList);
	   
	   int deleteQBoard(int qNo);

	   int deleteFile(int qfNo);
	   
}
