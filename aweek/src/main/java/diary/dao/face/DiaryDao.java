package diary.dao.face;

import java.util.HashMap;
import java.util.List;

import diary.dto.Diary;
import diary.dto.DiaryFavorite;
import member.dto.Member;
import room.dto.Room;
import room.dto.RoomList;

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

	/**
	 * 로그인 사용자의 소속 모임 번호 조회
	 * 
	 * @param userNo - 로그인 사용자 번호
	 * @return 해당 사용자가 소속된 모임 리스트
	 */
	public List<RoomList> selectRoomList(int userNo);

	/**
	 * 로그인 사용자의 소속 모임 정보 조회
	 * 
	 * @param param - 로그인 사용자의 소속 모임 번호 리스트
	 * @return 로그인 사용자의 소속 모임 정보 DTO 리스트 반환
	 */
	public List<Room> selectRoom(HashMap<String, Object> param);

	/**
	 * 사용자의 모든 즐겨찾기 목록 제거
	 * @param userNo - 사용자 번호
	 * 
	 */
	public void deleteFavorite(int userNo);

	/**
	 * 사용자 즐겨찾기 데이터 추가
	 * 
	 * @param list - Favorite DTO 리스트
	 */
	public void insertFavorite(List<DiaryFavorite> list);

}
