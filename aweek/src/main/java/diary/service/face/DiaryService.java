package diary.service.face;

import java.util.HashMap;
import java.util.List;

import diary.dto.Diary;
import diary.dto.DiaryAdmin;
import diary.dto.DiaryCategory;
import diary.dto.DiaryFavorite;
import diary.dto.DiaryHot;
import diary.dto.DiaryRoomList;
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
	public List<Room> userRoomInfo(HashMap<String, String[]> param);

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
	 * 로그인 사용자가 관리자인 모임 리스트 조회
	 * 
	 * @param userNo - 로그인한 사용자 번호
	 * @return 로그인 사용자가 관리자인 모임 리스트
	 */
	public List<Room> adminList(int userNo);

	/**
	 * 클릭한 모임의 모임명 반환
	 * 
	 * @param roomNo - 클릭한 모임의 번호
	 * @return 클릭한 모임 DTO
	 */
	public Room roomInfo(int roomNo);

	/**
	 * 모임 추천수 조회
	 * 
	 * @param roomNo - 모임 번호
	 * @return 추천수 값 반환
	 */
	public DiaryHot diaryHot(int roomNo);
	
	/**
	 * 모임 추천수 설정
	 * 
	 * @param hot - 입력받은 추천수 값
	 * @param roomNo - 모임 번호
	 */
	public void setRoomHot(int hot, int roomNo);

	/**
	 * 모임 카테고리 리스트 조회
	 * 
	 * @param roomNo - 모임 번호
	 * @return 모임 카테고리 리스트
	 */
	public List<DiaryCategory> roomCategory(int roomNo);

	/**
	 * 모임 카테고리 생성
	 * 
	 * @param crecate - 생성할 카테고리 제목
	 * @param roomNo - 카테고리를 생성할 모임 번호
	 */
	public void crecate(String crecate, int roomNo);

	/**
	 * 모임 카테고리 삭제
	 * 
	 * @param crecate - 삭제할 카테고리 제목
	 * @param roomNo - 카테고리를 삭제할 모임 번호
	 */
	public void delcate(String delcate, int roomNo);

	/**
	 * 모임 내 가입된 사용자 리스트 조회
	 * 
	 * @param roomNo - 모임 번호
	 * @return 모임 가입된 사용자 리스트 DTO
	 */
	public List<DiaryRoomList> roomUserList(int roomNo);

	/**
	 * 모임 내 관리자 조회
	 * 
	 * @param roomNo - 모임 번호
	 * @return 관리자 리스트
	 */
	public List<DiaryAdmin> roomAdminList(int roomNo);

	/**
	 * 입력받은 사용자 관리자로 설정
	 * 
	 * @param checkAdmin - 관리자로 지정한 사용자 명단
	 * @param roomNo - 모임 번호
	 */
	public void manageadmin(String[] checkAdmin, int roomNo);

}
