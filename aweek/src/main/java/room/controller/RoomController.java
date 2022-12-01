package room.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.dto.Member;
import room.dto.Room;
import room.dto.RoomCategory;
import room.service.face.RoomService;

@Controller
public class RoomController {
	
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RoomService roomService;

	@RequestMapping("/main")
	public void main() {
		
		
	}
	
	@RequestMapping("/room/main")
	public void roomMain() {
		
		
	}
	
	@RequestMapping("/room/open")
	public String roomOpen(
			
			Room room
			, HttpSession session
			, Member member
			, int roomCategoryNo
			, Model model
			
			) {
		
        session.setAttribute("userNo", member.getUserNo());
        
        roomService.getRoomCategoryNo(roomCategoryNo);
        
//        int roomCategoryNo = roomCategory.getRoomCategoryNo();
//        model.addAttribute("roomCategory", roomCategory);
		
		roomService.createRoom(room);
		
		return "redirect:/room/main";
		
	}
	
	
}
