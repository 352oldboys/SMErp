package com.kh.erp.qboardComment.model.service;

import java.util.List;

import com.kh.erp.qboardComment.model.vo.QBoardComment;

public interface QBoardCommentService {

	//게시물 추가
	int insertQBoardComment(QBoardComment qboardcomment);

	//게시글 총개수 
	int selectQBoardCommentTotalContents(QBoardComment qboardcomment);
	
	//게시물 리스트조회
	List<QBoardComment> selectQBoardCommentList(int no);
	
	//게시물 삭제
	int deleteQBoardComment(int qcno);
	
}
