package calendar.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import calendar.dao.face.CalendarDao;
import calendar.dto.Calendar;
import calendar.service.face.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired CalendarDao calendarDao;
	
	@Override
	public void insertMyCal(Calendar calendar) {
		
		calendarDao.insertMyCal(calendar);
		
	}

}
