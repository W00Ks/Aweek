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
import org.springframework.web.bind.annotation.ResponseBody;

import member.dto.Member;
import room.dto.Room;
import room.dto.RoomCategory;
import room.dto.RoomList;
import room.service.face.RoomService;

@Controller
public class RoomController {
	
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RoomService roomService;

	//어위크 홈페이지 메인
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
	
	//세션 테스트 용 로그인
	@RequestMapping("/room/login")
	public void login() {
		
	}
	
	//모임 메인
	@RequestMapping("/room/main")
	public void roomMain( HttpSession session, Model model, Member member ) {
		
		logger.info("이거 메인 get이야");
		
		//로그인 후 userNo저장
		session.setAttribute("userNo", member.getUserNo());
		int userno = (int) session.getAttribute("userNo");
		model.addAttribute("userno", userno);
		logger.info("userno : {}", userno);
		
		//userNo로 모임 list 조회(내가 가입한 모임)
		List<Room> myRoomList = roomService.myRoomList(userno);
		logger.info("myRoomList : {}", myRoomList);
		model.addAttribute("myRoomList", myRoomList);
	}
	
	//모임 전체 목록 조회 (내가 가입한 모임 x)
	@RequestMapping("/room/roomList")
	public void roomList( HttpSession session, Model model, Member member ) {
		//로그인 후 userNo저장
		session.setAttribute("userNo", member.getUserNo());
		
		//모임 전체 목록 조회
		List<Room> roomList = roomService.roomList();
//		logger.info("roomList : {}", roomList);
		model.addAttribute("roomList", roomList);
		
		
	}
	
	//모임 개설
	@GetMapping("/room/open")
	public void roomOpenPage( HttpSession session, Model model, Member member ) {
		//로그인 후 userNo저장
		session.setAttribute("userNo", member.getUserNo());
		
		List<RoomCategory> roomCategory = roomService.getRoomCategoryList();
		model.addAttribute("roomCategory",roomCategory);
	}
	
	@PostMapping("/room/open")
	public String roomOpenProc( HttpSession session, Room room, RoomList roomList, Model model ) {
		
		//세션에 저장된 userNo 불러오기
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
		//room dto에 userNo 저장
		room.setUserNo(userno);
		
		//모임 생성
		roomService.createRoom(room, roomList);
		
		//로그인 후 userNo저장
		model.addAttribute("userno", userno);
		logger.info("userno : {}", userno);
		
		//userNo로 모임 list 조회(내가 가입한 모임)
		List<Room> myRoomList = roomService.myRoomList(userno);
		logger.info("myRoomList : {}", myRoomList);
		model.addAttribute("myRoomList", myRoomList);
		
		
		return "/room/main";
	}
	
	//모임 정보
	@GetMapping("/room/roomInfo")
	public void roomInfoPage( HttpSession session, Member member, Room room, Model model ) {
		
		session.setAttribute("userNo", member.getUserNo());
		
		//roomNo로 모임정보 불러오기
		room = roomService.getRoomInfo(room);
		model.addAttribute("roomInfo", room);
		
		logger.info("모임정보보보보roomInfo : {}", room);
		
		String roomCaName = roomService.getRoomCategoryName(room.getRoomCategoryNo());
		logger.info("roomCaName : {}", roomCaName);
		model.addAttribute("roomCaName", roomCaName);
		
		//roomNo RoomList dto에서 userNo List 불러오기
		List<RoomList> userNoList = roomService.getUerNoListByRoomNo(room.getRoomNo());
		logger.info("userNoList : {}", userNoList);
		model.addAttribute("userNoList",userNoList );
		
		
	}
	
	@PostMapping("/room/roomInfo")
	public String roomInfoProc( HttpSession session, Room room ) {
		
		//세션에 저장된 userNo 불러오기
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
		return "/room/main";
	}
	
	//모임 가입
	@GetMapping("/room/join")
	public void roomJoin(  HttpSession session, Member member, Room room, Model model ) {
		
		session.setAttribute("userNo", member.getUserNo());
		
		//세션에 저장된 userNo 불러오기
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
		//roomNo로 모임정보 불러오기
		room = roomService.getRoomInfo(room);
		model.addAttribute("roomInfo", room);
		
		logger.info("roomInfo : {}", room);
		
		//roomNo RoomList dto에서 userNo List 불러오기
		List<RoomList> userNoList = roomService.getUerNoListByRoomNo(room.getRoomNo());
		logger.info("userNoList : {}", userNoList);
		model.addAttribute("userNoList",userNoList );
	}
	
	@PostMapping("/room/join")
	public String roomJoinProc( HttpSession session, RoomList roomList) {
		
		//세션에 저장된 userNo 불러오기
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
		//모임 가입
		roomService.joinRoom(roomList, userno);
		
		logger.info("roomList :{}" ,roomList);
		
		return "/room/main";
	}
	
	//모임 가입 전 가입 중복 검사
	@ResponseBody
	@RequestMapping("/room/joinUserNoChk")
	public int joinUserNoCheck(HttpSession session, int roomNo) {
		int userno = (int) session.getAttribute("userNo");
		logger.info("이거이거userno : {}", userno);
		
		//RoomList에 UserNo있는지 조회(가입되어 있는지 확인)
		boolean joinUserNoChkResult = roomService.joinUserNoChk(userno,roomNo);
		
		if ( joinUserNoChkResult ) {
			//가입 중
			return 1; 
		} else {
			//가입 하지 않음
			return 0;
		}
	}
	
	//모임 설정
	@GetMapping("/room/setting")
	public void roomSettingPage( HttpSession session, Member member, Room room, Model model ) {
		
		session.setAttribute("userNo", member.getUserNo());
		
		//roomNo로 모임정보 불러오기
		room = roomService.getRoomInfo(room);
		model.addAttribute("roomInfo", room);
		
		logger.info("roomInfo : {}", room);
		
		String roomCaName = roomService.getRoomCategoryName(room.getRoomCategoryNo());
		logger.info("roomCaName : {}", roomCaName);
		model.addAttribute("roomCaName", roomCaName);
		
		List<RoomCategory> roomCategory = roomService.getRoomCategoryList();
		model.addAttribute("roomCategory",roomCategory);
	}
	
	@PostMapping("/room/setting")
	public String roomSettingProc( HttpSession session, Room room ) {
		
		//세션에 저장된 userNo 불러오기
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
		//수정한 모임정보 저장
		roomService.updateRoom(room);

		return "/room/roomInfo";
	}
	
	//모임 탈퇴
	@ResponseBody
	@RequestMapping("/room/dropOut")
	public String roomDropout( HttpSession session, int roomNo ) {
		
		//세션에 저장된 userNo 불러오기
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}", userno);
		
		RoomList roomList = new RoomList();
		roomList.setUserNo(userno);
		roomList.setRoomNo(roomNo);
		
		//모임 탈퇴
		roomService.dropOut(roomList);
		
		return "/room/main";
	}
	
	//모임 삭제
	@ResponseBody
	@RequestMapping("/room/delete")
	public String roomDelete( HttpSession session, int roomNo, Member member ) {
		
		//세션에 저장된 userNo 불러오기
		session.setAttribute("userNo", member.getUserNo());
		
		logger.info("roomNo나와라 얍 : {}", roomNo);
		
		//모임 삭제
		roomService.deleteRoom(roomNo);
		
		return "/room/main";
	}
}
