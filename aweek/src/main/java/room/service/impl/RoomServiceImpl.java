package room.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import diary.dto.DiaryCategory;
import room.dao.face.RoomDao;
import room.dto.Room;
import room.dto.RoomCategory;
import room.dto.RoomList;
import room.service.face.RoomService;

@Service
public class RoomServiceImpl implements RoomService {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RoomDao roomDao;
	

	@Override
	public List<Room> roomList() {
		
		List<Room> roomList = roomDao.selectAll();
		
		for( Room r : roomList )	logger.info("{}", r);
		
		return roomList;
	}
	
	@Override
	public List<RoomCategory> getRoomCategoryList() {
		
		List<RoomCategory> roomCategoryList = roomDao.selectCategoryAll();
		
		for( RoomCategory c : roomCategoryList )	logger.info("{}", c);
		
		return roomCategoryList;
	}
	
	@Override
	public List<Room> myRoomList(int userno) {
		
		List<Room> myroomList = roomDao.selectRoomListByUserNo(userno);
		logger.info("myroomList : {}", myroomList);
		
		return myroomList;
	}
	
	@Override
	@Transactional
	public void createRoom(Room room, RoomList roomList) {
		roomDao.insertRoom(room);
		roomList.setRoomNo(room.getRoomNo());
		roomList.setUserNo(room.getUserNo());
		roomDao.insertRoomInfo(roomList);
		
//		DiaryCategory diaryCategory = new DiaryCategory();
//		diaryCategory.setRoomNo(room.getRoomNo());
//		roomDao.insertDiaryCategory(diaryCategory);
	}
	
	@Override
	public Room getRoomInfo(Room room) {
		return roomDao.selectRoomInfo(room);
	}
	
	@Override
	public String getRoomCategoryName(int roomCategoryNo) {
		
		String roomCaName = roomDao.selectRoomCaName(roomCategoryNo);
		
		return roomCaName;
	}
	
	@Override
	public List<RoomList> getUerNoListByRoomNo(int roomNo) {
		List<RoomList> roomList = roomDao.selectUserNoFromRoomList(roomNo);
		
		for( RoomList r : roomList )	logger.info("{}", r);
		
		return roomList;
	}
	
	@Override
	public void joinRoom(RoomList roomList, int userno) {
		
		roomList.setUserNo(userno);
		logger.info("roomList이거이거: {}", roomList);
		
		roomDao.insertRoomInfo(roomList);
		
	}
	
	@Override
	public boolean joinUserNoChk(int userno, int roomNo) {
		
		
		RoomList roomList = new RoomList();
		roomList.setUserNo(userno);
		roomList.setRoomNo(roomNo);
		
		int result = roomDao.selectUserNoChk(roomList);
		logger.info("result : {}", result); 
		
		if(result > 0) {
			logger.info("true");
			//가입함
			return true;
		}
		logger.info("false");
		//가입안함
		return false;
	}
	
	@Override
	public void updateRoom(Room room) {
		roomDao.updateRoom(room);
	}
	
	@Override
	public void dropOut(RoomList roomList) {
		roomDao.deleteRoomList(roomList);
	}
	
	@Override
	public void deleteRoom(int roomNo) {
		roomDao.deleteRoom(roomNo);
	}
	
}
