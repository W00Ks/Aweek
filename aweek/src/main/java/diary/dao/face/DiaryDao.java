package diary.dao.face;

import java.util.HashMap;
import java.util.List;

import diary.dto.Diary;
import diary.dto.DiaryCategory;
import diary.dto.DiaryFavorite;
import diary.dto.DiaryHot;
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
	public List<Room> selectRoom(HashMap<String, String[]> param);

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

	/**
	 * 사용자 즐겨찾기 목록 조회
	 * 
	 * @param userNo - 사용자 번호
	 * @return 사용자 즐겨찾기 목록값 반환
	 */
	public List<DiaryFavorite> selectFavorite(int userNo);

	/**
	 * 로그인 사용자 공지사항 조회
	 * 
	 * @param userRoom - 로그인 사용자가 가입된 모임 리스트
	 * @return 공지사항 리스트
	 */
	public List<Diary> selectDiaryNotice(List<Room> userRoom);

	/**
	 * 로그인 사용자 추천글 조회
	 * 
	 * @param userRoom - 로그인 사용자가 가입된 모임 리스트
	 * @return 추천글 리스트
	 */
	public List<Diary> selectDiaryRecomm(List<Room> userRoom);

	/**
	 * 로그인 사용자 최신글 조회
	 * 
	 * @param userRoom - 로그인 사용자가 가입된 모임 리스트
	 * @return 최신글 리스트
	 */
	public List<Diary> selectDiaryCurrent(List<Room> userRoom);

	/**
	 * 로그인 사용자가 관리자인 모임 조회
	 * 
	 * @param userNo - 로그인 사용자의 번호
	 * @return 로그인 사용자가 관리자인 모임 DTO 리스트 반환
	 */
	public List<Room> selectAdminRoom(int userNo);

	/**
	 * 클릭한 모임의 이름 조회
	 * 
	 * @param roomNo - 클릭한 모임 번호
	 * @return 해당 모임의 DTO
	 */
	public Room selectRoomName(int roomNo);

	/**
	 * 클릭한 모임의 추천수 값 조회
	 * 
	 * @param roomNo - 클릭한 모임 번호
	 * @return 해당 모임의 DiaryHot DTO값 반환
	 */
	public DiaryHot selectHotvalue(int roomNo);
	
	/**
	 * 현재 설정된 추천값 조회
	 * 
	 * @param roomNo - 모임 번호
	 * @return 설정된 값이 있으면 1, 없으면 0 반환
	 */
	public int selectHot(int roomNo);

	/**
	 * 설정값이 0인 경우, 모임 추천값 설정
	 * @param diaryHot - 모임 추천값
	 */
	public void insertHot(DiaryHot diaryHot);

	/**
	 * 설정값이 1인 경우, 모임 추천값 변경
	 * @param diaryHot - 모임 추천값
	 */
	public void updateHot(DiaryHot diaryHot);

	/**
	 * 모임 카테고리 리스트 조회
	 * 
	 * @param roomNo - 클릭한 모임 번호
	 * @return 모임 카테고리 DTO 리스트
	 */
	public List<DiaryCategory> selectDiaryCategory(int roomNo);

}
