package org.studentcrm.crm.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.studentcrm.crm.command.TeacherVO;
import org.studentcrm.crm.service.MemberService;

import lombok.extern.log4j.Log4j2;


@Controller
@RequestMapping("/member")
@Log4j2
public class MemberController {

	@Autowired
	MemberService memberService;
	
		//조인 화면 이동 처리
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public String goJoin() {
			return "member/register";
		}
		
		//로그인 화면 이동 처리
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String goLogin() {
			return "member/login";
		}
		
		//마이페이지 화면 이동 처리
		@RequestMapping(value = "/mypage/{t_id}", method = RequestMethod.GET)
		public String goMypage(@PathVariable("t_id") int t_id, Model model) {
			TeacherVO vo = memberService.select(t_id);
			model.addAttribute("teacher", vo);//마이페이지에 띄울 개인정보
			return "member/mypage";
		}
		
//		//수정 화면 이동 처리
//		@RequestMapping(value = "/update", method = RequestMethod.GET)
//		public String goUpdate() {
//			return "member/update";
//		}
		
		//checkId - id 중복체크
		@PostMapping("/checkId")
		@ResponseBody
		public int idCheck(@RequestParam("t_loginid") String t_loginid) {
			int result = memberService.idCheck(t_loginid);
			//log.info("testtest-----------------");
			return result;
		}
		
		//Regform - 강사등록 정보 입력 폼
		@PostMapping("/regForm")
		public String registForm(TeacherVO vo, RedirectAttributes RA) {
			int result = memberService.regist(vo);
			if(result == 1) {
				RA.addFlashAttribute("msg", "register success");
			}else {
				RA.addFlashAttribute("msg", "register failed");
			}
			return "redirect:/member/login";
		}
		
		//수정 화면 이동 처리 - update할 강사 id에 담긴 정보 가져가기
		@GetMapping("/updatePage/{t_id}")
		public String updatePage(@PathVariable("t_id") int t_id, Model model) {
			TeacherVO vo = memberService.select(t_id);
			model.addAttribute("teacher", vo);
			return "member/update";//뷰만 가져옴
		}

		//updateForm - 강사 정보 수정 폼
		@RequestMapping(value="/updateForm", method = RequestMethod.POST)
		public String updateForm(HttpSession session, TeacherVO vo, RedirectAttributes RA) {
			vo.setT_id((int)session.getAttribute("t_id"));
			int result = memberService.update(vo);
			
//			System.out.println(vo.getT_id());
			if(result == 1) {
				RA.addFlashAttribute("msg", "update success");
				//session.setAttribute("t_id", vo.getT_id()); 
				//아이디도 수정가능이면 필요. update에 아이디 중복체크도 추가해야 함
			}else {
				RA.addFlashAttribute("msg", "update failed");
			}
			return "redirect:/member/mypage";
		}
		
		//login - 로그인 폼 기능(TeacherVO를 반환받기 -> 업데이트 할 때 t_id가 필요함)
		@PostMapping("/loginForm")
		public String loginForm(HttpSession session, 
				@RequestParam("t_loginid") String t_loginid, 
				@RequestParam("t_pw") String t_pw,
				@RequestParam(name = "idCheck", required = false) String idCheck,
				HttpServletResponse response,
				RedirectAttributes RA) {
			TeacherVO vo = memberService.login(t_loginid, t_pw);
			//log.info(vo);
			//log.info(idCheck);
			Cookie userId = new Cookie("t_loginid", t_loginid);
			userId.setMaxAge(30);
			response.addCookie(userId);
			
			if(vo != null) {
				//log.info("로그인 성공");
				
				//session.setAttribute("teacher", vo);
				
				session.setAttribute("t_id", vo.getT_id());
				session.setAttribute("t_loginid", vo.getT_loginid());//수정, 삭제 대상 구분용
				session.setAttribute("t_name", vo.getT_name()); // 사이드바에 띄울 이름과 과목
				session.setAttribute("t_subject", vo.getT_subject());
				//log.info("login 이후 mypage로 갈 vo 확인 "+vo);
				RA.addFlashAttribute("msg", "login success");
				if(idCheck != null) {
					Cookie check = new Cookie("idCheck", t_loginid);
					check.setMaxAge(30);
					response.addCookie(check);		
				} else {
				    // idCheck 값이 없을 때는 쿠키를 삭제 
					//= 기억하기 체크 > 로그인 > 로그아웃 > 기억하기 체크 해제 > 로그인 > 로그아웃시 아이디 보이는 문제 해결용
				    Cookie check = new Cookie("idCheck", "");
				    check.setMaxAge(0);  // 쿠키 만료
				    response.addCookie(check);
				}
				//return "redirect:/member/mypage";
				return "redirect:/main";
			}else {
				//log.info("로그인 실패");
				RA.addFlashAttribute("msg", "로그인에 실패했습니다.");
				return "redirect:/member/login";
			}
		}
		
		//delete 
		@GetMapping("/delete")
		public String delete(HttpSession session) {
			memberService.delete((int)session.getAttribute("t_id"));
			session.invalidate();
			return "member/login";
		}
		
		//로그아웃 
		@RequestMapping("/logout")
		public String logout(HttpSession session) {
			
			session.invalidate();
			//session.removeAttribute("t_pw");
			return "redirect:/member/login";
		}
}
