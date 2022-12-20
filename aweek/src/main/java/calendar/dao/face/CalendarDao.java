package calendar.dao.face;

import java.util.List;

import calendar.dto.CalDto;


public interface CalendarDao {

	/**
	 * 나의 캘린더 데이터 삽입
	 * 
	 * @param calendar
	 */
	public void insertMyCal(CalDto calendar);

	

	public CalDto selectMyCalByCalNo(CalDto viewCal);

	public void updateCal(CalDto calDto);

	public void deleteMyCal(CalDto calDto);



	public List<CalDto> selectMyCal(int userNo);




}
