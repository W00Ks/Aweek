package common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


@Component 	// 스프링 빈으로 등록하기 [ component-scan 등록 필요, <annotation-driven /> 태그 필요 ]
@Aspect		// AspectJ의 관리를 받도록 설정하기 [ <aop:aspectj-autoproxy /> 태그 필요]
public class LogAspect {
	
	// 로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
/*	
	// 포인트컷 설정 메소드 - Advice가 적용될 메소드(위치) 지정
	// *[리턴].web.service.impl[패키지].*ServiceImpl[클래스].*(..)[메소드, (..)는 매개변수]
	@Pointcut("execution(* diary.controller.*Controller.*(..))")
	private static void logPointcut() {}
	
	// 어드바이스 코드 작성 - 포인트컷에 맞춰 코드가 실행될 시점 지정
	@Before("logPointcut()") // logPointcut() 메소드의 Before로 동작한다
//	@After("logPointcut()")
	public void logBefore() {
		logger.info("AOP 테스트");
	}
*/	

	// --- --- ---
	
//	@Before("execution(* *..controller..*.*(..))")
//	@Before("execution(* *..service..*.*(..))")
	@Before("execution(* *..controller..*.*(..)) || execution(* *..service..*.*(..))")
	// 리턴타입 상관없이 패키지가 0번 이상 반복하든 안에 controller 단어가 있으면 모든 메소드.. 
	public void log(JoinPoint joinPoint) {
		
//		logger.info("##### {}", joinPoint); 				// execution(void login.controller.LoginController.main())
//		logger.info("##### {}", joinPoint.getSignature()); 	// void login.controller.LoginController.main()
		
		Signature signature = joinPoint.getSignature();
		
//		logger.info(">>>>> {}", signature.getName()); 		// 메소드명
//		logger.info(">>>>> {}", signature.toString());		// 메소드 정보 전체 (반환타입, 클래스명, 메소드명, 매개변수)
		logger.info(">>>>> {}", signature.toShortString()); // 클래스명.메소드명(..)
//		logger.info(">>>>> {}", signature.toLongString()); 	// 접근제한자 포함, 매개변수 패키지 포함
		
	}
	
}
