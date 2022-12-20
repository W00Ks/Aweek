package calendar.service.face;

import java.util.List;

import calendar.dto.CalDto;


public interface CalendarService {

	public void insertMyCal(CalDto calendar, int userNo);

	public CalDto view(CalDto viewCal);

	public void update(CalDto calDto);

	public void deleteMyCal(CalDto calDto);


	public List<CalDto> selectMyCal(int userNo);

}
