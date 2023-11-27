package org.studentcrm.crm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/consult/*")
@Controller
public class ConsultController {

   @RequestMapping("")
   public String goHome() {
      return "index";
   }
   
   @RequestMapping("/consultView")
   public String consultView() {
      return "consult/consultView";
   }
}