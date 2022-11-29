package room.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import room.service.face.RoomService;

@Controller
public class RoomController {
	
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RoomService roomService;

	@RequestMapping("/main")
	public void main() {
		
		logger.info("/main [GET]");
		
	}
	
	@RequestMapping("/room/main")
	public void open() {
		
		logger.info("/room/main [GET]");
		
	}
	
	
	
}
