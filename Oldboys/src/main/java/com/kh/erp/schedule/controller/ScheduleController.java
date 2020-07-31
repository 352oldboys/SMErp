package com.kh.erp.schedule.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

		System.out.println("scheduleInsert : " + schedule);

		System.out.println("getUserNo : " + schedule.getUserNo());

		return "redirect:/schedule/scheduleList.do?userNo=" + schedule.getUserNo();

	}

	@RequestMapping("/schedule/scheduleList.do")
	public String scheduleList(Schedule schedule, Model model, @RequestParam(value = "userNo") int userNo) {

		System.out.println("userNo : " + userNo);

		System.out.println("schedule : " + schedule);
		List<Schedule> list = scheduleService.scheduleList(schedule);

		System.out.println("list : " + list);

		/* List<Schedule> selectList = scheduleService.selectListSchedule(userNo); */

		model.addAttribute("slist", list);

		/*
		 * Schedule s = scheduleService.selectOneSchedule(scheduleNo);
		 * 
		 * System.out.println("s : " + s);
		 * 
		 * model.addAttribute("schedule", s);
		 */

		/* model.addAttribute("schedule", selectList); */

		return "schedule/schedule";

	}

	@RequestMapping("/schedule/scheduleUpdateView.do")
	@ResponseBody
	public Map<String, Object> scheduleUpdateView(Schedule schedule,
			@RequestParam(value = "scheduleNo") int scheduleNo) {

		System.out.println("scheduleNo : " + scheduleNo);

		Schedule s = scheduleService.selectOneSchedule(scheduleNo);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("schedule", s);
		
		// scheduleService.updateSchedule(schedule);

		return map;
	}

	@RequestMapping("/schedule/scheduleUpdate.do")
	@ResponseBody
	public Map<String, Object> scheduleUpdate(Schedule schedule, 
			@RequestParam(value = "scheduleNo") int scheduleNo,
			Model model) {

		int sno = schedule.getScheduleNo();

		System.out.println("scheduleNo : " + scheduleNo);

		System.out.println("sno : " + sno);

		Schedule so = scheduleService.selectOneSchedule(sno);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("schedule", so);
		
		// String loc = "/schedule/scheduleList.do?userNo=" + so.getUserNo();

		// System.out.println("so : " + so);

		// System.out.println("userNo : " + so.getUserNo());

		/*
		 * so.setTitle(schedule.getTitle()); so.setStartDate(schedule.getStartDate());
		 * so.setEndDate(schedule.getEndDate()); so.setColor(schedule.getColor());
		 * so.setContent(schedule.getContent());
		 */

		scheduleService.updateSchedule(schedule);
		
		// model.addAttribute("loc", loc);

		System.out.println("schedule.getUserNo() : " + schedule);

		return map;

	}

	/*
	 * @RequestMapping("/schedule/scheduleUpdate.do") public String
	 * scheduleUpdate(Schedule schedule,
	 * 
	 * @RequestParam(value="scheduleNo") int scheduleNo) {
	 * 
	 * int sno = schedule.getScheduleNo();
	 * 
	 * System.out.println("scheduleNo : " + scheduleNo);
	 * 
	 * System.out.println("sno : " + sno);
	 * 
	 * 
	 * 
	 * Schedule so = scheduleService.selectOneSchedule(sno);
	 * 
	 * System.out.println("so : " + so);
	 * 
	 * System.out.println("userNo : " + so.getUserNo());
	 * 
	 * 
	 * so.setTitle(schedule.getTitle()); so.setStartDate(schedule.getStartDate());
	 * so.setEndDate(schedule.getEndDate()); so.setColor(schedule.getColor());
	 * so.setContent(schedule.getContent());
	 * 
	 * 
	 * scheduleService.updateSchedule(schedule);
	 * 
	 * System.out.println("schedule.getUserNo() : " + schedule);
	 * 
	 * return "redirect:/schedule/scheduleList.do?userNo=" + so.getUserNo();
	 * 
	 * }
	 */

	@RequestMapping("/schedule/scheduleDelete.do")
	@ResponseBody
	public Map<String, Object> scheduleDelete(Schedule schedule,@RequestParam int scheduleNo) {
		
		int sno = schedule.getScheduleNo();

		System.out.println("scheduleNo : " + scheduleNo);

		System.out.println("sno : " + sno);

		Schedule so = scheduleService.selectOneSchedule(sno);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("schedule", so);
		
		System.out.println("delete scheduleNo : " + scheduleNo);

		scheduleService.deleteSchedule(scheduleNo);
		

		return map;
	}

}
