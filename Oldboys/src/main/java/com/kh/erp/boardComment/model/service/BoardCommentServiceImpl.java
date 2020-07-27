package com.kh.erp.boardComment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.boardComment.model.dao.BoardCommentDAO;
import com.kh.erp.boardComment.model.vo.BoardComment;

@Service
public class BoardCommentServiceImpl implements BoardCommentService{

	@Autowired
	public BoardCommentDAO boardcommentDAO;
	
	@Override
	public int insertBoardComment(BoardComment boardcomment) {
		System.out.println("boardComment service까지 잘왓음");
		System.out.println("boardcomment service 값 확인 : "+boardcomment);
		return boardcommentDAO.insertBoardComment(boardcomment);
	}

	@Override
	public int selectBoardCommentTotalContents(BoardComment boardcomment) {
		// TODO Auto-generated method stub
		return boardcommentDAO.selectBoardCommentTotalContents(boardcomment);
	}

	@Override
	public List<BoardComment> selectBoardCommentList(BoardComment boardcomment) {
		// TODO Auto-generated method stub
		return boardcommentDAO.selectBoardCommentList(boardcomment);
	}

	@Override
	public int deleteBoardComment(int cno) {
		return boardcommentDAO.deleteBoardComment(cno);
	}
}
