package diary.dao.face;

import member.dto.Member;

public interface DiaryDao {

	/**
	 * 입력받은 정보의 DB 존재 유무에 대한 카운트 조회
	 * 
	 * @param member - 입력받은 사용자 정보
	 * @return select count 조회값
	 */
	public int selectCntMember(Member member);

	/**
	 * 입력받은 로그인 사용자의 정보 조회
	 * 
	 * @param member - 로그인한 사용자 정보
	 * @return 사용자 정보 DTO
	 */
	public Member selectMember(Member member);

}
