package com.kh.erp.job.model.service;

import java.util.List;

import com.kh.erp.job.model.vo.Job;

public interface JobService {
	static int TAX_SERVICE_ERROR = 0;
	static int TAX_SERVICE_COMPLETE = 1;
	
	List<Job> selectJobList(Job job);

	int insertJob(Job job);

	int deleteJob(Job job);

	int updateJob(Job job);
}
