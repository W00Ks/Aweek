package calendar.service.face;

import java.util.List;

import calendar.dto.CalDto;


public interface CalendarService {

	public void insertMyCal(CalDto calendar);

	public List<CalDto> selectMyCal();

	public CalDto view(CalDto viewCal);

	public void update(CalDto calDto);

	public void deleteMyCal(CalDto calDto);

}
