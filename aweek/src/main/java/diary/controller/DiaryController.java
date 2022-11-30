package diary.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import diary.service.face.DiaryService;

@Controller
@RequestMapping("/diary")
public class DiaryController {
	
	@Autowired DiaryService diaryService;
	
	@GetMapping("/main")
	public void diaryMain() {
		
		diaryService.test();
		
	}

}
