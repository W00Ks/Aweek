package calendar.service.face;

import java.util.List;

import calendar.dto.Calendar;

public interface CalendarService {

	public void insertMyCal(Calendar calendar);

	public List<Calendar> selectMyCal();

}
