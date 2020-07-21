package com.kh.erp.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.board.model.vo.Attachment;
import com.kh.erp.board.model.vo.Board;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("boardMapper.selectBoardList", null, rows);
	}

	@Override
	public int selectBoardTotalContents() {
		return sqlSession.selectOne("boardMapper.selectBoardTotalContent");
	}

	@Override
	   public int insertBoard(Board board) {
	      return sqlSession.insert("boardMapper.insertBoard", board);
	   }

	   @Override
	   public int insertAttachment(Attachment a) {
	      return sqlSession.insert("boardMapper.insertAttachment", a);
	   }

	@Override
	public Board selectOneBoard(int boardNo) {
		return sqlSession.selectOne("boardMapper.selectOneBoard", boardNo);
	}

	@Override
	public List<Attachment> selectAttachmentList(int boardNo) {
		return sqlSession.selectList("boardMapper.selectAttachmentList", boardNo);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.update("boardMapper.updateBoard", board);
	}

	@Override
	public int updateAttachment(Attachment a) {
		return sqlSession.insert("boardMapper.updateAttachment", a);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return sqlSession.delete("boardMapper.deleteBoard", boardNo);
	}

	@Override
	public int deleteAttachment(int boardNo) {
		return sqlSession.delete("boardMapper.deleteAttachment", boardNo);
	}

	@Override
	public int deleteFile(int attNo) {
		
		return sqlSession.delete("boardMapper.deleteAttachmentOne", attNo);
	}

}
