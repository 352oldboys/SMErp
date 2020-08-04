package com.kh.erp.job.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.erp.job.model.service.JobService;
import com.kh.erp.job.model.vo.Job;




@Controller
public class JobController {

	@Autowired
	JobService jobService;
	
	@RequestMapping("/job/jobList.do")
	public String jobList(Job job, Model model,
								@RequestParam(value="userNo") int userNo) {
		
		List<Job> list = jobService.selectJobList(job);
		
		model.addAttribute("list", list);
		
		return "job/jobList";
		
	}
	
	@RequestMapping("/job/insertJob.do")
	public String insertAttend(Job job, Model model,
							@RequestParam(value="userNo") int userNo) {
		int result;
		
		System.out.println("userNo : " + userNo);
		
		try {

			result = jobService.insertJob(job);
			
			System.out.println(result);
			
			if(result > 0) {
				System.out.println("등록성공");
			} else {
				System.out.println("등록실패");
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
			System.out.println(model);
		
		    return "redirect:attendanceList.do?userNo="+userNo;

	}
	
	@RequestMapping("/job/deleteJob.do")
	public String deleteAttend(Job job, Model model,
							@RequestParam(value="userNo") int userNo,
							@RequestParam(value="jobCode") int jobCode) {
		int result;
		
		try {

			result = jobService.deleteJob(job);
			
			System.out.println(result);
			
			if(result > 0) {
				System.out.println("삭제성공");
			} else {
				System.out.println("삭제실패");
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
			System.out.println(model);
		
		    return "redirect:jobList.do?userNo="+userNo;

	}

	@RequestMapping("/job/updateJob.do")
	public String updateAttend(Job job, Model model,
							@RequestParam(value="userNo") int userNo,
							@RequestParam(value="jobCode") int jobCode) {
		
		int result;
		
		try {
			
			result = jobService.updateJob(job);
			
			System.out.println(result);
			
			if(result > 0) {
				System.out.println("수정성공");
			}else {
				System.out.println("수정실패");
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
		System.out.println(model);
		
	    return "redirect:jobList.do?userNo="+userNo;
		
	}
	
}
