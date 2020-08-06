package com.kh.erp.job.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.job.model.vo.Job;

@Repository("jobDAO")
public class JobDAOImpl implements JobDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Job> selectJobList(Job job) {
		return sqlSession.selectList("jobMapper.selectJobList", job);
	}

	@Override
	public int insertJob(Job job) {
		
		System.out.println(job);
		return sqlSession.insert("jobMapper.insertJob", job);
	}

	@Override
	public int deleteJob(Job job) {
		
		return sqlSession.delete("jobMapper.deleteJob", job);
	}

	@Override
	public int updateJob(Job job) {
		
		return sqlSession.update("jobMapper.updateJob", job);
	}

}
