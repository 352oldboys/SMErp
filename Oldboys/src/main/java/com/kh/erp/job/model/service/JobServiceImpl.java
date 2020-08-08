package com.kh.erp.job.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.job.model.dao.JobDAO;
import com.kh.erp.job.model.vo.Job;


@Service("jobService")
public class JobServiceImpl implements JobService {
	

	@Autowired
	JobDAO jobDAO;

	@Override
	public List<Job> selectJobList(Job job) {
		
		return jobDAO.selectJobList(job);
	}

	@Override
	public int insertJob(Job job) {
		
		return jobDAO.insertJob(job);
	}

	@Override
	public int deleteJob(Job job) {
		
		return jobDAO.deleteJob(job);
	}

	@Override
	public int updateJob(Job job) {
		
		return jobDAO.updateJob(job);
	}

}
