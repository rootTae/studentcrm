package org.studentcrm.crm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/consult/*")
@Controller
public class ConsultController {

   @RequestMapping("") // nothing typed in, 아무 것도 치지 않았을 때.
   public String goHome() {
      return "index";
   }
   
   @RequestMapping("/consultView") // to get to consultView, consultView로 보낼 경로(절대)
   public String consultView() {
      return "consult/consultView";
   }
}