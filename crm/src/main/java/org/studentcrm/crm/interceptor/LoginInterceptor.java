package org.studentcrm.crm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.studentcrm.crm.command.TeacherVO;

public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("PreHandle 동작!");
		HttpSession session = request.getSession();
		//String t_id = (String)session.getAttribute("t_id");
		TeacherVO teacher = (TeacherVO)session.getAttribute("teacher");
		if(teacher == null) {
			response.sendRedirect("/member/login");
			return false;
		}else {
			return true;
		}
//		int t_id = teacher.getT_id();
//		//System.out.println("t_id at logininterceptor: " + t_id);
//		if(t_id == -1) {
//			response.sendRedirect("/member/login");
//			//System.out.println("t_id at logininterceptor when null: " + t_id);
//			return false;
//			// 의미는 핸들러메서드를 실행한 후 Controller를 수행하지 않음.... 
//		}else {
//			return true;
//			// 의미는 핸들러메서드를 실행한 후에 Controller를 수행한다는 의미... 
//		}
	}

	// preHandler에서 true를 리턴하여, 컨트롤러를 실행했을 때만 동작함.... 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		//System.out.println("PostHandle!");
		
//		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
}