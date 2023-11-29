package org.studentcrm.crm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/attendance/*")
public class AttendanceController {

	@RequestMapping("") // nothing typed in the url except for the localhost part, 아무 것도 안 쓰면..
	public String goHome() {
		return "index";
	}
	
	@RequestMapping("/attendanceView") // to go to attendance sheet, 출결 페이지로
	public String attendanceView() {
		return "attendance/attendanceView";
	}
	
	@RequestMapping("/{subPath}")
    public String handleSubPath(@PathVariable String subPath) {
        return "error-404";
    }
}
