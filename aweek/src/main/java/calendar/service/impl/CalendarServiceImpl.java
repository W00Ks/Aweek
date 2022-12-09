package calendar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import calendar.dao.face.CalendarDao;
import calendar.dto.CalDto;
import calendar.service.face.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired CalendarDao calendarDao;
	
	@Override
	public void insertMyCal(CalDto calendar) {
		
		calendarDao.insertMyCal(calendar);
		
	}

	@Override
	public List<CalDto> selectMyCal() {
		
		return calendarDao.selectMyCal();
	}

	@Override
	public CalDto view(CalDto viewCal) {
		
		return calendarDao.selectMyCalByCalNo(viewCal);
	}

	@Override
	public void update(CalDto calDto) {
		
		calendarDao.updateCal(calDto);
	}

	@Override
	public void deleteMyCal(CalDto calDto) {
		
		calendarDao.deleteMyCal(calDto);
	}

}
