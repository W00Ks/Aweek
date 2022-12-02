package admin.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.face.AdminDao;
import admin.dto.Admin;
import admin.service.face.AdminService;
import common.Paging;
import member.dto.Member;

@Service
public class AdminServiceImpl implements AdminService {

	// 로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// DAO 객체
	@Autowired private AdminDao adminDao;
	
	@Override
	public boolean login(Admin admin) {
		
		int loginChk = adminDao.selectAdmin(admin);
			
			logger.info("admin() : {}", admin);
			
			if(loginChk > 0) {
				return true;
			}
		return false;
	}

	@Override
	public Paging getPaging(int curPage) {
		
		// 총 게시글 수 조회
		int totalCount = adminDao.selectCntAll();
		
		// 페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<Member> memberlist(Paging paging) {
		
		return adminDao.selectMemberList(paging);
	}	
}