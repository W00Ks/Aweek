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

import member.dto.Member;
import room.dto.Room;
import room.dto.RoomList;
import room.service.face.RoomService;

@Controller
public class RoomController {
	
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RoomService roomService;

	
	@RequestMapping("/aweekHome")
	public void home( HttpSession session, Model model ) {
		List<Room> roomList = roomService.roomList();
		logger.info("roomList : {}", roomList);
		
		
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
		model.addAttribute("roomList", roomList);
	}
	
	@RequestMapping("/room/login")
	public void login() {
		
	}
	
	@RequestMapping("/room/main")
	public void roomMain( HttpSession session, Model model ) {
		List<Room> myRoomList = roomService.myRoomList();
		logger.info("myRoomList : {}", myRoomList);
		
		
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
		model.addAttribute("myRoomList", myRoomList);
	}
	
	@GetMapping("/room/open")
	public void roomOpenPage( HttpSession session, Member member ) {
		session.setAttribute("userNo", member.getUserNo());
	}
	
	@PostMapping("/room/open")
	public String roomOpenProc( HttpSession session, Room room, RoomList roomList ) {
		
		//세션에서 userno 불러오기
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
		//room dto에 userNo 저장
		room.setUserNo(userno);
		
		//방 생성
		roomService.createRoom(room, roomList);
		
		try {
			
		} catch (Exception e) {
			
		}

		return "redirect:/room/main";
	}
	
	@GetMapping("/room/setting")
	public void roomSettingPage( HttpSession session, Member member, Room room, Model model ) {
		session.setAttribute("userNo", member.getUserNo());
		
		room = roomService.getRoomInfo(room);
		
		model.addAttribute("roomInfo", room);
		logger.info("roomInfo : {}", room);
	}
	
	@PostMapping("/room/setting")
	public String roomSettingProc( HttpSession session, Room room ) {
		
//		roomService.updateRoom(room);
		
		
		return "redirect:/room/main";
	}
}
