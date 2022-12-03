package room.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		
		logger.info("roomList 조회 결과");
		for( Room r : roomList )	logger.info("{}", r);
		
		return roomList;
	}
	
	@Override
	public List<Room> myRoomList() {
		
		List<Room> myRoomList = roomDao.selectMyAll();
		
		logger.info("roomList 조회 결과");
		for( Room r : myRoomList )	logger.info("{}", r);
		
		return myRoomList;
	}
	
	@Override
	@Transactional
	public void createRoom(Room room, RoomList roomList) {
		roomDao.insertRoom(room);
		
		roomList.setRoomNo(room.getRoomNo());
		roomList.setUserNo(room.getUserNo());
		roomDao.insertRoomInfo(roomList);
	}
	
	
	@Override
	public Room getRoomInfo(Room room) {
		return roomDao.selectRoomInfo(room);
	}
}
