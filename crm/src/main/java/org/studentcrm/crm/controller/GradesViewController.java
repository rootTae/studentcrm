package org.studentcrm.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/grades/*")
public class GradesViewController {

	@RequestMapping("")
	public String goMain() {
		return "index";  //메인으로
	}

	@RequestMapping("/test")
	public String test() {
		return "grades/test";
	}
	
	
	
	@RequestMapping("/gradesView")
	public String gradesView() {
		return "grades/gradesView";
	}
	
	@RequestMapping("/{subPath}")
    public String handleSubPath(@PathVariable String subPath) {
        return "error-404";
    }
	
//	@RequestMapping(value ="/searchStudent", method = RequestMethod.GET)
//	public String searchStudent(Model model, String s_name) {
//		
//		model.addAttribute("student",s_name);
//		
//		return "grades/gradesView";
//	}
}
