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

import org.apache.commons.beanutils.converters.IntegerArrayConverter;
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
import calendar.dto.CalRoomList;
import calendar.dto.LoginUserInfo;
import calendar.dto.groupCalDto;
import calendar.service.face.CalendarService;
import edu.emory.mathcs.backport.java.util.Arrays;


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
		int userNo = 0;
		
		
		
		if(session.getAttribute("userNo")!=null) {
			userNo = (int)session.getAttribute("userNo");
		} else if(session.getAttribute("userNo")==null){
			return "redirect:/member/login";
		}
		
		logger.info("userNo : {} ", userNo);
		
		logger.info("/calendar/myCal");
		
		//캘린더 테이블 조회
		List<CalDto> list = calendarService.selectMyCal(userNo);
		
		
		
				
		//로그인한 회원이 가입한 모임 정보 (모임번호,모임이름)
		List<CalRoomList> loginUserRoomsInfo = calendarService.getRoomInfoByUserNo(userNo);
				
		logger.info("room : {}", loginUserRoomsInfo);
				
				
		//로그인한 회원이 가입한 모임 정보(모임이름)
				
					
		//모임 캘린더 일정 조회
		//List<groupCalDto> groupCalList = calendarService.getGroupCalList(loginUserRoomsInfo);
				
				//logger.info("groupCalList: {}", groupCalList);
				model.addAttribute("loginUserRoomsInfo", loginUserRoomsInfo);
		
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
	public String writeFormProc(calendar.dto.CalDto calendar,HttpSession session, String year, String month
				) {
		logger.info("/calendar/writeForm [POST]");
		
		//로그인한 회원번호
		int userNo = (int) session.getAttribute("userNo");
		
		
	

		
		logger.info( "write : {}", calendar);
		logger.info("importance : {}", calendar.getImportance());
		
		
		
		calendarService.insertMyCal(calendar, userNo);
		
		return "redirect:/calendar/myCal?year="+year+"&month="+month;
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
	
	@RequestMapping("/calendar/gcalView")
	public String gcalView(groupCalDto viewGroupCal, Model model,String year, String month, HttpSession session, LoginUserInfo userInfo, CalRoomList calRoomList, HttpServletRequest request) {
		
		int userNo = (int)session.getAttribute("userNo");
		
		userInfo = calendarService.getUserInfo(userNo);
		logger.info("로그인한 회원 정보 : {}", userInfo);
		
		viewGroupCal = calendarService.gcalView(viewGroupCal);
		
		
		
		//로그인한 회원이 가입한 모임 정보 (모임번호,모임이름)
		List<CalRoomList> loginUserRoomsInfo = calendarService.getRoomInfoByUserNo(userNo);
				
//		//로그인한 회원이 가입한 모임의 가입원들(회원이름)
		List<CalRoomList> loginUserRoomsMemberInfo = calendarService.getJoinMemberInfo(userNo,viewGroupCal);
		logger.info("room : {}", loginUserRoomsInfo);
				
		logger.info("joinMember : {}", loginUserRoomsMemberInfo);
				

		model.addAttribute("loginUserRoomsMemberInfo", loginUserRoomsMemberInfo);
		
		model.addAttribute("loginUserInfo", userInfo);
		
		
		logger.info("조회된 모임 일정 : {}", viewGroupCal);
		
		LoginUserInfo userInfo2 = calendarService.getWriteUser(viewGroupCal);
		
		model.addAttribute("writeUserInfo", userInfo2);
		
		model.addAttribute("viewGroupCal", viewGroupCal);
		return "/calendar/groupCalView";
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
	
	@PostMapping("/calendar/gcalUpdate")
	public String groupCalUpdateProc(groupCalDto gcalDto,String year, String month) {
		
		calendarService.updateGroupCal(gcalDto);
		
		logger.info("모임일정 수정완료 : {}", gcalDto);
		
		return "redirect:/calendar/gCal?roomNo="+gcalDto.getRoomNo()+"&year="+year+"&month="+month;
	}
	
	@RequestMapping("/calendar/delete")
	public String delete(CalDto calDto) {
		
		calendarService.deleteMyCal(calDto);
		
		return "redirect:/calendar/myCal";
	}
	
	@RequestMapping("/calendar/main")
	public String roomList(HttpSession session, Model model) {
		
		logger.info("roomList");
		
		//로그인한 회원번호
		int userNo = (int)session.getAttribute("userNo");
		logger.info("userNo : {}", userNo);
		
		//로그인한 회원이 가입한 모임 정보 (모임번호,모임이름)
		List<CalRoomList> loginUserRoomsInfo = calendarService.getRoomInfoByUserNo(userNo);
		
		logger.info("room : {}", loginUserRoomsInfo);
		
		model.addAttribute("loginUserRoomsInfo", loginUserRoomsInfo);
		
		return "/calendar/main";
	}
	
	
	//모임 캘린더
	@RequestMapping("/calendar/gCal")
	public String groupCal(HttpSession session, Model model, String year, String month,CalRoomList calRoomList) {
		
		//로그인한 회원번호
		int userNo = (int)session.getAttribute("userNo");
		logger.info("userNo : {}", userNo);
		
		calRoomList = calendarService.getRoomInfoByRoomNo(calRoomList);
		logger.info( "모임번호 :{}", calRoomList);
		
		model.addAttribute("calRoomList", calRoomList);
		//로그인한 회원이 가입한 모임 정보 (모임번호,모임이름)
		List<CalRoomList> loginUserRoomsInfo = calendarService.getRoomInfoByUserNo(userNo);
		
		//로그인한 회원이 가입한 모임의 가입원들(회원이름)
		List<CalRoomList> loginUserRoomsMemberInfo = calendarService.getJoinMemberInfo(userNo,calRoomList);
		logger.info("room : {}", loginUserRoomsInfo);
		
		logger.info("joinMember : {}", loginUserRoomsMemberInfo);
		
		model.addAttribute("loginUserRoomsInfo", loginUserRoomsInfo);
		model.addAttribute("loginUserRoomsMemberInfo", loginUserRoomsMemberInfo);
		
		
		LoginUserInfo userInfo = calendarService.getUserInfo(userNo);
		logger.info("로그인한 회원 정보 : {}", userInfo);
		
		model.addAttribute("userInfo", userInfo);
		
		
			
		//모임 캘린더 일정 조회
		List<groupCalDto> groupCalList = calendarService.getGroupCalList(calRoomList);
		
		logger.info("모임캘린더 : {}", groupCalList);
		model.addAttribute("gropCalList", groupCalList);
		
		return "/calendar/groupCalendar";
	}
	
	@PostMapping("/calendar/gCal")
	public String groupCalWriteProc(groupCalDto gCalDto, HttpSession session, String year, String month) {
		int userNo = (int) session.getAttribute("userNo");
		
		logger.info("모임일정작성내용 : {}", gCalDto);
		
		calendarService.insertGroupCal(gCalDto,userNo);
		
		return "redirect:/calendar/gCal?roomNo="+gCalDto.getRoomNo()+"&year="+year+"&month="+month;
	}
	
	@RequestMapping("/calendar/gcalDelete")
	public String groupCalDelete(groupCalDto gCalDto, String year, String month) {
		
		logger.info("삭제된 일정 정보: {}", gCalDto);
		calendarService.deleteGroupCal(gCalDto);
		return "redirect:/calendar/gCal?roomNo="+gCalDto.getRoomNo()+"&year="+year+"&month="+month;
	}
}
