package diary.dao.face;

import java.util.HashMap;
import java.util.List;

import diary.dto.Diary;
import diary.dto.DiaryAdmin;
import diary.dto.DiaryCategory;
import diary.dto.DiaryComment;
import diary.dto.DiaryFavorite;
import diary.dto.DiaryFile;
import diary.dto.DiaryHot;
import diary.dto.DiaryRoomList;
import diary.dto.DiaryUserRecomm;
import diary.dto.MyDiary;
import diary.dto.MyDiaryCategory;
import diary.dto.MyDiaryHot;
import diary.dto.DiaryPaging;
import diary.dto.DiaryPagingAndRoom;
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

	/**
	 * 모임 카테고리 데이터 추가
	 * 
	 * @param diaryCategory - 모임 번호, 카테고리 이름이 포함된 DTO
	 */
	public void insertDiaryCategory(DiaryCategory diaryCategory);

	/**
	 * 모임 카테고리 데이터 삭제
	 * 
	 * @param diaryCategory - 모임 번호, 카테고리 이름이 포함된 DTO
	 */
	public void deleteDiaryCategory(DiaryCategory diaryCategory);

	/**
	 * 모임 내 가입사용자 리스트 조회
	 * 
	 * @param roomNo - 모임 번호
	 * @return 해당 모임에 가입된 사용자 리스트
	 */
	public List<DiaryRoomList> selectRoomUserList(int roomNo);

	/**
	 * 모임 내 관리자 조회
	 * 
	 * @param roomNo - 모임 번호
	 * @return 모임 내 관리자 데이터가 포함된 DiaryAdmin DTO 리스트
	 */
	public List<DiaryAdmin> selectDiaryAdmin(int roomNo);
	
	/**
	 * 관리자 설정 이전 diary_admin 테이블 데이터 사전 제거
	 * 
	 * @param roomNo
	 */
	public void deleteDiaryAdmin(int roomNo);
	
	/**
	 * 관리자로 설정된 사용자 diary_admin 테이블에 insert
	 * 
	 * @param list - 모임번호, 사용자번호가 포함된 DiaryAdmin DTO List
	 */
	public void insertDiaryAdmin(List<DiaryAdmin> list);

	/**
	 * 로그인 사용자의 읽지 않은 공지 행 수 조회
	 * 
	 * @param userNo - 로그인 사용자 번호
	 * @return 안읽은 공지 cnt(행) 수
	 */
	public int selectDiaryNoticeRead(int userNo);

	/**
	 * 선택된 카테고리 정보 조회
	 * 
	 * @param diaryCateNo - 선택된 카테고리 번호
	 * @return 카테고리 정보가 포함된 DTO
	 */
	public DiaryCategory selectDiaryCategoryInfo(int diaryCateNo);

	/**
	 * 사용자 번호로 정보 조회
	 * 
	 * @param userNo - 사용자 번호
	 * @return 사용자 정보
	 */
	public Member selectMemberName(int userNo);

	/**
	 * 모임 설정된 조회수 조회
	 * 
	 * @param writeroomNo - 모임 번호
	 * @return 모임 조회수 설정값 반환
	 */
	public DiaryHot selectDiaryHot(int writeroomNo);

	/**
	 * 게시글 데이터 삽입
	 * 
	 * @param diary - 게시글 정보 DTO
	 */
	public void insertDiary(Diary diary);

	/**
	 * 게시글 번호 조회
	 * 
	 * @param diary - 게시글 정보 DTO
	 * @return 게시글 번호 반환
	 */
	public int selectDiaryNo(Diary diary);

	/**
	 * 파일 데이터 DB 삽입
	 * 
	 * @param filetest - 파일 정보
	 */
	public void insertFile(DiaryFile filetest);

	/**
	 * 게시글 조회수 증가
	 * 
	 * @param diaryNo - 게시글 번호
	 */
	public void hit(int diaryNo);

	/**
	 * 게시글 정보 조회
	 * 
	 * @param diaryNo - 게시글 번호
	 * @return 게시글 정보 DTO
	 */
	public Diary selectDiary(int diaryNo);

	/**
	 * 게시글 첨부파일 조회
	 * 
	 * @param diary - 게시글 정보
	 * @return 게시글 첨부파일 DTO
	 */
	public DiaryFile selectFile(Diary diary);

	/**
	 * 사용자 당일 추천 여부 조회
	 * 
	 * @param userNo - 사용자 번호
	 * @return 사용자 추천 여부값
	 */
	public DiaryUserRecomm selectDiaryUserRecomm(int userNo);

	/**
	 * 해당 게시글 추천수 1 증가
	 * 
	 * @param diaryNo - 해당 게시글
	 */
	public void updateRecomm(int diaryNo);

	/**
	 * 해당 사용자 일일추천값 0으로 변경
	 * 
	 * @param userNo - 사용자 번호
	 */
	public void updateUserRecomm(int userNo);

	/**
	 * 매 12시 모든 사용자 추천횟수 초기화
	 */
	public void updateAllRecomm();

	/**
	 * 로그인 사용자가 해당 모임의 admin인지 체크
	 * 
	 * @param diaryAdmin - 모임번호, 사용자 번호가 포함된 DTO
	 * @return cnt행수
	 */
	public int selectDiaryAdminCheck(DiaryAdmin diaryAdmin);

	/**
	 * 모임 카테고리 리스트 조회(공지사항 제외)
	 * 
	 * @param roomNo - 클릭한 모임 번호
	 * @return 모임 카테고리 DTO 리스트
	 */
	public List<DiaryCategory> selectDiaryCategory2(int roomNo);

	/**
	 * 게시글 삭제
	 * 
	 * @param diaryNo - 게시글 번호
	 */
	public void deleteDiary(int diaryNo);

	/**
	 * 게시글 수정
	 * 
	 * @param diary - 게시글 정보
	 */
	public void updateDiary(Diary diary);

	/**
	 * 게시글 첨부파일의 저장이름 조회
	 * 
	 * @param diaryNo - 게시글 번호
	 * @return 해당 게시글에 있는 첨부파일의 저장이름
	 */
	public String selectStoredname(int diaryNo);

	/**
	 * 게시글 첨부파일 삭제
	 * 
	 * @param diaryNo - 게시글 번호
	 */
	public void deleteFile(int diaryNo);

	/**
	 * 나의 총 게시글 수 조회
	 * 
	 * @return 테이블의 전체 행 수
	 */
	public int selectMyCntAll(DiaryPaging temp);

	/**
	 * 나의 게시글 리스트 조회
	 * @param paging - 페이징 정보 객체
	 * @param userNo - 로그인 사용자 번호
	 * @return 나의 게시글 리스트
	 */
	public List<Diary> selectMyAll(DiaryPaging paging);

	/**
	 * 해당 게시글이 작성된 모임의 가입 여부 확인
	 * 
	 * @param roomList - 모임 번호, 사용자 번호
	 * @return cnt 값
	 */
	public int selectRoomListAuto(RoomList roomList);

	/**
	 * 추천글 페이징 계산
	 * 
	 * @param diaryVo - DTO 객체
	 * @return 추천글 페이징
	 */
	public int selectBestCntAll(DiaryPagingAndRoom diaryVo);

	/**
	 * 추천글 리스트
	 * 
	 * @param diaryVo - DTO 객체
	 * @return 추천글 리스트
	 */
	public List<Diary> selectBestAll(DiaryPagingAndRoom diaryVo);

	/**
	 * 공지 페이징 계산
	 * 
	 * @param diaryVo - DTO 객체
	 * @return 공지 페이징
	 */
	public int selectNoticeCntAll(DiaryPagingAndRoom diaryVo);

	/**
	 * 공지 리스트
	 * 
	 * @param diaryVo - DTO 객체
	 * @return 공지 리스트
	 */
	public List<Diary> selectNoticeAll(DiaryPagingAndRoom diaryVo);

	/**
	 * 전체글 페이징
	 * 
	 * @param diaryVo - DTO 객체
	 * @return 전체글 페이징
	 */
	public int selectEntireCntAll(DiaryPagingAndRoom diaryVo);

	/**
	 * 전체글 리스트
	 * 
	 * @param diaryVo - DTO 객체
	 * @return 전체글 리스트
	 */
	public List<Diary> selectEntireAll(DiaryPagingAndRoom diaryVo);

	/**
	 * 댓글 테이블에 데이터 삽입
	 * 
	 * @param diaryComment - 댓글 DTO
	 */
	public void insertDiaryComment(DiaryComment diaryComment);

	/**
	 * 게시글의 댓글 조회
	 * 
	 * @param diaryNo - 게시글 번호
	 * @return 댓글 DTO
	 */
	public List<DiaryComment> selectDiaryComment(int diaryNo);

	/**
	 * 게시글의 댓글 삭제
	 * 
	 * @param diaryCommNo - 댓글 번호
	 */
	public void deleteDiaryComment(int diaryCommNo);

	/**
	 * 해당 모임의 구독 여부 체크
	 * 
	 * @param writeroomNo - 모임 번호
	 * @return 결과값
	 */
	public int selectPayment(int writeroomNo);

	/**
	 * 카테고리명 select
	 * 
	 * @param diaryCateNo2 - 카테고리 번호
	 * @return 카테고리명
	 */
	public String selectCateName(int diaryCateNo2);

	/**
	 * 모임에 가입된 사용자 리스트 검색
	 * 
	 * @param writeroomNo - 모임 번호
	 * @return RoomList DTO
	 */
	public List<DiaryRoomList> selectRoomNoList(int writeroomNo);

	/**
	 * 공지 안읽음 데이터 삽입
	 * 
	 * @param roomList - 해당 공지가 쓰여진 모임의 가입자 리스트
	 */
	public void insertDiaryNoticeRead(List<DiaryRoomList> roomList);

	/**
	 * 공지 읽음 시 카운트 변경
	 * 
	 * @param diaryRoomList - 사용자번호와 게시글번호
	 */
	public void updateDiaryNoticeRead(DiaryRoomList diaryRoomList);

	/**
	 * 안읽은 공지 페이징 조회
	 * 
	 * @param diaryVo - DTO 객체
	 * @return 안읽은 공지 페이징
	 */
	public int selectUnreadNoticeCntAll(DiaryPagingAndRoom diaryVo);

	/**
	 * 안읽은 공지 리스트 조회
	 * 
	 * @param diaryVo - DTO 객체
	 * @return 안읽은 공지 리스트
	 */
	public List<Diary> selectUnreadNoticeAll(DiaryPagingAndRoom diaryVo);



	public List<MyDiaryCategory> selectMyDiaryCategory(int userNo);

	public MyDiaryHot selectMyHotvalue(int userNo);

	public List<MyDiary> selectMyDiaryNotice(int userNo);

	public List<MyDiary> selectMyDiaryRecomm(int userNo);

	public List<MyDiary> selectMyDiaryCurrent(int userNo);

	public MyDiary viewMyDiary(int diaryNo);

}
