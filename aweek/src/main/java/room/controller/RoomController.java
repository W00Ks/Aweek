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
	public void home( HttpSession session, Model model, Member member ) {
		
		//모임 전체 목록 조회
		List<Room> roomList = roomService.roomList();
		logger.info("roomList : {}", roomList);
		model.addAttribute("roomList", roomList);
		
		//로그인 후 userNo저장
		session.setAttribute("userNo", member.getUserNo());
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
	}
	
	@RequestMapping("/room/login")
	public void login() {
		
	}
	
	@RequestMapping("/room/main")
	public void roomMain( HttpSession session, Model model, Room room, Member member ) {
		
		//로그인 후 userNo저장
		session.setAttribute("userNo", member.getUserNo());
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
		//userNo로 모임 list 조회(내가 가입한 모임)
		List<Room> myRoomList = roomService.myRoomList(userno);
		logger.info("myRoomList : {}", myRoomList);
		
		
		model.addAttribute("myRoomList", myRoomList);
	}
	
	@GetMapping("/room/open")
	public void roomOpenPage( HttpSession session, Member member ) {
		
		//로그인 후 userNo저장
		session.setAttribute("userNo", member.getUserNo());
	}
	
	@PostMapping("/room/open")
	public String roomOpenProc( HttpSession session, Room room, RoomList roomList ) {
		
		//세션에 저장된 userNo 불러오기
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
		//room dto에 userNo 저장
		room.setUserNo(userno);
		
		//모임 생성
		roomService.createRoom(room, roomList);
		
		try {
			
		} catch (Exception e) {
			
		}

		return "redirect:/room/main";
	}
	
	@GetMapping("/room/roomInfo")
	public void roomInfoPage( HttpSession session, Member member, Room room, Model model ) {
		
		session.setAttribute("userNo", member.getUserNo());
		
		//roomNo로 모임정보 불러오기
		room = roomService.getRoomInfo(room);
		model.addAttribute("roomInfo", room);
		
		logger.info("roomInfo : {}", room);
	}
	
	@PostMapping("/room/roomInfo")
	public String roomInfoProc( HttpSession session, Room room ) {
		
		//세션에 저장된 userNo 불러오기
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
		
		//수정한 모임정보 저장
//		roomService.updateRoom(room);
		
		
		
		
		return "redirect:/room/main";
	}
	@GetMapping("/room/info")
	public void roomInfo( HttpSession session, Member member, Room room, RoomList roomList, Model model ) {
		
		session.setAttribute("userNo", member.getUserNo());
		
		//roomNo로 모임정보 불러오기
		room = roomService.getRoomInfo(room);
		model.addAttribute("roomInfo", room);
		
		
		
		//roomNo RoomList dto에서 userNo List 불러오기
		roomList = roomService.getUerNoListByRoomNo(room.getRoomNo());
		model.addAttribute("userNoList",roomList );
		
		
	}
	
	@GetMapping("/room/setting")
	public void roomSettingPage( HttpSession session, Member member, Room room, Model model ) {
		
		session.setAttribute("userNo", member.getUserNo());
		
		//roomNo로 모임정보 불러오기
		room = roomService.getRoomInfo(room);
		model.addAttribute("roomInfo", room);
		
		logger.info("roomInfo : {}", room);
	}
	
	@PostMapping("/room/setting")
	public String roomSettingProc( HttpSession session, Room room ) {
		
		//세션에 저장된 userNo 불러오기
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
		
		//수정한 모임정보 저장
//		roomService.updateRoom(room);
		
		
		
		
		return "redirect:/room/main";
	}
	
	
	
	@RequestMapping("/room/dropOut")
	public void roomDropout( HttpSession session, Member member ) {
		
		session.setAttribute("userNo", member.getUserNo());
		
		//세션에 저장된 userNo 불러오기
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
	}
	
	
}
