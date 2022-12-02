package calendar.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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


import calendar.service.face.CalendarService;


@Controller
public class CalendarController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CalendarService calendarService;
	
	@RequestMapping(value = "calendar/myCal", method = RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request){
		

		
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		
		System.out.println(month);
		
		String paramYear = request.getParameter("year");
		String paramMonth = request.getParameter("month");
		
		if(paramYear != null) {
			year = Integer.parseInt(paramYear);
		}
		if(paramMonth !=null) {
			month =  Integer.parseInt(paramMonth);			
		}
		if(month>11) {
			month=0;
			year++;
		}
		if(month<0) {
			month=11;
			year--;
		}
		cal.set(year, month, 1);
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		int lastDay = cal.getActualMaximum(Calendar.DATE);
		
		logger.info("{}", dayOfWeek);
		Map<String, Integer> calMap = new HashMap<String, Integer>();
		
		calMap.put("year", year);
		calMap.put("month", month);
		calMap.put("dayOfWeek", dayOfWeek);
		calMap.put("lastDay", lastDay);
		
		model.addAttribute("calMap", calMap);
		
		return "/calendar/calendar";
	}
	
	@GetMapping("/calendar/writeForm")
	public void writeForm(calendar.dto.Calendar calendar) {
		logger.info("/calendar/writeForm [GET]");
	}
	
	@PostMapping("/calendar/writeForm")
	public void writeFormProc(calendar.dto.Calendar calendar
				) {
		logger.info("/calendar/writeForm [POST]");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(calendar.getStartDate());
		System.out.println(calendar.getEndDate());
		System.out.println(dateFormat.format(calendar.getStartDate()));
		
		
	
//		dateFormat.format(startDate);
		
		logger.info("{}", calendar);
	
		
		
		calendarService.insertMyCal(calendar);
	}
}
