package com.kh.erp.boardComment.model.service;

import java.util.List;

import com.kh.erp.boardComment.model.vo.BoardComment;

public interface BoardCommentService {
	
		//게시물 추가
			int insertBoardComment(BoardComment boardcomment);

			//게시글 총개수 
			int selectBoardCommentTotalContents(BoardComment boardcomment);
			
			//게시물 리스트조회
			List<BoardComment> selectBoardCommentList(int no);
			
			//게시물 삭제
			int deleteBoardComment(int cno);
			
}
