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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public void diaryMain(Model model, HttpSession session) {
		
		int userNo = (int) session.getAttribute("userNo");
		
		List<RoomList> userRoomList = diaryService.userRoomInfo(userNo);
		
		for( RoomList i : userRoomList ) logger.trace("##### userRoomList : {}", i);
		
		String[] roomNos = new String[userRoomList.size()];
		
		for(int i=0; i<userRoomList.size(); i++) { 
			roomNos[i] = Integer.toString(userRoomList.get(i).getRoomNo());
		}
		
		HashMap<String, Object> param = new HashMap<>();
		param.put("roomNoArr", roomNos);
		
		List<Room> userRoom = diaryService.userRoomInfo(param);
		
		for( Room i : userRoom ) logger.trace("##### userRoom : {}", i);
		
		model.addAttribute("userRoom", userRoom);

	}

}
