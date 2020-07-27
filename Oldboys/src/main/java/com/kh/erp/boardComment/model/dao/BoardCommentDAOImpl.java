package com.kh.erp.boardComment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.boardComment.model.vo.BoardComment;

@Repository
public class BoardCommentDAOImpl implements BoardCommentDAO{

	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertBoardComment(BoardComment boardcomment) {
		System.out.println("boardComment dao까지 잘왓음");
		System.out.println("boardcomment dao 값 확인 : "+boardcomment);
		return sqlSession.insert("boardcomment.insertBoardComment",boardcomment);
	}

	@Override
	public int selectBoardCommentTotalContents(BoardComment boardcomment) {
		System.out.println("boardComment dao까지 잘왓음");
		System.out.println("boardcomment dao 값 확인 : "+boardcomment);
		return sqlSession.selectOne("boardcomment.selectBoardCommentTotalContents", boardcomment);
	}

	@Override
	public List<BoardComment> selectBoardCommentList(BoardComment boardcomment) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardcomment.selectBoardCommentList", boardcomment);
	}

	@Override
	public int deleteBoardComment(int cno) {
		return sqlSession.update("boardcomment.deleteBoardComment", cno);
	}
}
