package diary.controller;


import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import diary.dto.Diary;
import diary.dto.DiaryCategory;
import diary.dto.DiaryFavorite;
import diary.dto.DiaryHot;
import diary.service.face.DiaryService;
import member.dto.Member;
import room.dto.Room;
import room.dto.RoomList;

@Controller
@RequestMapping("/diary")
public class DiaryController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired DiaryService diaryService;
	
	@GetMapping("/test")
	public void test() {}
	
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
	public void diaryFail(HttpSession session) {
		session.invalidate();
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
		
		// 메인 공지사항
		List<Diary> diaryNotice = diaryService.selectDiaryNotice(userRoom);
		for( Diary i : diaryNotice ) logger.trace("##### diaryNotice : {}", i);
		model.addAttribute("diaryNotice", diaryNotice);
				
		// 메인 추천글
		List<Diary> diaryRecomm = diaryService.selectDiaryRecomm(userRoom);
		for( Diary i : diaryRecomm ) logger.trace("##### diaryRecomm : {}", i);
		model.addAttribute("diaryRecomm", diaryRecomm);
				
		// 메인 최신글
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
	public String diaryFavorite(@RequestParam(required = false) String[] roomnos, HttpSession session) {
		
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
		
		return "redirect:/diary/main";
		
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
		
		List<DiaryCategory> categoryList = diaryService.roomCategory(roomNo);
		
		for( DiaryCategory i : categoryList ) logger.trace("##### categoryList : {}", i);
		
		model.addAttribute("categoryList", categoryList);
		
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
	public String diaryHotProc(@RequestParam(value="hot", defaultValue="0") int hot, @RequestParam int roomNo) {
		
		logger.trace("##### hot : {}", hot);
		logger.trace("##### hot roomNo : {}", roomNo);
		
		diaryService.setRoomHot(hot, roomNo);
		
		return "/diary/success";
		
	}

}
