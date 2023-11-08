package org.studentcrm.crm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/attendance/*")
public class AttendanceController {

	@RequestMapping("")
	public String goHome() {
		return "index";
	}
	
	@RequestMapping("/attendanceView")
	public String attendanceView() {
		return "attendance/attendanceView";
	}
}
