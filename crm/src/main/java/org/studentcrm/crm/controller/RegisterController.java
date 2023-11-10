package org.studentcrm.crm.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.studentcrm.crm.command.TeacherVO;
import org.studentcrm.crm.service.RegistService;


@Controller
@RequestMapping("/member")
public class RegisterController {

	@Autowired
	RegistService registService;
	
		//조인 화면 처리
		@RequestMapping(value = "/regist", method = RequestMethod.GET)
		public String join() {
			return "member/regist";
		}
		
		//로그인 화면 처리
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String login() {
			return "member/login";
		}
		
		//Regform
		@PostMapping("/regform")
		public String regist(TeacherVO vo, RedirectAttributes RA) {
			int result = registService.regist(vo);
			if(result == 1) {
				RA.addFlashAttribute("msg", "register success");
			}else {
				RA.addFlashAttribute("msg", "register failed");
			}
			return "redirect:/member/login";
		}

		//updateForm
		@RequestMapping(value="/update", method = RequestMethod.POST)
		public String update(TeacherVO vo, RedirectAttributes RA) {
			int result = registService.update(vo);
			if(result == 1) {
				RA.addFlashAttribute("msg", "update success");
			}else {
				RA.addFlashAttribute("msg", "update failed");
			}
			return "redirect:/member/mypage";
		}
		
		//login
		@GetMapping("/loginForm")
		public String login(String t_loginid, RedirectAttributes RA) {
			int result = registService.login(t_loginid);
			if(result == 1) {
				RA.addFlashAttribute("msg", "login success");
			}else {
				RA.addFlashAttribute("msg", "login failed");
			}
			return "redirect:/member/mypage";
		}
		
		//delete
		@GetMapping("/delete")
		public String delete(String t_loginid) {
			registService.delete(t_loginid);
			return "member/login";
		}
		
		//checkId
		@PostMapping("/idCheck")
		public int idCheck(String t_loginid) {
			int result = registService.idCheck(t_loginid);
			return result;
		}
		
		
		//로그아웃
		@RequestMapping("/logout")
		public String logout(HttpSession session) {
			session.invalidate();
			
			return "redirect:/";
		}
}
