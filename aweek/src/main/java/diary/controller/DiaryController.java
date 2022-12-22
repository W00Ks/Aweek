package diary.controller;


import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
import diary.service.face.DiaryService;
import member.dto.Member;
import room.dto.Room;
import room.dto.RoomList;

@Controller
@RequestMapping("/diary")
public class DiaryController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired DiaryService diaryService;
	
	@GetMapping("/test1")
	public void test1() {}
	
	@GetMapping("/test2")
	public void test2() {}
	
	@GetMapping("/login")
	public void diaryLogin() {}
	
	@PostMapping("/login")
	public String diaryLoginProc(Member member, HttpSession session) {
		logger.trace("##### login member : {}", member);
		
		boolean loginResult = diaryService.login(member);
		
		if( loginResult ) {
			
			member = diaryService.userInfo(member);
			
			logger.trace("##### userInfo : {}", member);
			
			session.setAttribute("loginResult", loginResult);
			session.setAttribute("userNo", member.getUserNo());
			session.setAttribute("userId", member.getUserId());
			
			return "redirect:/diary/main";
			
		} else {
			
			session.invalidate();
			
			return "redirect:/diary/login";
		}

	}
	
	@GetMapping("/fail")
	public void diaryFail(HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		
		Cookie[] cookies = req.getCookies(); // 모든 쿠키의 정보를 cookies에 저장
		if(cookies != null) { // 쿠키가 한개라도 있으면 실행
	    	for(int h=0; h< cookies.length; h++) {
	        	cookies[h].setMaxAge(0); // 유효시간을 0으로 설정
	            	resp.addCookie(cookies[h]); // 응답 헤더에 추가
	        }
		}
		
		session.invalidate();
		
		try {
			req.getRequestDispatcher("/WEB-INF/views/diary/fail.jsp").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@GetMapping("/main")
	public String diaryMain(Model model, HttpSession session) {
		
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
		
		// --- --- ---
		
		// 메인 공지사항
		List<Diary> diaryNotice = diaryService.selectDiaryNotice(userRoom);
		for( Diary i : diaryNotice ) logger.trace("##### diaryNotice : {}", i);
		model.addAttribute("diaryNotice", diaryNotice);
				
		// 메인 추천글
		List<Diary> diaryRecomm = diaryService.selectDiaryRecomm(userRoom);
		for( Diary i : diaryRecomm ) logger.trace("##### diaryRecomm : {}", i);
		model.addAttribute("diaryRecomm", diaryRecomm);
				
		// 메인 전체글
		List<Diary> diaryCurrent = diaryService.selectDiaryCurrent(userRoom);
		for( Diary i : diaryCurrent ) logger.trace("##### diaryCurrent : {}", i);
		model.addAttribute("diaryCurrent", diaryCurrent);
		
		return "/diary/main";

	}
	
	@GetMapping("/favorite")
	public void diaryFavorite(Model model, HttpSession session) {
		int userNo = (int) session.getAttribute("userNo");
		List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
		
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
		
		List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
		
		model.addAttribute("userRoom", userRoom);
		
		model.addAttribute("diaryFavorite", diaryFavorite);
	}
	
	@PostMapping("/favorite")
	public void diaryFavorite(@RequestParam(required = false) String[] roomnos, HttpSession session
			, HttpServletRequest req, HttpServletResponse resp
			) {
		
		logger.trace("##### roomnos required : {}", Arrays.toString(roomnos));
		// @RequestParam(required = false) 설정하면 파라미터가 없을때 null값을 저장한다고?
		// 원래는 true설정이고 true설정되면 파라미터 없을 때 Bad request 에러 발생함.
		
		int userNo = (int) session.getAttribute("userNo");
		
		if( roomnos != null ) {
			for( String i : roomnos ) logger.trace("##### roomnos : {}", i);
			diaryService.userFavorite(roomnos, userNo);

		} else if( roomnos == null ) {
			diaryService.userFavoriteClear(userNo);
		}
		
		Cookie[] cookies = req.getCookies(); // 모든 쿠키의 정보를 cookies에 저장
		
		for(int h=0; h<cookies.length; h++) {
			Cookie kc = new Cookie("favcount"+h, null); // choiceCookieName(쿠키 이름)에 대한 값을 null로 지정
			kc.setMaxAge(0); // 유효시간을 0으로 설정
			resp.addCookie(kc); // 응답 헤더에 추가해서 없어지도록 함
		}
		
		try {
			req.getRequestDispatcher("/WEB-INF/views/diary/refresh.jsp").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
		/*
		try {
			resp.sendRedirect("/diary/main");
		} catch (IOException e) {
			e.printStackTrace();
		}
		*/
		
	}
	
	@GetMapping("/clear")
	public void diaryClear() {}
	
	@GetMapping("/setting")
	public String diarySetting(Model model, HttpSession session) {
		
		int userNo = (int) session.getAttribute("userNo");
		
		List<Room> adminList = diaryService.adminList(userNo);
		
		for( Room i : adminList ) logger.trace("##### adminList : {}", i);
		
		if(adminList.isEmpty()) {
			return "/diary/noadmin";
		}
		
		model.addAttribute("adminList", adminList);
		
		return "/diary/setting";
	}
	
	@GetMapping("/managecate")
	public void diaryAddCate(Model model, @RequestParam("n1") int roomNo) {
		
		logger.trace("##### managecate roomNo : {}", roomNo);
		
		Room roomInfo = diaryService.roomInfo(roomNo);
		
		logger.trace("##### managecate roomInfo : {}", roomInfo);
		
		List<DiaryCategory> categoryList = diaryService.roomCategory(roomNo);
		
		for( DiaryCategory i : categoryList ) logger.trace("##### categoryList : {}", i);
		
		model.addAttribute("categoryList", categoryList);
		
		model.addAttribute("roomInfo", roomInfo);
		
	}
	
	@PostMapping("/crecate")
	public void diaryCreCateProc(@RequestParam int roomNo, @RequestParam(value="crecate") String crecate) {
		
		logger.trace("##### crecate : {}", crecate);
		logger.trace("##### crecate roomNo : {}", roomNo);
		
		diaryService.crecate(crecate, roomNo);
		
	}
	
	@PostMapping("/delcate")
	public void diaryDelCateProc(@RequestParam int roomNo, @RequestParam(value="delcate") String delcate) {
		
		logger.trace("##### delcate : {}", delcate);
		logger.trace("##### delcate roomNo : {}", roomNo);
		
		diaryService.delcate(delcate, roomNo);
		
	}
	
	@GetMapping("/manageadmin")
	public void diaryAdmin(Model model, @RequestParam("n1") int roomNo) {
		
		logger.trace("##### diaryAdmin roomNo : {}", roomNo);
		
		Room roomInfo = diaryService.roomInfo(roomNo);
		logger.trace("##### hot roomInfo : {}", roomInfo);
		model.addAttribute("roomInfo", roomInfo);
		
		List<DiaryRoomList> roomUserList = diaryService.roomUserList(roomNo);
		for( DiaryRoomList i : roomUserList ) logger.trace("##### roomUserList : {}", i);
		model.addAttribute("roomUserList", roomUserList);
		
		List<DiaryAdmin> roomAdminList = diaryService.roomAdminList(roomNo);
		for( DiaryAdmin i : roomAdminList ) logger.trace("##### roomAdminList : {}", i);
		model.addAttribute("roomAdminList", roomAdminList);
		
	}
	
	@PostMapping("/manageadmin")
	public String diaryAdminProc(@RequestParam(required = false) String[] checkAdmin, @RequestParam int roomNo) {
		
		logger.trace("##### checkAdmin POST : {}", Arrays.toString(checkAdmin));
		logger.trace("##### roomNo : {}", roomNo);
		
		diaryService.manageadmin(checkAdmin, roomNo);
		
		return "f"; // 임의의 값
		
	}
	
	@GetMapping("/hot")
	public void diaryHot(Model model, @RequestParam("n1") int roomNo) {
		
		logger.trace("##### hot roomNo : {}", roomNo);
		
		Room roomInfo = diaryService.roomInfo(roomNo);
		
		logger.trace("##### hot roomInfo : {}", roomInfo);
		
		DiaryHot diaryHot = diaryService.diaryHot(roomNo);
		
		logger.trace("##### hot diaryHot : {}", diaryHot);
		
		model.addAttribute("diaryHot", diaryHot);
		
		model.addAttribute("roomInfo", roomInfo);
		
	}
	
	// @RequestParam(value="query", required=false) String query // 값이 없으면 null
	// @RequestParam(value="page", defaultValue="1") int page // 값이 없으면 1
	
	@PostMapping("/hot")
	public void diaryHotProc(@RequestParam(value="hot") int hot, @RequestParam int roomNo) {
		
		logger.trace("##### hot : {}", hot);
		logger.trace("##### hot roomNo : {}", roomNo);
		
		diaryService.setRoomHot(hot, roomNo);
		
	}
	
	// --- --- ---
	
	@GetMapping("/write")
	public String diaryWrite(Model model, HttpSession session, @RequestParam int roomNo) {
		
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
		
		// --- --- ---
		
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
		
		return "/diary/write";
		
	}
	
	@PostMapping("/write")
	public String diaryWriteProc(Model model, HttpSession session
			, @RequestParam("diaryCateNo2") int diaryCateNo2
			, @RequestParam("writeroomNo") int writeroomNo
			, @RequestParam("publicresult") int publicresult
			, @RequestParam("title") String title
			, @RequestParam("content") String content
			, @RequestParam("file") MultipartFile file
			) {
		
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
		
		// --- --- ---
		
		logger.trace("##### diaryWriteProc : {}", diaryCateNo2);
		logger.trace("##### diaryWriteProc : {}", writeroomNo);
		logger.trace("##### diaryWriteProc : {}", publicresult);
		logger.trace("##### diaryWriteProc : {}", title);
		logger.trace("##### diaryWriteProc : {}", content);
		logger.trace("##### diaryWriteProc : {}", file);
		
		int diaryNo = diaryService.write(diaryCateNo2, userNo, writeroomNo, title, content, publicresult);
		
		logger.trace("##### diaryWriteProc diaryNo : {}", diaryNo);
		
		diaryService.fileSave(file, diaryNo);
		
		return "redirect:/diary/entire?roomNo="+writeroomNo;
				
	}
	
	@GetMapping("/selectcate")
	public void diarySelectCate(Model model, @RequestParam("n1") int diaryCateNo) {
		
		logger.trace("##### selectcate diaryCateNo : {}", diaryCateNo);
		
		DiaryCategory categoryInfo = diaryService.categoryInfo(diaryCateNo);
		
		logger.trace("##### selectcate categoryInfo : {}", categoryInfo);
		
		model.addAttribute("categoryInfo", categoryInfo);
		
	}
	
	@GetMapping("/selectcate2")
	public void diarySelectCate2(Model model, @RequestParam("n1") int diaryCateNo) {
		
		logger.trace("##### selectcate diaryCateNo : {}", diaryCateNo);
		
		DiaryCategory categoryInfo = diaryService.categoryInfo(diaryCateNo);
		
		logger.trace("##### selectcate categoryInfo : {}", categoryInfo);
		
		model.addAttribute("categoryInfo", categoryInfo);
		
	}
	
	@GetMapping("/mydiary")
	public String diaryMyDiary(Model model, HttpSession session, @RequestParam(defaultValue="0") int curPage) {
		
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
		
		// --- --- ---
		
		// 나의 게시글 페이징 조회
		DiaryPaging paging = diaryService.getPaging(curPage, userNo);
		logger.trace("##### paging : {}", paging);
		
		List<Diary> diaryMyList = diaryService.getMyList(paging, userNo);
		for(Diary i : diaryMyList) logger.trace("##### diaryMyList : {}", i);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", diaryMyList);
		
		return "/diary/mydiary";
		
	}
	
	@GetMapping("/best")
	public String diaryBest(Model model, HttpSession session) {
		
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
		
		// --- --- ---
		
		
		
		return "/diary/best";
		
	}
	
	@GetMapping("/notice")
	public String diaryNotice(Model model, HttpSession session) {
		
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
		
		// --- --- ---
		
		
		
		return "/diary/notice";
		
	}
	
	@GetMapping("/entire")
	public String diaryEntire(Model model, HttpSession session) {
		
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
		
		// --- --- ---
		
		
		
		return "/diary/entire";
		
	}
	
	@GetMapping("/view")
	public String diaryView(Model model, HttpSession session, @RequestParam int diaryNo) {
		
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
		
		// --- --- ---
		
		logger.trace("##### diaryView diaryNo : {}", diaryNo);
		
		Diary diary = diaryService.view(diaryNo);
		
		logger.trace("##### diaryView diary : {}", diary);
		
		DiaryFile diaryFile = diaryService.viewFile(diary);
		
		logger.trace("##### diaryView diaryFile : {}", diaryFile);
		
		model.addAttribute("diary", diary);
		model.addAttribute("diaryFile", diaryFile);
		
		return "/diary/view";
		
	}
	
	@GetMapping("/delete")
	public String diaryDelete(HttpSession session
			, @RequestParam("n1") int diaryNo
			, @RequestParam("n2") int userNo
			, @RequestParam("n3") int roomNo) {
		
		// 로그인 사용자의 사용자번호
		int loginNo = (int) session.getAttribute("userNo");
		
		logger.trace("##### diaryDelete diaryNo : {}", diaryNo); // 글번호
		logger.trace("##### diaryDelete userNo : {}", userNo); // 글쓴이 사용자번호
		logger.trace("##### diaryDelete roomNo : {}", roomNo); // 모임 번호
		
		// 1. 글쓴이가 로그인 사용자와 동일하면 삭제 가능.
		if(loginNo == userNo) {
			diaryService.deleteDiary(diaryNo);
			return "/diary/delete";
		}
		
		int adminresult = diaryService.adminresult(roomNo, loginNo);
		
		// 2. 해당 모임의 관리자일 경우도 삭제 가능.
		if(adminresult == 1) {
			diaryService.deleteDiary(diaryNo);
			return "/diary/delete";
		}
		
		return "/diary/deletefail";
		
	}
	
	@GetMapping("/recomm")
	public String diaryRecomm(Model model, HttpSession session, @RequestParam("n1") int diaryNo) {
		
		int userNo = (int) session.getAttribute("userNo");
		
		// 해당 사용자의 오늘 추천 사용여부 체크
		DiaryUserRecomm recomm = diaryService.userRecomm(userNo);
		
		if(recomm.getDiaryRecommend() == 1) {
			// 게시글 추천
			diaryService.diaryRecomm(diaryNo);
			
			// 해당 사용자 추천여부 0으로 변경
			diaryService.downUserRecomm(userNo);
			
			Diary diary = diaryService.view(diaryNo);
			
			model.addAttribute("diary", diary);
		} else {
			Diary diary = diaryService.view(diaryNo);
			
			model.addAttribute("diary", diary);
			
			return "/diary/recommfail";
		}
		
		return "/diary/recommsucc";
		
	}
	
	@GetMapping("/update")
	public String diaryUpdate(Model model, HttpSession session, @RequestParam int diaryNo, @RequestParam int userNo) {
		
		// 가입된 모임 리스트
		int loginNo = (int) session.getAttribute("userNo");
		List<RoomList> userRoomList = diaryService.userRoomInfo(loginNo);
		
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
		List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(loginNo);
		
		model.addAttribute("diaryFavorite", diaryFavorite);
		
		// 전체 공지사항 읽음카운트
		int noticeCount = diaryService.userNoticeCount(loginNo);
		
		model.addAttribute("noticeCount", noticeCount);

		// --- --- ---

		logger.trace("##### diaryUpdate diaryNo : {}", diaryNo); // 글번호
		logger.trace("##### diaryUpdate userNo : {}", userNo); // 글쓴이 사용자번호
		
		if(loginNo != userNo) { // 글쓴이와 사용자가 동일인이 아닐 경우
			return "/diary/updatefail";
		}
		
		Diary diaryInfo = diaryService.diarySelect(diaryNo);
		
		DiaryFile diaryFileInfo = diaryService.diaryFileSelect(diaryInfo);
		
		logger.trace("##### diaryUpdate diaryInfo : {}", diaryInfo); // 게시글 정보
		logger.trace("##### diaryUpdate diaryFileInfo : {}", diaryFileInfo); // 게시글 첨부파일 정보
		
		model.addAttribute("diary", diaryInfo);
		model.addAttribute("diaryFileInfo", diaryFileInfo);
		
		return "/diary/update";
		
	}
	
	@PostMapping("/update")
	public String diaryUpdateProc(Model model, HttpSession session
			, @RequestParam String title
			, @RequestParam String content
			, @RequestParam int diaryNo
			, @RequestParam int publicresult
			, @RequestParam String change
			, @RequestParam MultipartFile file
			) {
		
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
		
		// --- --- ---
		
		logger.trace("##### diaryUpdateProc : {}", title);
		logger.trace("##### diaryUpdateProc : {}", content);
		logger.trace("##### diaryUpdateProc : {}", diaryNo);
		logger.trace("##### diaryUpdateProc : {}", publicresult);
		logger.trace("##### diaryUpdateProc : {}", change);
		logger.trace("##### diaryUpdateProc : {}", file);
		
		diaryService.update(title, content, diaryNo, publicresult, change, file);
		
		return "redirect:/diary/view?diaryNo=" + diaryNo;
		
	}
	
	@Scheduled(cron="0 0 0 * * *")
	public void diaryAutoRecomm() { // 12시 정각에 diary_user_recomm 사용자 데이터 1로 초기화
		logger.trace("##### diaryAutoRecomm test");
		
		diaryService.AutoRecomm();
	}

}
