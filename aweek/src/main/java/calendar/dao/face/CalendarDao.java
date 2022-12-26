package calendar.dao.face;

import java.util.List;

import calendar.dto.CalDto;
import calendar.dto.CalRoomList;
import calendar.dto.groupCalDto;


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



	public List<CalRoomList> selectRoomInfoByUserNo(int userNo);



	public List<CalRoomList> selectMemberInfoByRoomNo(int userNo);



	public List<groupCalDto> selectGroupCal(CalRoomList calRoomList);



	public void insertGroupCal(groupCalDto gCalDto);



	public groupCalDto selectGroupCalByGroupCalNo(groupCalDto viewGroupCal);



	public void updateGroupCal(groupCalDto gcalDto);



	public void deleteGroupCal(groupCalDto gCalDto);



	public CalRoomList selectRoomInfoByRoomNo(CalRoomList calRoomList);




}
