package org.studentcrm.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.studentcrm.crm.service.GradesService;
import org.studentcrm.crm.service.RegisterService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/register/*")
@Log4j2
public class RegisterController {
	@Setter(onMethod_ = {@Autowired})
	RegisterService rservice;
	
	@Setter(onMethod_ = {@Autowired})
	GradesService gservice;
	
	@RequestMapping("/register")
	public String register() {
		return "register/register";
	}
}
