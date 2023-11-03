package org.zerock.crm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

@WebFilter(
			value = {"/*"},
			initParams = @WebInitParam(name="encoding", value="utf-8")
		)
public class EncodingFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// 필터링 관련 초기 설정
	}
	
	@Override //메인
	public void doFilter(
			ServletRequest request, ServletResponse response, 
			FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		chain.doFilter(request, response);
	}
	
	@Override
	public void destroy() {
		// 필터를 없앨 때
	}
}
