package com.kh.erp.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.board.model.vo.BoardFile;
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
	   public int insertBoardFile(BoardFile b) {
	      return sqlSession.insert("boardMapper.insertBoardFile", b);
	   }

	@Override
	public Board selectOneBoard(int bNo) {
		return sqlSession.selectOne("boardMapper.selectOneBoard", bNo);
	}

	@Override
	public List<BoardFile> selectBoardFileList(int bNo) {
		return sqlSession.selectList("boardMapper.selectBoardFileList", bNo);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.update("boardMapper.updateBoard", board);
	}

	@Override
	public int updateBoardFile(BoardFile b) {
		return sqlSession.insert("boardMapper.updateBoardFile", b);
	}

	@Override
	public int deleteBoard(int bNo) {
		return sqlSession.delete("boardMapper.deleteBoard", bNo);
	}

	@Override
	public int deleteBoardFile(int bNo) {
		return sqlSession.delete("boardMapper.deleteBoardFile", bNo);
	}

	@Override
	public int deleteFile(int bfNo) {
		
		return sqlSession.delete("boardMapper.deleteBoardFileOne", bfNo);
	}

	@Override
	public int searchSelectListCount(String searchType, String keyword) {
		
		int result = 0;
		
		System.out.println("dao keyword : " + keyword);
		
		switch(searchType) {
		case "bTitle" :
			result = sqlSession.selectOne("boardMapper.searchBtitleCount", keyword);
		case "bContent" :
			result = sqlSession.selectOne("boardMapper.searchBcontentCount", keyword);
		}
		
		return result;
		
		
		
	}

	@Override
	public List<Map<String, String>> searchSelectList(String searchType, String keyword, int cPage, int numPerPage) {

		List<Map<String, String>> sql = null;
		
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		switch(searchType) {
		case "bTitle" :
		    sql = sqlSession.selectList("boardMapper.searchBtitle", keyword, rows);
		case "bContent" :
		    sql = sqlSession.selectList("boardMapper.searchBcontent", keyword, rows);
		}
		
		System.out.println("sql : " + sql);
		
		return sql;
		
	}

}
