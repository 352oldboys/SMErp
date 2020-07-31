package com.kh.erp.qboardComment.model.dao;

import java.util.List;

import com.kh.erp.qboardComment.model.vo.QBoardComment;

public interface QBoardCommentDAO {

	//게시물 추가
	int insertQBoardComment(QBoardComment qboardcomment);
	
	//게시글 총개수 - 페이징 처리 - 반드시 cate2를 넘겨줘야한다 그래야 매개변수로 오는 cate2를 조회한다.
	int selectQBoardCommentTotalContents(QBoardComment qboardcomment);
	
	//게시물 리스트조회
	List<QBoardComment> selectQBoardCommentList(int qNo);
	
	//게시물 삭제
	int deleteQBoardComment(int qcno);
}
