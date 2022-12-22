package diary.service.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import diary.dto.Diary;
import diary.dto.DiaryAdmin;
import diary.dto.DiaryCategory;
import diary.dto.DiaryFavorite;
import diary.dto.DiaryFile;
import diary.dto.DiaryHot;
import diary.dto.DiaryRoomList;
import diary.dto.DiaryUserRecomm;
import diary.dto.DiaryPaging;
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

	/**
	 * 로그인 사용자의 안읽은 공지 카운트 표시
	 * 
	 * @param userNo - 로그인 사용자 번호
	 * @return 안읽은 공지 총 카운트
	 */
	public int userNoticeCount(int userNo);

	/**
	 * 선택된 카테고리 정보 반환
	 * @param diaryCateNo - 선택된 카테고리 번호
	 * @return 카테고리 정보 DTO
	 */
	public DiaryCategory categoryInfo(int diaryCateNo);

	/**
	 * 게시글 작성
	 * 
	 * @param diaryCateNo2 - 카테고리 번호
	 * @param userNo - 작성자 번호
	 * @param writeroomNo - 모임 번호
	 * @param title - 제목
	 * @param content - 본문
	 * @param publicresult - 공개 여부(1 공개, 0 비공개)
	 * @return 작성된 게시글 번호
	 */
	public int write(int diaryCateNo2, int userNo, int writeroomNo, String title, String content, int publicresult);

	/**
	 * 파일 정보 DB에 저장
	 * 
	 * @param file - multipart 형식으로 입력받은 파일 데이터
	 * @param diaryNo - 게시글 번호
	 */
	public void fileSave(MultipartFile file, int diaryNo);

	/**
	 * 게시글 조회
	 * 
	 * @param diaryNo - 게시글 번호
	 * @return 게시글 DTO
	 */
	public Diary view(int diaryNo);

	/**
	 * 게시글 첨부파일 조회
	 * 
	 * @param diary - 게시글 정보
	 * @return 게시글 첨부파일 DTO
	 */
	public DiaryFile viewFile(Diary diary);

	/**
	 * 사용자의 일일 추천 사용 여부 체크(1이면 추천가능, 0이면 불가)
	 * 
	 * @param userNo - 로그인 사용자 번호
	 * @return 추천여부 조회
	 */
	public DiaryUserRecomm userRecomm(int userNo);

	/**
	 * 게시글 추천수 증가
	 * 
	 * @param diaryNo - 게시글 번호
	 */
	public void diaryRecomm(int diaryNo);

	/**
	 * 추천한 사용자 일일추천 삭제
	 * 
	 * @param userNo - 사용자 번호
	 */
	public void downUserRecomm(int userNo);

	/**
	 * 매 12시 사용자 추천 횟수 초기화
	 */
	public void AutoRecomm();

	/**
	 * 로그인 사용자가 해당 모임의 admin인지 판별
	 * 
	 * @param roomNo - 모임 번호
	 * @param userNo - 사용자 번호
	 * @return cnt행수
	 */
	public int adminresult(int roomNo, int userNo);

	/**
	 * 모임 카테고리 리스트 조회(공지사항 제외)
	 * 
	 * @param roomNo - 모임 번호
	 * @return 모임 카테고리 리스트
	 */
	public List<DiaryCategory> roomCategory2(int roomNo);

	/**
	 * 게시글 삭제
	 * 
	 * @param diaryNo - 게시글 번호
	 */
	public void deleteDiary(int diaryNo);

	/**
	 * 게시글 정보 조회
	 * 
	 * @param diaryNo - 게시글 번호
	 * @return 조회된 게시글 정보값
	 */
	public Diary diarySelect(int diaryNo);

	/**
	 * 게시글 첨부파일 조회
	 * 
	 * @param diaryInfo - 게시글 정보
	 * @return 조회된 게시글의 첨부파일 정보값
	 */
	public DiaryFile diaryFileSelect(Diary diaryInfo);

	/**
	 * 게시글 수정
	 * 
	 * @param title - 제목
	 * @param content - 본문
	 * @param diaryNo - 게시글 번호
	 * @param publicresult - 공개 설정
	 * @param change - 첨부파일 수정 여부
	 * @param file - 첨부파일 정보
	 */
	public void update(String title, String content, int diaryNo, int publicresult, String change, MultipartFile file);
	
	/**
	 * 나의 게시글 페이징 객체 생성
	 * 
	 * @param curPage - 요청 정보 객체
	 * @param userNo 
	 * @return 페이징 계산이 완료된 객체
	 */
	public DiaryPaging getPaging(int curPage, int userNo);

	/**
	 * 나의 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @param userNo - 로그인 사용자 번호
	 * @return - 나의 게시글 전체 조회 목록
	 */
	public List<Diary> getMyList(DiaryPaging paging, int userNo);

}
