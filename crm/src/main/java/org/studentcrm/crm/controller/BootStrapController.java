package org.studentcrm.crm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BootStrapController {
	@RequestMapping(path = "/main")
	public String main(Model model) {
		return "index";
	}

}
