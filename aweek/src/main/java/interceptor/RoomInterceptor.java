package interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

public class RoomInterceptor implements HandlerInterceptor {

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
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			//SweetAlert
			out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css'>"
					+ "<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js'></script>"
					+ "<script type='text/javascript' src='https://code.jquery.com/jquery-2.2.4.min.js'></script>");
			out.println("<script>$(document).ready(function(){swal('로그인이 필요합니다!', '', 'warning').then(function(){"
					+ "		window.location.href='/member/login'"
					+ "     })"
					+ "});"
					+ "</script>");
			
			//기본 Alert
//				out.println("<script>$(document).ready(function(){alert('로그인이 필요합니다!'); window.location='/member/login';})</script>");
			out.flush(); 
			
//				response.sendRedirect("/member/login");
			
			logger.info("+ + + 인터셉터 false 종료 + + +");
			return false; 
		}

		logger.info("+ + + 인터셉터 true 종료 + + +");
		return true;
	}
	
}
