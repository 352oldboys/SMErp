package com.kh.erp.job.model.dao;

import java.util.List;

import com.kh.erp.job.model.vo.Job;

public interface JobDAO {
	
	List<Job> selectJobList(Job job);

	int insertJob(Job job);

	int deleteJob(Job job);

	int updateJob(Job job);
}
