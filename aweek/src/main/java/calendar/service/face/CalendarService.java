package calendar.service.face;

import java.util.List;

import calendar.dto.CalDto;
import calendar.dto.CalRoomList;
import calendar.dto.LoginUserInfo;
import calendar.dto.groupCalDto;


public interface CalendarService {

	public void insertMyCal(CalDto calendar, int userNo);

	public CalDto view(CalDto viewCal);

	public void update(CalDto calDto);

	public void deleteMyCal(CalDto calDto);

	public List<CalDto> selectMyCal(int userNo);

	public List<CalRoomList> getRoomInfoByUserNo(int userNo);

	public List<CalRoomList> getMembereInfoByRoomNo(int userNo);

	public List<groupCalDto> getGroupCalList(CalRoomList calRoomList);

	public void insertGroupCal(groupCalDto gCalDto, int userNo);

	public groupCalDto gcalView(groupCalDto viewGroupCal);

	public void updateGroupCal(groupCalDto gcalDto);

	public void deleteGroupCal(groupCalDto gCalDto);

	public CalRoomList getRoomInfoByRoomNo(CalRoomList calRoomList);

	public List<CalRoomList> getJoinMemberInfo(int userNo, CalRoomList calRoomList);

	public LoginUserInfo getUserInfo(int userNo);

	public LoginUserInfo getWriteUser(groupCalDto viewGroupCal);

	public List<CalRoomList> getJoinMemberInfo(int userNo, groupCalDto viewGroupCal);

}
