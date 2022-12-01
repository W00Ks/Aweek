package diary.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class DiaryInterceptor implements HandlerInterceptor {
	
	// 로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("+ + + 인터셉터 시작 + + +");
		
		// 세션 객체
		HttpSession session = request.getSession();
		
		if( session.getAttribute("loginResult") == null ) { // 1. 비로그인 상태
			logger.info(" >> 접속 불가 : 비로그인 상태");
			
//			response.sendRedirect("/interceptor/main");
			response.sendRedirect("/diary/fail");
			
			return false; // 컨트롤러 접근 금지
			// 서블릿은 멀티태스킹이니까 return true하면 리다이렉트 한 이후의 분기점이 따로 처리되는건가?
			
		}

		return true; // 컨트롤러 접근 허용하기
//		return false; // 컨트롤러 접근 금지시키기
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		logger.info("+ + + 인터셉터 종료 + + +");
		
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

}
