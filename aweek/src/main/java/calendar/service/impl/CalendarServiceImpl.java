package calendar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import calendar.dao.face.CalendarDao;
import calendar.dto.CalDto;
import calendar.dto.CalRoomList;
import calendar.dto.groupCalDto;
import calendar.service.face.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired CalendarDao calendarDao;
	
	//일정작성
	@Override
	public void insertMyCal(CalDto calendar, int userNo) {
		
		calendar.setUserNo(userNo);
		
		if(calendar.getImportance()==null) {
			calendar.setImportance("0");
		} else {
			calendar.setImportance("1");
		}
		
		
		calendarDao.insertMyCal(calendar);
		
	}

	
	
	@Override
	public CalDto view(CalDto viewCal) {
		
		return calendarDao.selectMyCalByCalNo(viewCal);
	}
	
	//일정수정
	@Override
	public void update(CalDto calDto) {
		
		if(calDto.getImportance()==null) {
			calDto.setImportance("0");
		} else {
			calDto.setImportance("1");
		}
		calendarDao.updateCal(calDto);
	}
	
	//일정삭제
	@Override
	public void deleteMyCal(CalDto calDto) {
		
		calendarDao.deleteMyCal(calDto);
	}


	//일정목록
	@Override
	public List<CalDto> selectMyCal(int userNo) {
		
		return calendarDao.selectMyCal(userNo);
	}


	//회원이 가입한 모임정보(모임번호, 모임이름)
	@Override
	public List<CalRoomList> getRoomInfoByUserNo(int userNo) {
		return calendarDao.selectRoomInfoByUserNo(userNo);
	}



	@Override
	public List<CalRoomList> getMembereInfoByRoomNo(int userNo) {
		return calendarDao.selectMemberInfoByRoomNo(userNo);
	}



	@Override
	public List<groupCalDto> getGroupCalList(CalRoomList calRoomList) {
		return calendarDao.selectGroupCal(calRoomList);
	}



	@Override
	public void insertGroupCal(groupCalDto gCalDto, int userNo) {
		
		gCalDto.setUserNo(userNo);
		
		if(gCalDto.getImportance()==null) {
			gCalDto.setImportance("0");
		} else {
			gCalDto.setImportance("1");
		}
		calendarDao.insertGroupCal(gCalDto);
	}



	@Override
	public groupCalDto gcalView(groupCalDto viewGroupCal) {
		return calendarDao.selectGroupCalByGroupCalNo(viewGroupCal);
	}



	@Override
	public void updateGroupCal(groupCalDto gcalDto) {
		if(gcalDto.getImportance()==null) {
			gcalDto.setImportance("0");
		} else {
			gcalDto.setImportance("1");
		}
		calendarDao.updateGroupCal(gcalDto);
		
	}



	@Override
	public void deleteGroupCal(groupCalDto gCalDto) {
		calendarDao.deleteGroupCal(gCalDto);
	}



	@Override
	public CalRoomList getRoomInfoByRoomNo(CalRoomList calRoomList) {
		return calendarDao.selectRoomInfoByRoomNo(calRoomList);
	}



	

}
