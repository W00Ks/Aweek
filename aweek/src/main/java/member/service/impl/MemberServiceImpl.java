package member.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import common.Mypaging;
import cs.dto.Inquiry;
import member.dao.face.MemberDao;
import member.dto.Member;
import member.service.face.MemberService;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//DAO 객체
	@Autowired private MemberDao memberDao;
	
	//context-mail에서 빈 등록했기 때문에 주입받을 수 있다. Spring에서 제공하는 MailSender.
	@Autowired private JavaMailSenderImpl mailSender;
	
	@Override
	public boolean join(Member member) {
		
		//중복된 id인지 확인
		if( memberDao.selectIdChk(member) > 0 ) {
			return false;
		}
		
		//회원 가입 - DB 삽입
		memberDao.insert(member);
		
		//회원가입 결과 확인
		if( memberDao.selectIdChk(member) > 0 ) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean joinIdChk(Member member) {
		int result = memberDao.selectIdChk(member);
		
		if(result > 0) return true;
		
		return false;
	}
	
	@Override
	public boolean login(Member member) {
		int loginChk = memberDao.selectCntMember(member);
		
		if( loginChk > 0 )	return true;
		return false;
	}
	
	@Override
	public Member getLoginInfo(Member member) {
		
		member = memberDao.selectLoginInfo(member); 
		
		return member;
	}
	
	@Override
	public boolean kakaoLogin(Member member) {
		int loginChk = memberDao.selectCntKakaoMember(member);
		
		if( loginChk > 0 )	return true;
		return false;
	}
	
	@Override
	public boolean kakaoJoin(Member member) {
		//회원 가입 - DB 삽입
		memberDao.insert(member);
		
		//회원가입 결과 확인
		if( memberDao.selectIdChk(member) > 0 ) {
			return true;
		}
		return false;
	}
	
	@Override
	public String userPwEmailSend(Member member) throws MessagingException {
		
		String userPw = member.getUserPw();
		
//	    MimeMessage mailMessage = mailSender.createMimeMessage();
//        String mailContent = "[AWEEK] 카카오 회원의 회원정보 수정용 비밀번호 발송 메일입니다.<br><br> "
//        						+ "회원정보 수정 시 입력해주세요!<br><br>"
//        						+ "회원 정보 수정용 비밀번호는 " + userPw + " 입니다." ;     //보낼 메시지
//        mailMessage.setSubject("[AWEEK] 카카오 회원의 회원정보 수정용 비밀번호 발송 메일입니다.", "UTF-8"); 
//        mailMessage.setText(mailContent, "UTF-8", "html");
//        mailMessage.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(member.getUserEmail()));
//        mailSender.send(mailMessage);
		
        logger.info("+++ 카카오 회원 비밀번호: " + userPw + " +++");
		return userPw;
	}
	
	@Override
	public boolean findIdUserInfo(Member member) {
		int findIdChk = memberDao.selectCntFindIdMember(member);
		
		if( findIdChk > 0 )	return true;
		return false;
	}
	
	@Override
	public String getUserIdInfo(Member member) {
		
		String userId = memberDao.selectEmailByUserId(member);
		
		return userId;
	}
	
	@Override
	public String userEmailCheck(String userEmail) throws MessagingException {
		
		Random rand  = new Random();
	    String numStr = "";
	    for(int i=0; i<6; i++) {
	       String ran = Integer.toString(rand.nextInt(10));
	       numStr+=ran;
	    }
	    
//	    MimeMessage mailMessage = mailSender.createMimeMessage();
//	    
//        String mailContent = "[AWEEK] 아이디 찾기 인증 메일입니다.<br><br>" + "인증번호는 " + numStr + " 입니다." ;     //보낼 메시지
//        mailMessage.setSubject("[AWEEK] 아이디 찾기 인증메일입니다.", "UTF-8"); 
//        mailMessage.setText(mailContent, "UTF-8", "html");
//        mailMessage.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(userEmail));
//        mailSender.send(mailMessage);
		
        logger.info("+++ 이메일 인증 번호: " + numStr + " +++");
		return numStr;
	}
	
	@Override
	public boolean findPwUserInfo(Member member) {
		int findPwChk = memberDao.selectCntFindPwMember(member);
		
		if( findPwChk > 0 )	return true;
		return false;
	}
	
	@Override
	public String userPhoneCheck(String userPhone) throws CoolsmsException {
		
		String api_key = "NCSXW44P1BXBAHQQ";
		String api_secret = "HBBLOSBIT1RMJRLEM9EJ2HBUW3H7P6OJ";
		Message coolsms = new Message(api_key, api_secret);
		
		Random rand  = new Random();
	    String numStr = "";
	    for(int i=0; i<6; i++) {
	       String ran = Integer.toString(rand.nextInt(10));
	       numStr+=ran;
	    }
	    
//	    HashMap<String, String> params = new HashMap<String, String>();
//	    params.put("to", userPhone);    // 수신전화번호 (ajax로 view 화면에서 받아온 값으로 넘김)
//	    params.put("from", "01047854418");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
//	    params.put("type", "sms"); 
//	    params.put("text", "[Aweek] 인증번호는 [" + numStr + "] 입니다.");
//	
//	    coolsms.send(params); // 메시지 전송
	    
	    logger.info("+++ 휴대폰 인증 번호: " + numStr + " +++");
	    return numStr;
		
	}
	
	@Override
	public void getPwModify(Member member) {
		memberDao.updatePw(member);
	}
	
	@Override
	public void getUserModify(Member member) {
		memberDao.updateUserModify(member);
	}
	
	@Override
	public void getPhoneModify(Member member) {
		memberDao.updatePhone(member);
	}
	
	
	@Override
	public boolean getUserWd(Member member) {
		
		//탈퇴 회원 정보 탈퇴 DB에 INSERT
		memberDao.insertWdUser(member);
		
		//탈퇴 회원 정보 삭제
		memberDao.deleteUser(member);

		if( memberDao.selectIdChk(member) > 0 ) {
			return true;
		}
		return false;
		
	}
	
	@Override
	public Mypaging getPaging(int curPage, Member member) {
		//총 게시글 수 조회
		int totalCount = memberDao.selectPagingCntAll(member);
		
		//페이징 계산
		Mypaging paging = new Mypaging(totalCount, curPage);
		return paging;
	}
	
	@Override
	public List<Inquiry> myInquiryList(Mypaging paging, Member member) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("member", member);
		
		return memberDao.selectMyInquiryList(map);
	}
	
	@Override
	public Inquiry myInquiryView(Inquiry viewInquiry, Member member) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("inquiry", viewInquiry);
		map.put("member", member);
		
		return memberDao.selectMyInquiryView(map);
	}
	
}
