package org.studentcrm.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.studentcrm.crm.service.StudentService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/student")
@Log4j2
public class StudentController {
	@Setter(onMethod_ = {@Autowired})
	StudentService sService;
	
	@RequestMapping("/studentInfo")
	public String student() {
		return "student/studentInfo";
	}

	@RequestMapping("/{subPath}")
    public String handleSubPath(@PathVariable String subPath) {
        return "error-404";
    }
	
	
}
