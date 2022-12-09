package diary.service.face;

import java.util.HashMap;
import java.util.List;

import diary.dto.Diary;
import diary.dto.DiaryFavorite;
import member.dto.Member;
import room.dto.Room;
import room.dto.RoomList;

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

	/**
	 * 로그인 사용자의 소속 모임 번호 조회
	 * 
	 * @param userNo - 로그인 사용자 번호
	 * @return 로그인 사용자의 소속모임이 입력된 DTO 리스트 반환 
	 */
	public List<RoomList> userRoomInfo(int userNo);

	/**
	 * 로그인 사용자의 소속 모임 정보 조회
	 * 
	 * @param param - 로그인 사용자의 소속 모임 번호 리스트
	 * @return 로그인 사용자의 소속 모임 정보 DTO 리스트 반환
	 */
	public List<Room> userRoomInfo(HashMap<String, Object> param);

	/**
	 * 사용자 즐겨찾기 목록 추가
	 * 
	 * @param roomnos - 사용자가 전달한 즐겨찾기 목록
	 * @param userNo - 사용자 번호
	 */
	public void userFavorite(String[] roomnos, int userNo);

	/**
	 * 사용자 즐겨찾기 목록 조회
	 * 
	 * @param userNo - 로그인 사용자 번호
	 * @return
	 */
	public List<DiaryFavorite> userFavorite(int userNo);

	/**
	 * 사용자 즐겨찾기 초기화
	 * 
	 * @param userNo - 로그인한 사용자 번호
	 */
	public void userFavoriteClear(int userNo);

}
