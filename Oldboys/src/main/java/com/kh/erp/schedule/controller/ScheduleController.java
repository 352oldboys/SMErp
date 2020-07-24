package com.kh.erp.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.erp.schedule.model.service.ScheduleService;
import com.kh.erp.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {
	
	@Autowired
	ScheduleService scheduleService; 
	
	@RequestMapping("/schedule/schedule.do")
	public void schedule() {
		
	}
	
	@RequestMapping("/schedule/scheduleInsert.do")
	public String scheduleInsert(Schedule schedule, Model model) {		
		
		System.out.println("model : " + model);
		
		scheduleService.insertSchedule(schedule);
		
		return "redirect:/schedule/scheduleList.do?userNo=1";
		
	}
	
	@RequestMapping("/schedule/scheduleList.do")
	public String scheduleList(Schedule schedule, Model model) {
	
		System.out.println("schedule : " + schedule);
		List<Schedule> list = scheduleService.scheduleList(schedule);
		
		System.out.println(list);

		
		model.addAttribute("slist", list);
		/* model.addAttribute("schedule", scheduleService.selectOneSchedule(userNo); */
		
		return "schedule/schedule";
		
	}
	

}
