package com.kh.erp.qboardComment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.qboardComment.model.vo.QBoardComment;
import com.kh.erp.qboardComment.model.dao.QBoardCommentDAO;


@Service
public class QBoardCommentServiceImpl implements QBoardCommentService{

	@Autowired
	public QBoardCommentDAO qboardcommentDAO;
	
	@Override
	public int insertQBoardComment(QBoardComment qboardcomment) {
		System.out.println("boardComment service까지 잘왓음");
		System.out.println("boardcomment service 값 확인 : "+qboardcomment);
		return qboardcommentDAO.insertQBoardComment(qboardcomment);
	}
	@Override
	public int selectQBoardCommentTotalContents(QBoardComment qboardcomment) {
		// TODO Auto-generated method stub
		return qboardcommentDAO.selectQBoardCommentTotalContents(qboardcomment);
}

	@Override
	public List<QBoardComment> selectQBoardCommentList(int no) {
		// TODO Auto-generated method stub
		return qboardcommentDAO.selectQBoardCommentList(no);
	}
	@Override
	public int deleteQBoardComment(int qcno) {
		return qboardcommentDAO.deleteQBoardComment(qcno);
	}
}