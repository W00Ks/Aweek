package calendar.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import calendar.dto.CalDto;
import calendar.service.face.CalendarService;


@Controller
public class CalendarController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CalendarService calendarService;
	
	@RequestMapping(value = "/calendar/myCal", method = RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request, String year, String month, HttpSession session){
		

		
//		Calendar cal = Calendar.getInstance();
//		
//		int year = cal.get(Calendar.YEAR);
//		int month = cal.get(Calendar.MONTH);
//		
//		
//		String paramYear = request.getParameter("year");
//		String paramMonth = request.getParameter("month");
//		
//		if(paramYear != null) {
//			year = Integer.parseInt(paramYear);
//		}
//		if(paramMonth !=null) {
//			month =  Integer.parseInt(paramMonth);			
//		}
//		if(month>11) {
//			month=0;
//			year++;
//		}
//		if(month<0) {
//			month=11;
//			year--;
//		}
//		cal.set(year, month, 1);
//		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
//		int lastDay = cal.getActualMaximum(Calendar.DATE);
//		
//		logger.info("{}", dayOfWeek);
//		Map<String, Integer> calMap = new HashMap<String, Integer>();
//		
//		calMap.put("year", year);
//		calMap.put("month", month);
//		calMap.put("dayOfWeek", dayOfWeek);
//		calMap.put("lastDay", lastDay);
//		
//		model.addAttribute("calMap", calMap);
//		
//		
//		
//		List<calendar.dto.CalDto> list = calendarService.selectMyCal();
//		
//		
//		
//		
//		
//		logger.info("{}", list);
//		
//		model.addAttribute("list", list);
//		
//		for(int i=0; i<list.size(); i++) {
//		
////			System.out.println(list.get(i).getStartDate());
//			
//			String scheduleYear = list.get(i).getStartDate().substring(0, 4);
//			
//			System.out.println(scheduleYear);
//		
//		}
		
		int userNo = (int)session.getAttribute("userNo");
		logger.info("userNo : {} ", userNo);
		
		logger.info("/calendar/myCal");
		
		//캘린더 테이블 조회
		List<CalDto> list = calendarService.selectMyCal(userNo);
		
		logger.info("{}", list);
		
		//조회결과 전달
		model.addAttribute("list", list);
		
		
		return "/calendar/calendar";
		
	}
	
	//일정 작성 폼
	@GetMapping("/calendar/writeForm")
	public void writeForm(calendar.dto.CalDto calendar) {
		logger.info("/calendar/writeForm [GET]");
	}
	
	//일정 작성 처리
	@PostMapping("/calendar/writeForm")
	public String writeFormProc(calendar.dto.CalDto calendar,HttpSession session
				) {
		logger.info("/calendar/writeForm [POST]");
		
		int userNo = (int) session.getAttribute("userNo");
		
		
	
//		dateFormat.format(startDate);
		
		logger.info("{}", calendar);
	
		
		
		calendarService.insertMyCal(calendar, userNo);
		
		return "redirect:/calendar/myCal";
	}
	
	//일정 상세보기
	@RequestMapping("/calendar/view")
	public String view(CalDto viewCal, Model model) {
		
		//일정 조회
		viewCal = calendarService.view(viewCal);
		logger.info("조회된 일정 : {}", viewCal);
		
		model.addAttribute("viewCal", viewCal);
		
		return "/calendar/view";
	}
	
	//일정 수정하기 폼
	@GetMapping("/calendar/update")
	public String update(CalDto calDto, Model model) {
		
		calDto = calendarService.view(calDto);
		logger.info("수정할 일정 : {}", calDto);
		
		model.addAttribute("viewCal", calDto);
		
		return "calendar/update";
	}
	
	//일정 수정하기
	@PostMapping("/calendar/update")
	public String updateProc(CalDto calDto) {
		
		logger.info("/calendar/update");
		
		calendarService.update(calDto);
		
		logger.info("수정완료 : {}", calDto);
		
		return "redirect:/calendar/myCal";
	}
	
	@RequestMapping("/calendar/delete")
	public String delete(CalDto calDto) {
		
		calendarService.deleteMyCal(calDto);
		
		return "redirect:/calendar/myCal";
	}
}
