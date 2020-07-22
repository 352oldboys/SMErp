package com.kh.erp.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.notice.model.vo.Attachment;
import com.kh.erp.notice.model.vo.Notice;

@Repository("noticeDAO")
public class NoticeDAOImpl implements NoticeDAO{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		
		return sqlSession.selectList("noticeMapper.selectNoticeList", null, rows);
	}

	@Override
	public int selectNoticeTotalContents() {
		return sqlSession.selectOne("noticeMapper.selectNoticeTotalContent");
	}

	@Override
	   public int insertNotice(Notice notice) {
	      return sqlSession.insert("noticeMapper.insertNotice", notice);
	   }

	   @Override
	   public int insertAttachment(Attachment a) {
	      return sqlSession.insert("noticeMapper.insertAttachment", a);
	   }

	@Override
	public Notice selectOneNotice(int nNo) {
		return sqlSession.selectOne("noticeMapper.selectOneNotice", nNo);
	}

	@Override
	public List<Attachment> selectAttachmentList(int nNo) {
		return sqlSession.selectList("noticeMapper.selectAttachmentList", nNo);
	}

	@Override
	public int updateNotice(Notice notice) {
		return sqlSession.update("noticeMapper.updateNotice", notice);
	}

	@Override
	public int updateAttachment(Attachment a) {
		return sqlSession.insert("noticeMapper.updateAttachment", a);
	}

	@Override
	public int deleteNotice(int nNo) {
		return sqlSession.delete("noticeMapper.deleteNotice", nNo);
	}

	@Override
	public int deleteAttachment(int nNo) {
		return sqlSession.delete("noticeMapper.deleteAttachment", nNo);
	}

	@Override
	public int deleteFile(int attNo) {
		
		return sqlSession.delete("noticeMapper.deleteAttachmentOne", attNo);
	}

}


