package org.zerock.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

import org.springframework.context.annotation.Configuration;


@WebFilter(
		value = {"/*"},
		initParams = @WebInitParam(name="encoding", value = "utf-8")
		) 


@Configuration
public class EncodingFilter implements Filter {
	
	@Override //init //초기 설정을 바꾸는
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		Filter.super.init(filterConfig);
	}
	
	@Override //destroy // 필터 설정을 지울때
	public void destroy() {
		// TODO Auto-generated method stub
		Filter.super.destroy();
	}
		
	@Override //**main
	public void doFilter(ServletRequest request, 
			ServletResponse response, 
			FilterChain chain) //chain에 필터가 엮이는 것 (순차적으로 묶어서 실행됨)//
			//또다른 필터를 만들어서 체인에 넣어줌.
			throws IOException, ServletException {
		//한글 처리...
		//들어오는 객체에 대해
		request.setCharacterEncoding("utf-8");	
		//나가는 객체에 대해
		response.setContentType("text/html;charset=utf-8");
		
		//체인으로 묶어줌.
		chain.doFilter(request, response);
	}

}
