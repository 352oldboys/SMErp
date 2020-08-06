package com.kh.erp.attendance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.erp.attendance.model.service.AttendService;
import com.kh.erp.attendance.model.vo.Attendance;


@Controller
public class AttendController {

	@Autowired
	AttendService attendService;
	
	@RequestMapping("/attendance/attendanceList.do")
	public String attendanceList(Attendance att, Model model,
								@RequestParam(value="userNo") int userNo) {
		
		List<Attendance> list = attendService.selectAttendList(att);
		
		model.addAttribute("list", list);
		
		return "attendance/attendanceList";
		
	}
	
	@RequestMapping("/attendance/insertAttend.do")
	public String insertAttend(Attendance att, Model model,
							@RequestParam(value="userNo") int userNo) {
		int result;
		
		System.out.println("userNo : " + userNo);
		
		try {

			result = attendService.insertAttend(att);
			
			System.out.println(result);
			
			if(result > 0) {
				System.out.println("등록 성공");
			} else {
				System.out.println("등록 실패");
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
			System.out.println(model);
		
		    return "redirect:attendanceList.do?userNo="+userNo;

	}
	
	@RequestMapping("/attendance/deleteAttend.do")
	public String deleteAttend(Attendance att, Model model,
							@RequestParam(value="userNo") int userNo,
							@RequestParam(value="attendanceNo") int attendanceNo) {
		int result;
		
		try {

			result = attendService.deleteAttend(att);
			
			System.out.println(result);
			
			if(result > 0) {
				System.out.println("삭제 성공");
			} else {
				System.out.println("삭제 실패");
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
			System.out.println(model);
		
		    return "redirect:attendanceList.do?userNo="+userNo;

	}

	@RequestMapping("/attendance/updateAttend.do")
	public String updateAttend(Attendance att, Model model,
							@RequestParam(value="userNo") int userNo,
							@RequestParam(value="attendanceNo") int attendanceNo) {
		
		System.out.println(att);
		int result;
		try {
			
			result = attendService.updateAttend(att);
			
			System.out.println(result);
			
			if(result > 0) {
				System.out.println("수정 성공");
			}else {
				System.out.println("수정 실패");
			}
			
		} catch(Exception e) {
			
			throw e;
			
		}
		
		System.out.println(model);
		
	    return "redirect:attendanceList.do?userNo="+userNo;
		
	}
	
}
