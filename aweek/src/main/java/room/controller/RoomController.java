package room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoomController {

	@RequestMapping("/room/open")
	public String open() {
		
		return "redirect:/main";
	}
	
	
	
}
