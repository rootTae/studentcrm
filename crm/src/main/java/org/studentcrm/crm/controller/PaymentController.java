package org.studentcrm.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/payment/*")
@Log4j2
public class PaymentController {

	
	@RequestMapping("/payment")
	public String payment() {
		return "payment/payment";
	}

	@RequestMapping("/{subPath}")
    public String handleSubPath(@PathVariable String subPath) {
        return "error-404";
    }
	
	
}
