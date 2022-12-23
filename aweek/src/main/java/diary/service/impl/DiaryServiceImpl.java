package diary.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import diary.dao.face.DiaryDao;
import diary.dto.Diary;
import diary.dto.DiaryAdmin;
import diary.dto.DiaryCategory;
import diary.dto.DiaryFavorite;
import diary.dto.DiaryFile;
import diary.dto.DiaryHot;
import diary.dto.DiaryRoomList;
import diary.dto.DiaryUserRecomm;
import diary.dto.DiaryPaging;
import diary.service.face.DiaryService;
import member.dto.Member;
import room.dto.Room;
import room.dto.RoomList;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired DiaryDao diaryDao;
	
	// 서블릿 컨텍스트 객체
	@Autowired ServletContext context;

	@Override
	public boolean login(Member member) {
		int loginChk = diaryDao.selectCntMember(member);
		logger.trace("##### loginChk : {}", loginChk);
		
		if( loginChk > 0 )	return true;
		return false;
	}

	@Override
	public Member userInfo(Member member) {
		return diaryDao.selectMember(member);
	}

	@Override
	public List<RoomList> userRoomInfo(int userNo) {
		return diaryDao.selectRoomList(userNo);
	}

	@Override
	public List<Room> userRoomInfo(HashMap<String, String[]> param) {
		return diaryDao.selectRoom(param);
	}

	@Override
	public void userFavorite(String[] roomnos, int userNo) {
		diaryDao.deleteFavorite(userNo);
		
		List<DiaryFavorite> list = new ArrayList<>();
				
		for(int i=0; i<roomnos.length; i++) {
			list.add(new DiaryFavorite(Integer.parseInt(roomnos[i]), userNo, ""));
		}
		
		for( DiaryFavorite i : list ) logger.trace("##### DiaryFavorite list : {}", i);
		
		diaryDao.insertFavorite(list);
	}

	@Override
	public List<DiaryFavorite> userFavorite(int userNo) {
		return diaryDao.selectFavorite(userNo);
	}

	@Override
	public void userFavoriteClear(int userNo) {
		diaryDao.deleteFavorite(userNo);
	}

	@Override
	public List<Diary> selectDiaryNotice(List<Room> userRoom) {
		return diaryDao.selectDiaryNotice(userRoom);
	}

	@Override
	public List<Diary> selectDiaryRecomm(List<Room> userRoom) {
		return diaryDao.selectDiaryRecomm(userRoom);
	}

	@Override
	public List<Diary> selectDiaryCurrent(List<Room> userRoom) {
		return diaryDao.selectDiaryCurrent(userRoom);
	}

	@Override
	public List<Room> adminList(int userNo) {
		return diaryDao.selectAdminRoom(userNo);
	}

	@Override
	public Room roomInfo(int roomNo) {
		return diaryDao.selectRoomName(roomNo);
	}

	@Override
	public DiaryHot diaryHot(int roomNo) {
		return diaryDao.selectHotvalue(roomNo);
	}
	
	@Override
	public void setRoomHot(int hot, int roomNo) {
		int result = diaryDao.selectHot(roomNo);
		
		DiaryHot diaryHot = new DiaryHot();
		diaryHot.setDiaryHot(hot);
		diaryHot.setRoomNo(roomNo);
		
		if( result == 0) {
			diaryDao.insertHot(diaryHot);
		} else {
			diaryDao.updateHot(diaryHot);
		}
	}

	@Override
	public List<DiaryCategory> roomCategory(int roomNo) {
		return diaryDao.selectDiaryCategory(roomNo);
	}

	@Override
	public void crecate(String crecate, int roomNo) {
		DiaryCategory diaryCategory = new DiaryCategory(0, roomNo, crecate);
		diaryDao.insertDiaryCategory(diaryCategory);
	}

	@Override
	public void delcate(String delcate, int roomNo) {
		DiaryCategory diaryCategory = new DiaryCategory(0, roomNo, delcate);
		diaryDao.deleteDiaryCategory(diaryCategory);
	}

	@Override
	public List<DiaryRoomList> roomUserList(int roomNo) {
		return diaryDao.selectRoomUserList(roomNo);
	}

	@Override
	public List<DiaryAdmin> roomAdminList(int roomNo) {
		return diaryDao.selectDiaryAdmin(roomNo);
	}

	@Override
	public void manageadmin(String[] checkAdmin, int roomNo) {
		
		List<DiaryAdmin> list = new ArrayList<>();
		
		for(int i=0; i<checkAdmin.length; i++) {
			list.add(new DiaryAdmin(roomNo, Integer.parseInt(checkAdmin[i]), ""));
		}
		
		for( DiaryAdmin i : list ) logger.trace("##### DiaryAdmin list : {}", i);
		
		diaryDao.deleteDiaryAdmin(roomNo);
		
		diaryDao.insertDiaryAdmin(list);
		
	}

	@Override
	public int userNoticeCount(int userNo) {
		return diaryDao.selectDiaryNoticeRead(userNo);
	}

	@Override
	public DiaryCategory categoryInfo(int diaryCateNo) {
		return diaryDao.selectDiaryCategoryInfo(diaryCateNo);
	}

	@Override
	public int write(int diaryCateNo2, int userNo, int writeroomNo, String title, String content, int publicresult) {
		
		// 임의의 날짜를 지정하는 코드
        String dateStr = "1995년 5월 5일 05시 05분 05초";
        
        // 포맷터
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
 
        // 문자열 -> Date
        Date date = null;
		try {
			date = formatter.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// 사용자 이름 조회
		Member member = diaryDao.selectMemberName(userNo);
		String userName = member.getUserName();
		
		// 모임 이름 조회
		Room room = diaryDao.selectRoomName(writeroomNo);
		String roomName = room.getRoomName();
		
		// 모임 조회수 설정값 조회
		DiaryHot diaryHot = diaryDao.selectDiaryHot(writeroomNo);
		int roomHot = diaryHot.getDiaryHot();
		
		Diary diary = new Diary(0, diaryCateNo2, userNo, writeroomNo, title, content, date, 0, publicresult, 0, 0, userName, roomName, "", roomHot);
		
		diaryDao.insertDiary(diary);
		
		return diaryDao.selectDiaryNo(diary);
	}

	@Override
	public void fileSave(MultipartFile file, int diaryNo) {
		
		// 파일의 크기가 0일 때 파일 업로드 처리 중단
		if( file.getSize() <= 0 ) {
			logger.trace("##### file size <= 0");
					
			return; // 메소드 끝내버리기
		}
		
		// 파일이 저장될 경로 (RealPath)
		String storedPath = context.getRealPath("upload");
		logger.trace("##### storedPath : {}", storedPath);
		
		// upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		// 저장될 파일 이름 생성하기
		String storedName = file.getOriginalFilename(); // 원본파일명
		storedName += UUID.randomUUID().toString().split("-")[0]; // 랜덤문자 삽입
		logger.trace("##### storedName : {}", storedName);
		
		// 실제 저장될 파일 객체
		File dest = new File(storedFolder, storedName);
		
		try {
			// 업로드된 파일을 upload폴더에 저장하기
			file.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		// DB에 기록할 정보 객체 - DTO
		DiaryFile filetest = new DiaryFile();
		
		filetest.setDiaryNo(diaryNo);
		filetest.setDiaryOriginName(file.getOriginalFilename());
		filetest.setDiaryStoredName(storedName);
		filetest.setDiaryFileSize((int) file.getSize());
		
		diaryDao.insertFile( filetest );
		
	}

	@Override
	public Diary view(int diaryNo) {
		diaryDao.hit(diaryNo);
		
		return diaryDao.selectDiary(diaryNo);
	}

	@Override
	public DiaryFile viewFile(Diary diary) {
		return diaryDao.selectFile(diary);
	}

	@Override
	public DiaryUserRecomm userRecomm(int userNo) {
		return diaryDao.selectDiaryUserRecomm(userNo);
	}

	@Override
	public void diaryRecomm(int diaryNo) {
		diaryDao.updateRecomm(diaryNo);
	}

	@Override
	public void downUserRecomm(int userNo) {
		diaryDao.updateUserRecomm(userNo);
	}

	@Override
	public void AutoRecomm() {
		diaryDao.updateAllRecomm();
	}

	@Override
	public int adminresult(int roomNo, int userNo) {
		
		DiaryAdmin diaryAdmin = new DiaryAdmin(roomNo, userNo, "");
		
		return diaryDao.selectDiaryAdminCheck(diaryAdmin);
	}

	@Override
	public List<DiaryCategory> roomCategory2(int roomNo) {
		return diaryDao.selectDiaryCategory2(roomNo);
	}

	@Override
	public void deleteDiary(int diaryNo) {
		
		// 파일이 저장될 경로 (RealPath)
		String storedPath = context.getRealPath("upload");
		logger.trace("##### storedPath : {}", storedPath);
		
		String storedname = diaryDao.selectStoredname(diaryNo);
		logger.trace("##### storedname : {}", storedname);
		String result = "\\";
		
		
		File file = new File( context.getRealPath("upload") + result + storedname );
		
		// 게시글에 첨부파일이 있을 경우 삭제
		if( file.exists() ) {
			file.delete();
		}
		
		diaryDao.deleteFile(diaryNo);
		
		diaryDao.deleteDiary(diaryNo);
		
	}

	@Override
	public Diary diarySelect(int diaryNo) {
		return diaryDao.selectDiary(diaryNo);
	}

	@Override
	public DiaryFile diaryFileSelect(Diary diaryInfo) {
		return diaryDao.selectFile(diaryInfo);
	}

	@Override
	public void update(String title, String content, int diaryNo, int publicresult, String change, MultipartFile file) {
		
		Diary diary = diaryDao.selectDiary(diaryNo);
		
		diary.setDiaryTitle(title);
		diary.setDiaryContent(content);
		diary.setDiaryPublic(publicresult);
				
		logger.trace("##### diary : {}", diary);
		
		diaryDao.updateDiary(diary);
		
		if( change.equals("normal") ) {
			
			// 파일의 크기가 0일 때 파일 업로드 처리 중단
			if( file.getSize() <= 0 ) {
				logger.trace("##### file size <= 0");
						
				return; // 메소드 끝내버리기
			}
			
			// 파일이 저장될 경로 (RealPath)
			String storedPath = context.getRealPath("upload");
			logger.trace("##### storedPath : {}", storedPath);
			
			// upload폴더가 존재하지 않으면 생성한다
			File storedFolder = new File(storedPath);
			storedFolder.mkdir();
			
			// 저장될 파일 이름 생성하기
			String storedName = file.getOriginalFilename(); // 원본파일명
			storedName += UUID.randomUUID().toString().split("-")[0]; // 랜덤문자 삽입
			logger.trace("##### storedName : {}", storedName);
			
			// 실제 저장될 파일 객체
			File dest = new File(storedFolder, storedName);
			
			try {
				// 업로드된 파일을 upload폴더에 저장하기
				file.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			// DB에 기록할 정보 객체 - DTO
			DiaryFile filetest = new DiaryFile();
			
			filetest.setDiaryNo(diaryNo);
			filetest.setDiaryOriginName(file.getOriginalFilename());
			filetest.setDiaryStoredName(storedName);
			filetest.setDiaryFileSize((int) file.getSize());
			
			diaryDao.insertFile( filetest );
			
		}
		
		if( change.equals("change") ) {
			
			// 파일이 저장될 경로 (RealPath)
			String storedPath1 = context.getRealPath("upload");
			logger.trace("##### storedPath : {}", storedPath1);
			
			String storedname = diaryDao.selectStoredname(diaryNo);
			logger.trace("##### storedname : {}", storedname);
			String result = "\\";
			
			File file1 = new File( context.getRealPath("upload") + result + storedname );
			
			// 게시글에 첨부파일이 있을 경우 삭제
			if( file1.exists() ) {
				file1.delete();
			}
			
			diaryDao.deleteFile(diaryNo);
			
			// 파일의 크기가 0일 때 파일 업로드 처리 중단
			if( file.getSize() <= 0 ) {
				logger.trace("##### file size <= 0");
						
				return; // 메소드 끝내버리기
			}
			
			// 파일이 저장될 경로 (RealPath)
			String storedPath = context.getRealPath("upload");
			logger.trace("##### storedPath : {}", storedPath);
			
			// upload폴더가 존재하지 않으면 생성한다
			File storedFolder = new File(storedPath);
			storedFolder.mkdir();
			
			// 저장될 파일 이름 생성하기
			String storedName = file.getOriginalFilename(); // 원본파일명
			storedName += UUID.randomUUID().toString().split("-")[0]; // 랜덤문자 삽입
			logger.trace("##### storedName : {}", storedName);
			
			// 실제 저장될 파일 객체
			File dest = new File(storedFolder, storedName);
			
			try {
				// 업로드된 파일을 upload폴더에 저장하기
				file.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			// DB에 기록할 정보 객체 - DTO
			DiaryFile filetest = new DiaryFile();
			
			filetest.setDiaryNo(diaryNo);
			filetest.setDiaryOriginName(file.getOriginalFilename());
			filetest.setDiaryStoredName(storedName);
			filetest.setDiaryFileSize((int) file.getSize());
			
			diaryDao.insertFile( filetest );
			
		}
		
	}

	@Override
	public DiaryPaging getMyPaging(int curPage, int userNo, String searchtext, int sort, int searchsort) {
		
		DiaryPaging temp = new DiaryPaging();
		
		temp.setUserNo(userNo);
		temp.setSearchtext(searchtext);
		temp.setSort(sort);
		temp.setSearchsort(searchsort);
		
		
		
		//총 게시글 수 조회하기
		int totalCount = diaryDao.selectMyCntAll(temp);
		
		//전달파라미터 curPage 추출하기
		String param = Integer.toString(curPage);
		int curPage1 = 0;
		if( param != null && !"".equals(param) ) {
			curPage1 = Integer.parseInt(param);
		}
		
		//Paging객체 생성
		DiaryPaging paging = new DiaryPaging(totalCount, curPage1);
		
		return paging;
		
	}

	@Override
	public List<Diary> getMyList(DiaryPaging paging, int userNo, String searchtext, int sort, int searchsort) {
		paging.setUserNo(userNo);
		paging.setSearchtext(searchtext);
		paging.setSort(sort);
		paging.setSearchsort(searchsort);
		
		return diaryDao.selectMyAll(paging);
	}

	@Override
	public int authority(RoomList roomList) {
		return diaryDao.selectRoomListAuto(roomList);
	}

	@Override
	public DiaryPaging getBestPaging(int curPage, int userNo, String searchtext, int sort, int searchsort) {
		DiaryPaging temp = new DiaryPaging();
		
		temp.setUserNo(userNo);
		temp.setSearchtext(searchtext);
		temp.setSort(sort);
		temp.setSearchsort(searchsort);
		
		
		
		//총 게시글 수 조회하기
		int totalCount = diaryDao.selectBestCntAll(temp);
		
		//전달파라미터 curPage 추출하기
		String param = Integer.toString(curPage);
		int curPage1 = 0;
		if( param != null && !"".equals(param) ) {
			curPage1 = Integer.parseInt(param);
		}
		
		//Paging객체 생성
		DiaryPaging paging = new DiaryPaging(totalCount, curPage1);
		
		return paging;
	}

	@Override
	public List<Diary> getBestList(DiaryPaging paging, int userNo, String searchtext, int sort, int searchsort) {
		paging.setUserNo(userNo);
		paging.setSearchtext(searchtext);
		paging.setSort(sort);
		paging.setSearchsort(searchsort);
		
		return diaryDao.selectBestAll(paging);
	}

}
