package org.studentcrm.crm.config;



import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.studentcrm.crm.interceptor.AttendanceInterceptor;
import org.studentcrm.crm.interceptor.ConsultInterceptor;
import org.studentcrm.crm.interceptor.GradeInterceptor;
import org.studentcrm.crm.interceptor.LoginInterceptor;
import org.studentcrm.crm.interceptor.PaymentInterceptor;
import org.studentcrm.crm.interceptor.StudentInterceptor;

@SpringBootApplication
@Configuration
public class WebConfig implements WebMvcConfigurer {
	
	

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor())
			.addPathPatterns("/member/update")
			.addPathPatterns("/member/myPage");
		/*
		 * List<String> paths = Arrays.asList( new String[]
		 * {"/attendance/attendanceView","/board/update","/board/modify",
		 * "/board/register"});
		 */
		registry.addInterceptor(new AttendanceInterceptor())
			.addPathPatterns("/attendance/attendanceView");
		registry.addInterceptor(new StudentInterceptor())
			.addPathPatterns("/student/studentInfo");
		registry.addInterceptor(new PaymentInterceptor())
			.addPathPatterns("/payment/payment");
		registry.addInterceptor(new GradeInterceptor())
			.addPathPatterns("/grades/gradesView");
		registry.addInterceptor(new ConsultInterceptor())
		.addPathPatterns("/consult/consultView");
	}

}
