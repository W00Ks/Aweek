package admin.dao.face;

import java.util.List;

import admin.dto.Admin;
import common.Paging;
import member.dto.Member;

public interface AdminDao {

	/**
	 * 로그인 ID와 PW가 일치하는 관리자 찾기
	 * -> 로그인 인증에 활용함
	 * 
	 * @param admin - 조회할 ID와 PW 정보
	 * @return - 조회된 행 수
	 */
	public int selectAdmin(Admin adminParam);

	/**
	 * 전체 게시글 수를 조회함
	 * 
	 * @return - 총 게시글 수
	 */
	public int selectCntAll();

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 게시글 목록
	 */
	public List<Member> selectMemberList(Paging paging);
}