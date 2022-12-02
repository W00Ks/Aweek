package admin.service.face;

import java.util.List;

import admin.dto.Admin;
import common.Paging;
import member.dto.Member;

public interface AdminService {

	/**
	 * 로그인 인증 처리
	 * 
	 * @param admin
	 * @return
	 */
	public boolean login(Admin admin);
	
	/**
	 * 게시글 목록을 위한 페이징 객체를 생성함
	 * 
	 * 파라미터 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(총 게시글 수)
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하여 반환함
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return - 계산이 완료된 Paging 객체
	 */
	public Paging getPaging(int curPage);

	/**
	 * 페이징이 적용된 회원 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 회원 목록
	 */
	public List<Member> memberlist(Paging paging);
}