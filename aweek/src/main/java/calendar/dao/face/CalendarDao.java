package calendar.dao.face;

import java.util.List;

import calendar.dto.Calendar;

public interface CalendarDao {

	/**
	 * 나의 캘린더 데이터 삽입
	 * 
	 * @param calendar
	 */
	public void insertMyCal(Calendar calendar);

	public List<Calendar> selectMyCal();

}
