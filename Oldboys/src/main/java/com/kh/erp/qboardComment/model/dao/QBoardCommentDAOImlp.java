package com.kh.erp.qboardComment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.qboardComment.model.vo.QBoardComment;

@Repository
public class QBoardCommentDAOImlp implements QBoardCommentDAO{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
		public int insertQBoardComment(QBoardComment qboardcomment) {
		return sqlSession.insert("qboardcomment.insertQBoardComment",qboardcomment); 
	}
		@Override
		public int selectQBoardCommentTotalContents(QBoardComment qboardcomment) {
			System.out.println("boardComment dao까지 잘왓음");
			System.out.println("boardcomment dao 값 확인 : "+qboardcomment);
			return sqlSession.selectOne("boardcomment.selectBoardCommentTotalContents", qboardcomment);
		}

		@Override
		public List<QBoardComment> selectQBoardCommentList(int no) {  
			// TODO Auto-generated method stub
			return sqlSession.selectList("qboardcomment.selectQBoardCommentList2", no);
		}

		@Override
		public int deleteQBoardComment(int qcno) {
			return sqlSession.update("qboardcomment.deleteQBoardComment", qcno);
		}
	}
