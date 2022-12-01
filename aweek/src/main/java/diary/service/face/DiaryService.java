package diary.service.face;

import member.dto.Member;

public interface DiaryService {

	/**
	 * 로그인 메소드
	 * 
	 * @param member - 입력받은 사용자 정보
	 * @return 로그인 결과값 반환
	 */
	public boolean login(Member member);

	/**
	 * 로그인된 사용자 정보 가져오기
	 * 
	 * @param member - 로그인한 사용자 정보
	 * @return 로그인 사용자 DTO값 반환
	 */
	public Member userInfo(Member member);

}
