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
	
//	@Override
//	public Member info(String loginid) {
//		return memberDao.selectLoginById(loginid);
//	}
	
}
