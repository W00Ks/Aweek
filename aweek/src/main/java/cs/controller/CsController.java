package cs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cs.service.face.CsService;

@Controller
public class CsController {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CsService csService;
	
	@RequestMapping("/cs/main")
	public void noticeMain() {
		
	}
	
}
