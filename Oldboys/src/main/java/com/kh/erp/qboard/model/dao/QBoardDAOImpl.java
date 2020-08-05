package com.kh.erp.qboard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.qboard.model.vo.QBoard;
import com.kh.erp.qboard.model.vo.QBoardFile;

	@Repository("qboardDAO")
	public class QBoardDAOImpl implements QBoardDAO {

		@Autowired
		SqlSessionTemplate sqlSession;
		
		@Override
		public List<Map<String, String>> selectQBoardList(int cPage, int numPerPage) {
			RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
			
			return sqlSession.selectList("qboardMapper.selectQBoardList", null, rows);
		}
	  
		@Override
		public int selectQBoardTotalContents() {
			return sqlSession.selectOne("qboardMapper.selectQBoardTotalContent");
		}
	 
		@Override
		   public int insertQBoard(QBoard qboard) {
		      return sqlSession.insert("qboardMapper.insertQBoard", qboard);
		   }

		   @Override
		   public int insertQBoardFile(QBoardFile q) {
		      return sqlSession.insert("qboardMapper.insertQBoardFile", q);
		   }

		@Override
		public QBoard selectOneQBoard(int qNo) {
			return sqlSession.selectOne("qboardMapper.selectOneQBoard", qNo);
		}

		@Override
		public List<QBoardFile> selectQBoardFileList(int qNo) {
			return sqlSession.selectList("qboardMapper.selectQBoardFileList", qNo);
		}

		@Override
		public int updateQBoard(QBoard qboard) {
			return sqlSession.update("qboardMapper.updateQBoard", qboard);
		}

		@Override
		public int updateQBoardFile(QBoardFile q) {
			return sqlSession.insert("qboardMapper.updateQBoardFile", q);
		}

		@Override
		public int deleteQBoard(int qNo) {
			return sqlSession.delete("qboardMapper.deleteQBoard", qNo);
		}

		@Override
		public int deleteQBoardFile(int qNo) {
			return sqlSession.delete("qboardMapper.deleteQBoardFile", qNo);
		}

		@Override
		public int deleteFile(int qfNo) {
			
			return sqlSession.delete("qboardMapper.deleteQBoardFileOne", qfNo);
		}
		
		@Override
		public int searchSelectListCount(String searchType, String keyword) {
			
			int result = 0;
			
			System.out.println("dao keyword : " + keyword);
			
			switch(searchType) {
			case "qTitle" :
				result = sqlSession.selectOne("qboardMapper.searchQtitleCount", keyword);
			case "qContent" :
				result = sqlSession.selectOne("qboardMapper.searchQcontentCount", keyword);
			}
			
			return result;
			
			
			
		}
		@Override
		public List<Map<String, String>> searchSelectList(String searchType, String keyword, int cPage, int numPerPage) {

			List<Map<String, String>> sql = null;
			
			RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
			
			switch(searchType) {
			case "qTitle" :
			    sql = sqlSession.selectList("qboardMapper.searchQtitle", keyword, rows);
			case "qContent" :
			    sql = sqlSession.selectList("qboardMapper.searchQcontent", keyword, rows);
			}
			
			System.out.println("sql : " + sql);
			
			return sql;
			
		}
}

