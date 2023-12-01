package org.studentcrm.crm.controller;


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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
import org.studentcrm.crm.command.ImageAttachVO;
import org.studentcrm.crm.command.TeacherImageAttachVO;
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
		
		//강사 번호에 맞는 첨부 파일 가져오기
		@GetMapping(value="/getAttachImg", produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<TeacherImageAttachVO> getAttachImg(int t_id){
			//log.info("get Attach : "+sService.getAttachImg(s_id));
			return new ResponseEntity<>(memberService.getAttachImg(t_id), HttpStatus.OK);
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
			log.info("넘길 데이터 정보 : "+vo);
			int result = memberService.regist(vo);
			
			if(vo.getAttachImg() != null) {
				//log.info("첨부한 이미지가 있음!!!!");
				vo.getAttachImg();
			}			
			
			if(result == 1) {
				RA.addFlashAttribute("msg", "강사 등록을 완료했습니다.");
			}else {
				RA.addFlashAttribute("msg", "강사 등록에 실패했습니다.");
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
		@PostMapping("/updateForm")
		public String updateForm(HttpSession session, TeacherVO vo, RedirectAttributes RA) {
			//log.info("업데이트 실행");
			//log.info(vo);
			
			//vo.setT_id((int)session.getAttribute("t_id"));
			TeacherVO teacher = (TeacherVO)session.getAttribute("teacher");
			vo.setT_id(teacher.getT_id());
			int result = memberService.update(vo);
			int t_id = vo.getT_id();
			session.setAttribute("teacher", vo);
			
			//log.info("업데이트 실행 : "+result);
//			System.out.println(vo.getT_id());
			
			if(result == 1) {
				RA.addFlashAttribute("msg", "정보를 수정했습니다.");
				//session.setAttribute("t_id", vo.getT_id()); 
				//아이디도 수정가능이면 필요. update에 아이디 중복체크도 추가해야 함
			}else {
				RA.addFlashAttribute("msg", "정보 수정에 실패했습니다.");
			}
			return "redirect:/member/mypage/"+t_id;
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
			Cookie userId = new Cookie("t_loginid", t_loginid);
			userId.setMaxAge(30);
			response.addCookie(userId);
			
			if(vo != null) {
				//하나씩 넘기지말고 vo에 담아서 한번에 넘기기
				session.setAttribute("teacher", vo);
//				session.setAttribute("t_id", vo.getT_id());
//				session.setAttribute("t_loginid", vo.getT_loginid());//수정, 삭제 대상 구분용
//				session.setAttribute("t_name", vo.getT_name()); // 사이드바에 띄울 이름과 과목
//				session.setAttribute("t_subject", vo.getT_subject());
				//log.info("login 이후 mypage로 갈 vo 확인 "+vo);
				RA.addFlashAttribute("msg", "로그인을 환영합니다.");
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
			//int t_id = (int)session.getAttribute("t_id");
			TeacherVO teacher = (TeacherVO)session.getAttribute("teacher");
			int t_id = teacher.getT_id();
			TeacherImageAttachVO attachImg = memberService.getAttachImg(t_id);
			
			int result = memberService.delete(t_id);
			if(result == 1) {
				deleteFiles(attachImg);
			}
			session.invalidate();
			return "member/login";
		}
		//첨부 파일 삭제
		private void deleteFiles(TeacherImageAttachVO attachImg) {
			//log.info("삭제할 attachImg >>>>>>>>> ");
			//log.info(attachImg);
			//첨부파일이 있는지 확인
			if(attachImg == null) {
				return;
			}
			
			try {
				Path file = Paths.get("C:/upload/"+attachImg.getUploadPath()+"\\"
						+attachImg.getUuid()+"_"+attachImg.getFileName());
				//해당 파일이 존재하면 삭제
				Files.deleteIfExists(file);//java.nio.Files
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbnail = Paths.get("C:/upload/"+attachImg.getUploadPath()+
							"/s_"+attachImg.getUuid()+"_"+attachImg.getFileName());
					//썸네일 이미지 파일 삭제
					Files.deleteIfExists(thumbnail);
				}
			} catch (Exception e) {
				log.error("delete file error :"+e.getMessage());
			}
		 }
		
		//로그아웃 
		@RequestMapping("/logout")
		public String logout(HttpSession session) {
			
			session.invalidate();
			//session.removeAttribute("t_pw");
			return "redirect:/member/login";
		}
}
