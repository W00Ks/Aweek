package diary.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import diary.dto.Diary;
import diary.dto.DiaryComment;
import diary.dto.DiaryFavorite;
import diary.dto.DiaryFile;
import diary.dto.DiaryPaging;
import diary.dto.MyDiary;
import diary.dto.MyDiaryCategory;
import diary.dto.MyDiaryHot;
import diary.service.face.DiaryService;
import room.dto.Room;
import room.dto.RoomList;

@Controller
@RequestMapping("/mydiary")
public class MyDiaryController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired DiaryService diaryService;
	
	@GetMapping("/main")
	public String myDiary(Model model, HttpSession session) {
		
		// 가입된 모임 리스트
		int userNo = (int) session.getAttribute("userNo");
		List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
		
		// 가입 모임이 없을경우 fail
		if(userRoomList.size() == 0) {
			return "redirect:/diary/fail";
		}
		
		for( RoomList i : userRoomList ) logger.trace("##### userRoomList : {}", i);
		
		// 가입된 모임 이름 조회
		String[] roomNos = new String[userRoomList.size()];
		for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
		
		HashMap<String, String[]> param = new HashMap<>();
		param.put("roomNoArr", roomNos);
		
		// 모임 없는사람이 diary/main 접속하면 HashMap에 0값 넣어주는 코드
//		if(userRoomList.size() == 0) {
//			String[] roomNos0 = new String[1];
//			for(int i=0; i<userRoomList.size(); i++) roomNos0[i] = Integer.toString(0);
//			param.put("roomNoArr", roomNos0);
//		}
		
		List<Room> userRoom = diaryService.userRoomInfo(param);
		
		for( Room i : userRoom ) logger.trace("##### userRoom : {}", i);
		
		model.addAttribute("userRoom", userRoom);
		
		// 즐겨찾기 지정한 모임 리스트
		List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
		
		for( DiaryFavorite i : diaryFavorite ) logger.trace("##### diaryFavorite : {}", i);
		
		model.addAttribute("diaryFavorite", diaryFavorite);
		
		// 전체 공지사항 읽음카운트
		int noticeCount = diaryService.userNoticeCount(userNo);
		
		logger.trace("##### noticeCount : {}", noticeCount);
		
		model.addAttribute("noticeCount", noticeCount);
		
		List<MyDiaryCategory> myCateList = diaryService.myCategory(userNo);

		model.addAttribute("myCateList", myCateList);
		
		// --- --- ---
		
		// 메인 공지사항
		List<MyDiary> diaryNotice = diaryService.selectMyDiaryNotice(userNo);
		model.addAttribute("diaryNotice", diaryNotice);
				
		// 메인 추천글
		List<MyDiary> diaryRecomm = diaryService.selectMyDiaryRecomm(userNo);
		model.addAttribute("diaryRecomm", diaryRecomm);
				
		// 메인 전체글
		List<MyDiary> diaryCurrent = diaryService.selectMyDiaryCurrent(userNo);
		model.addAttribute("diaryCurrent", diaryCurrent);
		
		return "/mydiary/main";
		
	}
	
	@GetMapping("/setting")
	public String mydiarySetting(Model model, HttpSession session) {
		
		int userNo = (int) session.getAttribute("userNo");
		
		List<Room> adminList = diaryService.adminList(userNo);
		
		for( Room i : adminList ) logger.trace("##### adminList : {}", i);
		
		if(adminList.isEmpty()) {
			return "/diary/noadmin";
		}
		
		model.addAttribute("adminList", adminList);
		
		return "/mydiary/setting";
	}
	
	@GetMapping("/managecate")
	public void mydiaryAddCate(Model model, HttpSession session) {
		
		int userNo = (int) session.getAttribute("userNo");
		
		List<MyDiaryCategory> myCateList = diaryService.myCategory(userNo);

		model.addAttribute("myCateList", myCateList);
		
	}
	
	@GetMapping("/hot")
	public void diaryHot(Model model, HttpSession session) {
		
		int userNo = (int) session.getAttribute("userNo");
		
		/*
		logger.trace("##### hot roomNo : {}", roomNo);
		
		Room roomInfo = diaryService.roomInfo(roomNo);
		
		logger.trace("##### hot roomInfo : {}", roomInfo);
		
		DiaryHot diaryHot = diaryService.diaryHot(roomNo);
		
		logger.trace("##### hot diaryHot : {}", diaryHot);
		
		model.addAttribute("diaryHot", diaryHot);
		
		model.addAttribute("roomInfo", roomInfo);
		*/
		
		MyDiaryHot mydiaryHot = diaryService.mydiaryHot(userNo);
		
		model.addAttribute("mydiaryHot", mydiaryHot);
		
	}
	
	@GetMapping("/write")
	public String mydiaryWrite(Model model, HttpSession session, @RequestParam int diaryNo) {
		
		// 가입된 모임 리스트
		int userNo = (int) session.getAttribute("userNo");
		List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
		
		// 가입 모임이 없을경우 fail
		if(userRoomList.size() == 0) {
			return "redirect:/diary/fail";
		}
		
		// 가입된 모임 이름 조회
		String[] roomNos = new String[userRoomList.size()];
		for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
		
		HashMap<String, String[]> param = new HashMap<>();
		param.put("roomNoArr", roomNos);
		
		List<Room> userRoom = diaryService.userRoomInfo(param);
		
		model.addAttribute("userRoom", userRoom);
		
		// 즐겨찾기 지정한 모임 리스트
		List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
		
		model.addAttribute("diaryFavorite", diaryFavorite);
		
		// 전체 공지사항 읽음카운트
		int noticeCount = diaryService.userNoticeCount(userNo);
		
		model.addAttribute("noticeCount", noticeCount);
		
		List<MyDiaryCategory> myCateList = diaryService.myCategory(userNo);

		model.addAttribute("myCateList", myCateList);
		
		// --- --- ---
		
		/*
		// 선택한 모임 정보
		Room roomInfo = diaryService.roomInfo(roomNo);
		
		model.addAttribute("roomInfo", roomInfo);
		
		// 선택한 모임의 카테고리(공지사항 제외/미제외)
		
		int adminresult = diaryService.adminresult(roomNo, userNo);
		
		if(adminresult == 1) { // 해당 모임의 관리자
			
			List<DiaryCategory> categoryList = diaryService.roomCategory(roomNo);
			
			model.addAttribute("categoryList", categoryList);
			
		} else { // 해당 모임의 관리자가 아님
			
			List<DiaryCategory> categoryList = diaryService.roomCategory2(roomNo);
			
			model.addAttribute("categoryList", categoryList);
			
		}
		*/
		
		return "/mydiary/write";
		
	}
	
	@GetMapping("/view")
	public String MydiaryView(Model model, HttpSession session, @RequestParam int diaryNo) {
		
		// 가입된 모임 리스트
				int userNo = (int) session.getAttribute("userNo");
				List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
				
				// 가입 모임이 없을경우 fail
				if(userRoomList.size() == 0) {
					return "redirect:/diary/fail";
				}
				
				for( RoomList i : userRoomList ) logger.trace("##### userRoomList : {}", i);
				
				// 가입된 모임 이름 조회
				String[] roomNos = new String[userRoomList.size()];
				for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
				
				HashMap<String, String[]> param = new HashMap<>();
				param.put("roomNoArr", roomNos);
				
				// 모임 없는사람이 diary/main 접속하면 HashMap에 0값 넣어주는 코드
//				if(userRoomList.size() == 0) {
//					String[] roomNos0 = new String[1];
//					for(int i=0; i<userRoomList.size(); i++) roomNos0[i] = Integer.toString(0);
//					param.put("roomNoArr", roomNos0);
//				}
				
				List<Room> userRoom = diaryService.userRoomInfo(param);
				
				for( Room i : userRoom ) logger.trace("##### userRoom : {}", i);
				
				model.addAttribute("userRoom", userRoom);
				
				// 즐겨찾기 지정한 모임 리스트
				List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
				
				for( DiaryFavorite i : diaryFavorite ) logger.trace("##### diaryFavorite : {}", i);
				
				model.addAttribute("diaryFavorite", diaryFavorite);
				
				// 전체 공지사항 읽음카운트
				int noticeCount = diaryService.userNoticeCount(userNo);
				
				logger.trace("##### noticeCount : {}", noticeCount);
				
				model.addAttribute("noticeCount", noticeCount);
				
				List<MyDiaryCategory> myCateList = diaryService.myCategory(userNo);

				model.addAttribute("myCateList", myCateList);
		
		// --- --- ---
		
		MyDiary diary = diaryService.myview(diaryNo);	
		
		model.addAttribute("diary", diary);
	
		return "/mydiary/view";
		
	}
	
	@GetMapping("/notice")
	public String diaryNotice(Model model, HttpSession session
			, @RequestParam(defaultValue="0") int curPage
			, @RequestParam(defaultValue="0") int sort
			, @RequestParam(defaultValue="0") int searchsort
			, @RequestParam(defaultValue="") String searchtext
			, @RequestParam(defaultValue="0") int roomNo
			) {
		
		// 가입된 모임 리스트
				int userNo = (int) session.getAttribute("userNo");
				List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
				
				// 가입 모임이 없을경우 fail
				if(userRoomList.size() == 0) {
					return "redirect:/diary/fail";
				}
				
				for( RoomList i : userRoomList ) logger.trace("##### userRoomList : {}", i);
				
				// 가입된 모임 이름 조회
				String[] roomNos = new String[userRoomList.size()];
				for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
				
				HashMap<String, String[]> param = new HashMap<>();
				param.put("roomNoArr", roomNos);
				
				// 모임 없는사람이 diary/main 접속하면 HashMap에 0값 넣어주는 코드
//				if(userRoomList.size() == 0) {
//					String[] roomNos0 = new String[1];
//					for(int i=0; i<userRoomList.size(); i++) roomNos0[i] = Integer.toString(0);
//					param.put("roomNoArr", roomNos0);
//				}
				
				List<Room> userRoom = diaryService.userRoomInfo(param);
				
				for( Room i : userRoom ) logger.trace("##### userRoom : {}", i);
				
				model.addAttribute("userRoom", userRoom);
				
				// 즐겨찾기 지정한 모임 리스트
				List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
				
				for( DiaryFavorite i : diaryFavorite ) logger.trace("##### diaryFavorite : {}", i);
				
				model.addAttribute("diaryFavorite", diaryFavorite);
				
				// 전체 공지사항 읽음카운트
				int noticeCount = diaryService.userNoticeCount(userNo);
				
				logger.trace("##### noticeCount : {}", noticeCount);
				
				model.addAttribute("noticeCount", noticeCount);
				
				List<MyDiaryCategory> myCateList = diaryService.myCategory(userNo);

				model.addAttribute("myCateList", myCateList);
		
		// --- --- ---
		
		DiaryPaging paging = diaryService.getNoticePaging(curPage, userNo, searchtext, sort, searchsort, roomNo, userRoom);
		
		List<Diary> diaryMyList = diaryService.getNoticeList(paging, userNo, searchtext, sort, searchsort, roomNo, userRoom);
		
		model.addAttribute("sort", sort);
		model.addAttribute("paging", paging);
		model.addAttribute("list", diaryMyList);
		model.addAttribute("searchsort", searchsort);
		model.addAttribute("searchtext", searchtext);

		return "/mydiary/notice";
		
	}
	
	@GetMapping("/best")
	public String mydiaryBest(Model model, HttpSession session
			, @RequestParam(defaultValue="0") int curPage
			, @RequestParam(defaultValue="0") int sort
			, @RequestParam(defaultValue="0") int searchsort
			, @RequestParam(defaultValue="") String searchtext
			, @RequestParam(defaultValue="0") int roomNo
			) {
		
		// 가입된 모임 리스트
				int userNo = (int) session.getAttribute("userNo");
				List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
				
				// 가입 모임이 없을경우 fail
				if(userRoomList.size() == 0) {
					return "redirect:/diary/fail";
				}
				
				for( RoomList i : userRoomList ) logger.trace("##### userRoomList : {}", i);
				
				// 가입된 모임 이름 조회
				String[] roomNos = new String[userRoomList.size()];
				for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
				
				HashMap<String, String[]> param = new HashMap<>();
				param.put("roomNoArr", roomNos);
				
				// 모임 없는사람이 diary/main 접속하면 HashMap에 0값 넣어주는 코드
//				if(userRoomList.size() == 0) {
//					String[] roomNos0 = new String[1];
//					for(int i=0; i<userRoomList.size(); i++) roomNos0[i] = Integer.toString(0);
//					param.put("roomNoArr", roomNos0);
//				}
				
				List<Room> userRoom = diaryService.userRoomInfo(param);
				
				for( Room i : userRoom ) logger.trace("##### userRoom : {}", i);
				
				model.addAttribute("userRoom", userRoom);
				
				// 즐겨찾기 지정한 모임 리스트
				List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
				
				for( DiaryFavorite i : diaryFavorite ) logger.trace("##### diaryFavorite : {}", i);
				
				model.addAttribute("diaryFavorite", diaryFavorite);
				
				// 전체 공지사항 읽음카운트
				int noticeCount = diaryService.userNoticeCount(userNo);
				
				logger.trace("##### noticeCount : {}", noticeCount);
				
				model.addAttribute("noticeCount", noticeCount);
				
				List<MyDiaryCategory> myCateList = diaryService.myCategory(userNo);

				model.addAttribute("myCateList", myCateList);
		
		// --- --- ---
		
				DiaryPaging paging = diaryService.getBestPaging(curPage, userNo, searchtext, sort, searchsort, roomNo, userRoom);
				
				List<Diary> diaryMyList = diaryService.getBestList(paging, userNo, searchtext, sort, searchsort, roomNo, userRoom);
				
				model.addAttribute("sort", sort);
				model.addAttribute("paging", paging);
				model.addAttribute("list", diaryMyList);
				model.addAttribute("searchsort", searchsort);
				model.addAttribute("searchtext", searchtext);

				return "/mydiary/best";
		
	}
	
	@GetMapping("/entire")
	public String mydiaryEntire(Model model, HttpSession session
			, @RequestParam(defaultValue="0") int curPage
			, @RequestParam(defaultValue="0") int sort
			, @RequestParam(defaultValue="0") int searchsort
			, @RequestParam(defaultValue="") String searchtext
			, @RequestParam(defaultValue="0") int roomNo
			) {
		
		// 가입된 모임 리스트
				int userNo = (int) session.getAttribute("userNo");
				List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
				
				// 가입 모임이 없을경우 fail
				if(userRoomList.size() == 0) {
					return "redirect:/diary/fail";
				}
				
				for( RoomList i : userRoomList ) logger.trace("##### userRoomList : {}", i);
				
				// 가입된 모임 이름 조회
				String[] roomNos = new String[userRoomList.size()];
				for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
				
				HashMap<String, String[]> param = new HashMap<>();
				param.put("roomNoArr", roomNos);
				
				// 모임 없는사람이 diary/main 접속하면 HashMap에 0값 넣어주는 코드
//				if(userRoomList.size() == 0) {
//					String[] roomNos0 = new String[1];
//					for(int i=0; i<userRoomList.size(); i++) roomNos0[i] = Integer.toString(0);
//					param.put("roomNoArr", roomNos0);
//				}
				
				List<Room> userRoom = diaryService.userRoomInfo(param);
				
				for( Room i : userRoom ) logger.trace("##### userRoom : {}", i);
				
				model.addAttribute("userRoom", userRoom);
				
				// 즐겨찾기 지정한 모임 리스트
				List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
				
				for( DiaryFavorite i : diaryFavorite ) logger.trace("##### diaryFavorite : {}", i);
				
				model.addAttribute("diaryFavorite", diaryFavorite);
				
				// 전체 공지사항 읽음카운트
				int noticeCount = diaryService.userNoticeCount(userNo);
				
				logger.trace("##### noticeCount : {}", noticeCount);
				
				model.addAttribute("noticeCount", noticeCount);
				
				List<MyDiaryCategory> myCateList = diaryService.myCategory(userNo);

				model.addAttribute("myCateList", myCateList);
		
		// --- --- ---
		
				DiaryPaging paging = diaryService.getEntirePaging(curPage, userNo, searchtext, sort, searchsort, roomNo, userRoom);
				
				List<Diary> diaryMyList = diaryService.getEntireList(paging, userNo, searchtext, sort, searchsort, roomNo, userRoom);
				
				model.addAttribute("sort", sort);
				model.addAttribute("paging", paging);
				model.addAttribute("list", diaryMyList);
				model.addAttribute("searchsort", searchsort);
				model.addAttribute("searchtext", searchtext);

				return "/mydiary/entire";
		
	}

}
