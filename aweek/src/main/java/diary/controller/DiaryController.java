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
import diary.dto.DiaryComment;
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
		
		/*
		 * Cookie[] cookies = req.getCookies(); // ?????? ????????? ????????? cookies??? ?????? if(cookies !=
		 * null) { // ????????? ???????????? ????????? ?????? for(int h=0; h< cookies.length; h++) {
		 * cookies[h].setMaxAge(0); // ??????????????? 0?????? ?????? resp.addCookie(cookies[h]); // ??????
		 * ????????? ?????? } }
		 */
		
		Cookie[] cookies = req.getCookies(); // ?????? ????????? ????????? cookies??? ??????
		
		
		for(int h=0; h<cookies.length; h++) {
			Cookie kc = new Cookie("favcount"+h, null); // choiceCookieName(?????? ??????)??? ?????? ?????? null??? ??????
			kc.setPath("/");
			kc.setMaxAge(0); // ??????????????? 0?????? ??????
			resp.addCookie(kc); // ?????? ????????? ???????????? ??????????????? ???
		}
		
		session.invalidate(); // ?????? ?????????
		
		try {
			req.getRequestDispatcher("/WEB-INF/views/diary/fail.jsp").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@GetMapping("/main")
	public String diaryMain(Model model, HttpSession session) {
		
		// ????????? ?????? ?????????
		int userNo = (int) session.getAttribute("userNo");
		List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
		
		// ?????? ????????? ???????????? fail
		if(userRoomList.size() == 0) {
			return "redirect:/diary/fail";
		}
		
		for( RoomList i : userRoomList ) logger.trace("##### userRoomList : {}", i);
		
		// ????????? ?????? ?????? ??????
		String[] roomNos = new String[userRoomList.size()];
		for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
		
		HashMap<String, String[]> param = new HashMap<>();
		param.put("roomNoArr", roomNos);
		
		// ?????? ??????????????? diary/main ???????????? HashMap??? 0??? ???????????? ??????
//		if(userRoomList.size() == 0) {
//			String[] roomNos0 = new String[1];
//			for(int i=0; i<userRoomList.size(); i++) roomNos0[i] = Integer.toString(0);
//			param.put("roomNoArr", roomNos0);
//		}
		
		List<Room> userRoom = diaryService.userRoomInfo(param);
		
		for( Room i : userRoom ) logger.trace("##### userRoom : {}", i);
		
		model.addAttribute("userRoom", userRoom);
		
		// ???????????? ????????? ?????? ?????????
		List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
		
		for( DiaryFavorite i : diaryFavorite ) logger.trace("##### diaryFavorite : {}", i);
		
		model.addAttribute("diaryFavorite", diaryFavorite);
		
		// ?????? ???????????? ???????????????
		int noticeCount = diaryService.userNoticeCount(userNo);
		
		logger.trace("##### noticeCount : {}", noticeCount);
		
		model.addAttribute("noticeCount", noticeCount);
		
		// --- --- ---
		
		// ?????? ????????????
		List<Diary> diaryNotice = diaryService.selectDiaryNotice(userRoom);
		for( Diary i : diaryNotice ) logger.trace("##### diaryNotice : {}", i);
		model.addAttribute("diaryNotice", diaryNotice);
				
		// ?????? ?????????
		List<Diary> diaryRecomm = diaryService.selectDiaryRecomm(userRoom);
		for( Diary i : diaryRecomm ) logger.trace("##### diaryRecomm : {}", i);
		model.addAttribute("diaryRecomm", diaryRecomm);
				
		// ?????? ?????????
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
		
		// ?????? ??????????????? diary/main ???????????? HashMap??? 0??? ???????????? ??????
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
		// @RequestParam(required = false) ???????????? ??????????????? ????????? null?????? ????????????????
		// ????????? true???????????? true???????????? ???????????? ?????? ??? Bad request ?????? ?????????.
		
		int userNo = (int) session.getAttribute("userNo");
		
		if( roomnos != null ) {
			for( String i : roomnos ) logger.trace("##### roomnos : {}", i);
			diaryService.userFavorite(roomnos, userNo);

		} else if( roomnos == null ) {
			diaryService.userFavoriteClear(userNo);
		}
		
		Cookie[] cookies = req.getCookies(); // ?????? ????????? ????????? cookies??? ??????
		
		for(int h=0; h<cookies.length; h++) {
			Cookie kc = new Cookie("favcount"+h, null); // choiceCookieName(?????? ??????)??? ?????? ?????? null??? ??????
			kc.setPath("/");
			kc.setMaxAge(0); // ??????????????? 0?????? ??????
			resp.addCookie(kc); // ?????? ????????? ???????????? ??????????????? ???
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
		
		return "f"; // ????????? ???
		
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
	
	// @RequestParam(value="query", required=false) String query // ?????? ????????? null
	// @RequestParam(value="page", defaultValue="1") int page // ?????? ????????? 1
	
	@PostMapping("/hot")
	public void diaryHotProc(@RequestParam(value="hot") int hot, @RequestParam int roomNo) {
		
		logger.trace("##### hot : {}", hot);
		logger.trace("##### hot roomNo : {}", roomNo);
		
		diaryService.setRoomHot(hot, roomNo);
		
	}
	
	// --- --- ---
	
	@GetMapping("/write")
	public String diaryWrite(Model model, HttpSession session, @RequestParam int roomNo) {
		
		// ????????? ?????? ?????????
		int userNo = (int) session.getAttribute("userNo");
		List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
		
		// ?????? ????????? ???????????? fail
		if(userRoomList.size() == 0) {
			return "redirect:/diary/fail";
		}
		
		// ????????? ?????? ?????? ??????
		String[] roomNos = new String[userRoomList.size()];
		for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
		
		HashMap<String, String[]> param = new HashMap<>();
		param.put("roomNoArr", roomNos);
		
		List<Room> userRoom = diaryService.userRoomInfo(param);
		
		model.addAttribute("userRoom", userRoom);
		
		// ???????????? ????????? ?????? ?????????
		List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
		
		model.addAttribute("diaryFavorite", diaryFavorite);
		
		// ?????? ???????????? ???????????????
		int noticeCount = diaryService.userNoticeCount(userNo);
		
		model.addAttribute("noticeCount", noticeCount);
		
		// --- --- ---
		
		// ????????? ?????? ??????
		Room roomInfo = diaryService.roomInfo(roomNo);
		
		model.addAttribute("roomInfo", roomInfo);
		
		// ????????? ????????? ????????????(???????????? ??????/?????????)
		
		int adminresult = diaryService.adminresult(roomNo, userNo);
		
		if(adminresult == 1) { // ?????? ????????? ?????????
			
			List<DiaryCategory> categoryList = diaryService.roomCategory(roomNo);
			
			model.addAttribute("categoryList", categoryList);
			
		} else { // ?????? ????????? ???????????? ??????
			
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
		
		// ????????? ?????? ?????????
		int userNo = (int) session.getAttribute("userNo");
		List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
		
		// ?????? ????????? ???????????? fail
		if(userRoomList.size() == 0) {
			return "redirect:/diary/fail";
		}
		
		// ????????? ?????? ?????? ??????
		String[] roomNos = new String[userRoomList.size()];
		for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
		
		HashMap<String, String[]> param = new HashMap<>();
		param.put("roomNoArr", roomNos);
		
		List<Room> userRoom = diaryService.userRoomInfo(param);
		
		model.addAttribute("userRoom", userRoom);
		
		// ???????????? ????????? ?????? ?????????
		List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
		
		model.addAttribute("diaryFavorite", diaryFavorite);
		
		// ?????? ???????????? ???????????????
		int noticeCount = diaryService.userNoticeCount(userNo);
		
		model.addAttribute("noticeCount", noticeCount);
		
		// --- --- ---
		
		logger.trace("##### diaryWriteProc : {}", diaryCateNo2);
		logger.trace("##### diaryWriteProc : {}", writeroomNo);
		logger.trace("##### diaryWriteProc : {}", publicresult);
		logger.trace("##### diaryWriteProc : {}", title);
		logger.trace("##### diaryWriteProc : {}", content);
		logger.trace("##### diaryWriteProc : {}", file);
		
		int paycheck = diaryService.paycheck(writeroomNo);
		
		logger.trace("##### paycheck : {}", paycheck);
		
		if(paycheck != 0) { // ?????? ?????? ??????
			if(file.getSize() > 1063321600) { // 1?????? ????????????
				return "/diary/file1000";
			}
		} else { // ?????? ?????? ?????? ??????
			if(file.getSize() > 103840000) { // 100?????? ????????????
				return "/diary/file100";
			}
		}
		
		int diaryNo = diaryService.write(diaryCateNo2, userNo, writeroomNo, title, content, publicresult);
		
		logger.trace("##### diaryWriteProc diaryNo : {}", diaryNo);
		
		diaryService.fileSave(file, diaryNo);
		
		String cateName = diaryService.checkRoomName(diaryCateNo2);
		
		logger.trace("##### diaryWriteProc cateName : {}", cateName);
		
		if(cateName.equals("????????????")) {
			
			List<DiaryRoomList> roomList = diaryService.findroomList(writeroomNo);
			
			diaryService.insertDiaryNoticeRead(roomList, diaryNo);
			
		}
		
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
	public String diaryMyDiary(Model model, HttpSession session
			, @RequestParam(defaultValue="0") int curPage
			, @RequestParam(defaultValue="0") int sort
			, @RequestParam(defaultValue="0") int searchsort
			, @RequestParam(defaultValue="") String searchtext
			) {
		
		// ????????? ?????? ?????????
		int userNo = (int) session.getAttribute("userNo");
		List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
		
		// ?????? ????????? ???????????? fail
		if(userRoomList.size() == 0) {
			return "redirect:/diary/fail";
		}
		
		// ????????? ?????? ?????? ??????
		String[] roomNos = new String[userRoomList.size()];
		for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
		
		HashMap<String, String[]> param = new HashMap<>();
		param.put("roomNoArr", roomNos);
		
		List<Room> userRoom = diaryService.userRoomInfo(param);
		
		model.addAttribute("userRoom", userRoom);
		
		// ???????????? ????????? ?????? ?????????
		List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
		
		model.addAttribute("diaryFavorite", diaryFavorite);
		
		// ?????? ???????????? ???????????????
		int noticeCount = diaryService.userNoticeCount(userNo);
		
		model.addAttribute("noticeCount", noticeCount);
		
		// --- --- ---
		
		logger.trace("##### myDiary : {}", curPage);
		logger.trace("##### myDiary : {}", userNo);
		logger.trace("##### myDiary : {}", searchtext);
		logger.trace("##### myDiary : {}", sort);
		logger.trace("##### myDiary : {}", searchsort);
		
		DiaryPaging paging = diaryService.getMyPaging(curPage, userNo, searchtext, sort, searchsort);
		logger.trace("##### myDiary getMyPaging : {}", paging);
		
		List<Diary> diaryMyList = diaryService.getMyList(paging, userNo, searchtext, sort, searchsort);
		logger.trace("##### myDiary getMyList : {}", diaryMyList);
		
		model.addAttribute("sort", sort);
		model.addAttribute("paging", paging);
		model.addAttribute("list", diaryMyList);
		model.addAttribute("searchsort", searchsort);
		model.addAttribute("searchtext", searchtext);

		return "/diary/mydiary";
		
	}
	
	@GetMapping("/best")
	public String diaryBest(Model model, HttpSession session
			, @RequestParam(defaultValue="0") int curPage
			, @RequestParam(defaultValue="0") int sort
			, @RequestParam(defaultValue="0") int searchsort
			, @RequestParam(defaultValue="") String searchtext
			, @RequestParam(defaultValue="0") int roomNo
			) {
		
		// ????????? ?????? ?????????
		int userNo = (int) session.getAttribute("userNo");
		List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
		
		// ?????? ????????? ???????????? fail
		if(userRoomList.size() == 0) {
			return "redirect:/diary/fail";
		}
		
		// ????????? ?????? ?????? ??????
		String[] roomNos = new String[userRoomList.size()];
		for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
		
		HashMap<String, String[]> param = new HashMap<>();
		param.put("roomNoArr", roomNos);
		
		// ????????? ????????? ?????? ?????????
		List<Room> userRoom = diaryService.userRoomInfo(param);
		
		model.addAttribute("userRoom", userRoom);
		
		// ???????????? ????????? ?????? ?????????
		List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
		
		model.addAttribute("diaryFavorite", diaryFavorite);
		
		// ?????? ???????????? ???????????????
		int noticeCount = diaryService.userNoticeCount(userNo);
		
		model.addAttribute("noticeCount", noticeCount);
		
		// --- --- ---
		
		DiaryPaging paging = diaryService.getBestPaging(curPage, userNo, searchtext, sort, searchsort, roomNo, userRoom);
		
		List<Diary> diaryMyList = diaryService.getBestList(paging, userNo, searchtext, sort, searchsort, roomNo, userRoom);
		
		model.addAttribute("sort", sort);
		model.addAttribute("paging", paging);
		model.addAttribute("list", diaryMyList);
		model.addAttribute("searchsort", searchsort);
		model.addAttribute("searchtext", searchtext);
		model.addAttribute("roomNo", roomNo);

		return "/diary/best";
		
	}
	
	@GetMapping("/notice")
	public String diaryNotice(Model model, HttpSession session
			, @RequestParam(defaultValue="0") int curPage
			, @RequestParam(defaultValue="0") int sort
			, @RequestParam(defaultValue="0") int searchsort
			, @RequestParam(defaultValue="") String searchtext
			, @RequestParam(defaultValue="0") int roomNo
			) {
		
		// ????????? ?????? ?????????
		int userNo = (int) session.getAttribute("userNo");
		List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
		
		// ?????? ????????? ???????????? fail
		if(userRoomList.size() == 0) {
			return "redirect:/diary/fail";
		}
		
		// ????????? ?????? ?????? ??????
		String[] roomNos = new String[userRoomList.size()];
		for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
		
		HashMap<String, String[]> param = new HashMap<>();
		param.put("roomNoArr", roomNos);
		
		// ????????? ????????? ?????? ?????????
		List<Room> userRoom = diaryService.userRoomInfo(param);
		
		model.addAttribute("userRoom", userRoom);
		
		// ???????????? ????????? ?????? ?????????
		List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
		
		model.addAttribute("diaryFavorite", diaryFavorite);
		
		// ?????? ???????????? ???????????????
		int noticeCount = diaryService.userNoticeCount(userNo);
		
		model.addAttribute("noticeCount", noticeCount);
		
		// --- --- ---
		
		DiaryPaging paging = diaryService.getNoticePaging(curPage, userNo, searchtext, sort, searchsort, roomNo, userRoom);
		
		List<Diary> diaryMyList = diaryService.getNoticeList(paging, userNo, searchtext, sort, searchsort, roomNo, userRoom);
		
		model.addAttribute("sort", sort);
		model.addAttribute("paging", paging);
		model.addAttribute("list", diaryMyList);
		model.addAttribute("searchsort", searchsort);
		model.addAttribute("searchtext", searchtext);
		model.addAttribute("roomNo", roomNo);

		return "/diary/notice";
		
	}
	
	@GetMapping("/entire")
	public String diaryEntire(Model model, HttpSession session
			, @RequestParam(defaultValue="0") int curPage
			, @RequestParam(defaultValue="0") int sort
			, @RequestParam(defaultValue="0") int searchsort
			, @RequestParam(defaultValue="") String searchtext
			, @RequestParam(defaultValue="0") int roomNo
			) {
		
		// ????????? ?????? ?????????
		int userNo = (int) session.getAttribute("userNo");
		List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
		
		// ?????? ????????? ???????????? fail
		if(userRoomList.size() == 0) {
			return "redirect:/diary/fail";
		}
		
		// ????????? ?????? ?????? ??????
		String[] roomNos = new String[userRoomList.size()];
		for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
		
		HashMap<String, String[]> param = new HashMap<>();
		param.put("roomNoArr", roomNos);
		
		// ????????? ????????? ?????? ?????????
		List<Room> userRoom = diaryService.userRoomInfo(param);
		
		model.addAttribute("userRoom", userRoom);
		
		// ???????????? ????????? ?????? ?????????
		List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
		
		model.addAttribute("diaryFavorite", diaryFavorite);
		
		// ?????? ???????????? ???????????????
		int noticeCount = diaryService.userNoticeCount(userNo);
		
		model.addAttribute("noticeCount", noticeCount);
		
		// --- --- ---
		
		DiaryPaging paging = diaryService.getEntirePaging(curPage, userNo, searchtext, sort, searchsort, roomNo, userRoom);
		
		List<Diary> diaryMyList = diaryService.getEntireList(paging, userNo, searchtext, sort, searchsort, roomNo, userRoom);
		
		model.addAttribute("sort", sort);
		model.addAttribute("paging", paging);
		model.addAttribute("list", diaryMyList);
		model.addAttribute("searchsort", searchsort);
		model.addAttribute("searchtext", searchtext);
		model.addAttribute("roomNo", roomNo);

		return "/diary/entire";
		
	}
	
	@GetMapping("/view")
	public String diaryView(Model model, HttpSession session, @RequestParam int diaryNo) {
		
		// ????????? ?????? ?????????
		int userNo = (int) session.getAttribute("userNo");
		List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
		
		// ?????? ????????? ???????????? fail
		if(userRoomList.size() == 0) {
			return "redirect:/diary/fail";
		}
		
		// ????????? ?????? ?????? ??????
		String[] roomNos = new String[userRoomList.size()];
		for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
		
		HashMap<String, String[]> param = new HashMap<>();
		param.put("roomNoArr", roomNos);
		
		List<Room> userRoom = diaryService.userRoomInfo(param);
		
		model.addAttribute("userRoom", userRoom);
		
		// ???????????? ????????? ?????? ?????????
		List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
		
		model.addAttribute("diaryFavorite", diaryFavorite);
		
		// --- --- ---
		
		logger.trace("##### diaryView diaryNo : {}", diaryNo);
		
		Diary diary = diaryService.view(diaryNo);
		
		logger.trace("##### diaryView diary : {}", diary);
		
		DiaryFile diaryFile = diaryService.viewFile(diary);
		
		logger.trace("##### diaryView diaryFile : {}", diaryFile);
		
		RoomList roomList = new RoomList(0, diary.getRoomNo(), userNo);
		
		List<DiaryComment> comment = diaryService.viewComment(diaryNo);
		
		if(diary.getDiaryPublic() == 1) { // ???????????? ?????? ???????????? ??????
			model.addAttribute("diary", diary);
			model.addAttribute("diaryFile", diaryFile);
			model.addAttribute("comment", comment);
			
			diaryService.updateDiaryNoticeRead(userNo, diaryNo);
			
			// ?????? ???????????? ???????????????
			int noticeCount = diaryService.userNoticeCount(userNo);
			
			model.addAttribute("noticeCount", noticeCount);
			
			return "/diary/view";
		} else { // ???????????? ????????? ????????? ??????
			
			int authority = diaryService.authority(roomList); // ?????? ????????? ????????? ??????????????? ??????
			
			if(authority == 1) {
				model.addAttribute("diary", diary);
				model.addAttribute("diaryFile", diaryFile);
				model.addAttribute("comment", comment);
				
				diaryService.updateDiaryNoticeRead(userNo, diaryNo);
				
				// ?????? ???????????? ???????????????
				int noticeCount = diaryService.userNoticeCount(userNo);
				
				model.addAttribute("noticeCount", noticeCount);
				
				return "/diary/view";
			}
			
		}
		
		return "/diary/viewfail";
		
	}
	
	@GetMapping("/delete")
	public String diaryDelete(HttpSession session
			, @RequestParam("n1") int diaryNo
			, @RequestParam("n2") int userNo
			, @RequestParam("n3") int roomNo) {
		
		// ????????? ???????????? ???????????????
		int loginNo = (int) session.getAttribute("userNo");
		
		logger.trace("##### diaryDelete diaryNo : {}", diaryNo); // ?????????
		logger.trace("##### diaryDelete userNo : {}", userNo); // ????????? ???????????????
		logger.trace("##### diaryDelete roomNo : {}", roomNo); // ?????? ??????
		
		// 1. ???????????? ????????? ???????????? ???????????? ?????? ??????.
		if(loginNo == userNo) {
			diaryService.deleteDiary(diaryNo);
			return "/diary/delete";
		}
		
		int adminresult = diaryService.adminresult(roomNo, loginNo);
		
		// 2. ?????? ????????? ???????????? ????????? ?????? ??????.
		if(adminresult == 1) {
			diaryService.deleteDiary(diaryNo);
			return "/diary/delete";
		}
		
		return "/diary/deletefail";
		
	}
	
	@GetMapping("/recomm")
	public String diaryRecomm(Model model, HttpSession session, @RequestParam("n1") int diaryNo) {
		
		int userNo = (int) session.getAttribute("userNo");
		
		// ?????? ???????????? ?????? ?????? ???????????? ??????
		DiaryUserRecomm recomm = diaryService.userRecomm(userNo);
		
		if(recomm.getDiaryRecommend() == 1) {
			// ????????? ??????
			diaryService.diaryRecomm(diaryNo);
			
			// ?????? ????????? ???????????? 0?????? ??????
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
		
		// ????????? ?????? ?????????
		int loginNo = (int) session.getAttribute("userNo");
		List<RoomList> userRoomList = diaryService.userRoomInfo(loginNo);
		
		// ?????? ????????? ???????????? fail
		if(userRoomList.size() == 0) {
			return "redirect:/diary/fail";
		}
		
		// ????????? ?????? ?????? ??????
		String[] roomNos = new String[userRoomList.size()];
		for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
		
		HashMap<String, String[]> param = new HashMap<>();
		param.put("roomNoArr", roomNos);
		
		List<Room> userRoom = diaryService.userRoomInfo(param);
		
		model.addAttribute("userRoom", userRoom);
		
		// ???????????? ????????? ?????? ?????????
		List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(loginNo);
		
		model.addAttribute("diaryFavorite", diaryFavorite);
		
		// ?????? ???????????? ???????????????
		int noticeCount = diaryService.userNoticeCount(loginNo);
		
		model.addAttribute("noticeCount", noticeCount);

		// --- --- ---

		logger.trace("##### diaryUpdate diaryNo : {}", diaryNo); // ?????????
		logger.trace("##### diaryUpdate userNo : {}", userNo); // ????????? ???????????????
		
		if(loginNo != userNo) { // ???????????? ???????????? ???????????? ?????? ??????
			return "/diary/updatefail";
		}
		
		Diary diaryInfo = diaryService.diarySelect(diaryNo);
		
		DiaryFile diaryFileInfo = diaryService.diaryFileSelect(diaryInfo);
		
		logger.trace("##### diaryUpdate diaryInfo : {}", diaryInfo); // ????????? ??????
		logger.trace("##### diaryUpdate diaryFileInfo : {}", diaryFileInfo); // ????????? ???????????? ??????
		
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
			, @RequestParam int roomNo
			) {
		
		// ????????? ?????? ?????????
		int userNo = (int) session.getAttribute("userNo");
		List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
		
		// ?????? ????????? ???????????? fail
		if(userRoomList.size() == 0) {
			return "redirect:/diary/fail";
		}
		
		// ????????? ?????? ?????? ??????
		String[] roomNos = new String[userRoomList.size()];
		for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
		
		HashMap<String, String[]> param = new HashMap<>();
		param.put("roomNoArr", roomNos);
		
		List<Room> userRoom = diaryService.userRoomInfo(param);
		
		model.addAttribute("userRoom", userRoom);
		
		// ???????????? ????????? ?????? ?????????
		List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
		
		model.addAttribute("diaryFavorite", diaryFavorite);
		
		// ?????? ???????????? ???????????????
		int noticeCount = diaryService.userNoticeCount(userNo);
		
		model.addAttribute("noticeCount", noticeCount);
		
		// --- --- ---
		
		logger.trace("##### diaryUpdateProc : {}", title);
		logger.trace("##### diaryUpdateProc : {}", content);
		logger.trace("##### diaryUpdateProc : {}", diaryNo);
		logger.trace("##### diaryUpdateProc : {}", publicresult);
		logger.trace("##### diaryUpdateProc : {}", change);
		logger.trace("##### diaryUpdateProc : {}", file);
		
		int paycheck = diaryService.paycheck(roomNo);
		
		logger.trace("##### paycheck : {}", paycheck);
		
		if(paycheck != 0) { // ?????? ?????? ??????
			if(file.getSize() > 1063321600) { // 1?????? ????????????
				return "/diary/file1000";
			}
		} else { // ?????? ?????? ?????? ??????
			if(file.getSize() > 103840000) { // 100?????? ????????????
				return "/diary/file100";
			}
		}
		
		diaryService.update(title, content, diaryNo, publicresult, change, file);
		
		return "redirect:/diary/view?diaryNo=" + diaryNo;
		
	}
	
	@GetMapping("/comment")
	public String diaryUpdateProc(HttpSession session, @RequestParam String comment, @RequestParam int diaryNo) {
		
		int userNo = (int) session.getAttribute("userNo");
		
		diaryService.writeComment(comment, userNo, diaryNo);
		
		return "redirect:/diary/view?diaryNo=" + diaryNo;
		
	}
	
	@Scheduled(cron="0 0 0 * * *")
	public void diaryAutoRecomm() { // 12??? ????????? diary_user_recomm ????????? ????????? 1??? ?????????
		logger.trace("##### diaryAutoRecomm test");
		
		diaryService.AutoRecomm();
	}
	
	@GetMapping("/commentDelete")
	public String diaryCommentDelete(HttpSession session
			, @RequestParam int userNo
			, @RequestParam int diaryNo
			, @RequestParam int diaryCommNo
			, @RequestParam int roomNo) {
		
		int loginNo = (int) session.getAttribute("userNo");
		
		// 1. ???????????? ????????? ???????????? ???????????? ?????? ??????.
		if(loginNo == userNo) {
			diaryService.deleteDiaryComment(diaryCommNo);
			return "redirect:/diary/view?diaryNo=" + diaryNo;
		}
		
		int adminresult = diaryService.adminresult(roomNo, loginNo);
		
		// 2. ?????? ????????? ???????????? ????????? ?????? ??????.
		if(adminresult == 1) {
			diaryService.deleteDiaryComment(diaryCommNo);
			return "redirect:/diary/view?diaryNo=" + diaryNo;
		}
		
		return "/diary/viewfail";
		
	}
	
	@GetMapping("/unreadnotice")
	public String diaryUnreadNotice(Model model, HttpSession session
			, @RequestParam(defaultValue="0") int curPage
			, @RequestParam(defaultValue="0") int sort
			, @RequestParam(defaultValue="0") int searchsort
			, @RequestParam(defaultValue="") String searchtext
			, @RequestParam(defaultValue="0") int roomNo
			) {
		
		// ????????? ?????? ?????????
		int userNo = (int) session.getAttribute("userNo");
		List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
		
		// ?????? ????????? ???????????? fail
		if(userRoomList.size() == 0) {
			return "redirect:/diary/fail";
		}
		
		// ????????? ?????? ?????? ??????
		String[] roomNos = new String[userRoomList.size()];
		for(int i=0; i<userRoomList.size(); i++) roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
		
		HashMap<String, String[]> param = new HashMap<>();
		param.put("roomNoArr", roomNos);
		
		// ????????? ????????? ?????? ?????????
		List<Room> userRoom = diaryService.userRoomInfo(param);
		
		model.addAttribute("userRoom", userRoom);
		
		// ???????????? ????????? ?????? ?????????
		List<DiaryFavorite> diaryFavorite = diaryService.userFavorite(userNo);
		
		model.addAttribute("diaryFavorite", diaryFavorite);
		
		// ?????? ???????????? ???????????????
		int noticeCount = diaryService.userNoticeCount(userNo);
		
		model.addAttribute("noticeCount", noticeCount);
		
		// --- --- ---
		
		DiaryPaging paging = diaryService.getUnreadNoticePaging(curPage, userNo, searchtext, sort, searchsort, roomNo, userRoom);
		
		List<Diary> diaryMyList = diaryService.getUnreadNoticeList(paging, userNo, searchtext, sort, searchsort, roomNo, userRoom);
		
		model.addAttribute("sort", sort);
		model.addAttribute("paging", paging);
		model.addAttribute("list", diaryMyList);
		model.addAttribute("searchsort", searchsort);
		model.addAttribute("searchtext", searchtext);
		model.addAttribute("roomNo", roomNo);

		return "/diary/unreadnotice";
		
	}

}
