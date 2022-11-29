package room.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import room.dao.face.RoomDao;
import room.service.face.RoomService;

@Service
public class RoomServiceImpl implements RoomService {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RoomDao roomDao;
	
	
	
}
