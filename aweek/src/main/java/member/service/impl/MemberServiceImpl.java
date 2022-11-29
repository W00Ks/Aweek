package member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.dao.face.MemberDao;
import member.dto.Member;
import member.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	//DAO 객체
	@Autowired private MemberDao memberDao;
	
	@Override
	public void join(Member joinParam) {
		
		memberDao.insert(joinParam);
	}
	
	@Override
	public boolean login(Member loginParam) {
		
		if(memberDao.selectCntByIdPw(loginParam) > 0) {
			return true; //로그인 인증 성공
		}
		
		return false; //로그인 인증 실패
	}
	
	@Override
	public Member info(String loginid) {
		return memberDao.selectLoginById(loginid);
	}
	
}
