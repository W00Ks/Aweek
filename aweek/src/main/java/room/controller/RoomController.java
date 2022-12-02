package room.controller;

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

import chat.dto.ChatRoom;
import member.dto.Member;
import room.dto.Room;
import room.dto.RoomCategory;
import room.service.face.RoomService;

@Controller
public class RoomController {
	
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RoomService roomService;

	@RequestMapping("/room/login")
	public void login() {
		
		logger.info("room/login");
	}
	
	@RequestMapping("/room/main")
	public void roomMain() {
		
		
	}
	
	@GetMapping("/room/open")
	public void roomOpen( HttpSession session, Member member ) {
		
		session.setAttribute("userNo", member.getUserNo());
		
	}
	
	@PostMapping("/room/open")
	public String roomOpen( HttpSession session, Room room) {
		
		//세션에서 userno 불러오기
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
		//카테고리 리스트 불러오기
//		List<RoomCategory> categoryList = roomService.roomCategoryList();
//		model.addAttribute("categoryList", categoryList);
		
		//room dto에 userNo 저장
		room.setUserNo(userno);
		
		//방 생성
		roomService.createRoom(room);
		logger.info("post");
		
		return "redirect:/room/main";
	}
	
}
