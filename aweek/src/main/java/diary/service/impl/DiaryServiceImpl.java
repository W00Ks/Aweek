package diary.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import diary.dao.face.DiaryDao;
import diary.dto.Diary;
import diary.dto.DiaryFavorite;
import diary.service.face.DiaryService;
import member.dto.Member;
import room.dto.Room;
import room.dto.RoomList;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired DiaryDao diaryDao;

	@Override
	public boolean login(Member member) {
		int loginChk = diaryDao.selectCntMember(member);
		logger.trace("##### loginChk : {}", loginChk);
		
		if( loginChk > 0 )	return true;
		return false;
	}

	@Override
	public Member userInfo(Member member) {
		return diaryDao.selectMember(member);
	}

	@Override
	public List<RoomList> userRoomInfo(int userNo) {
		return diaryDao.selectRoomList(userNo);
	}

	@Override
	public List<Room> userRoomInfo(HashMap<String, Object> param) {
		return diaryDao.selectRoom(param);
	}

	@Override
	public void userFavorite(String[] roomnos, int userNo) {
		diaryDao.deleteFavorite(userNo);
		
		List<DiaryFavorite> list = new ArrayList<>();
				
		for(int i=0; i<roomnos.length; i++) {
			list.add(new DiaryFavorite(userNo, Integer.parseInt(roomnos[i]), ""));
		}
		
		for( DiaryFavorite i : list ) logger.trace("##### list : {}", i);
		
		diaryDao.insertFavorite(list);
	}

	@Override
	public List<DiaryFavorite> userFavorite(int userNo) {
		return diaryDao.selectFavorite(userNo);
	}

	@Override
	public void userFavoriteClear(int userNo) {
		diaryDao.deleteFavorite(userNo);
	}

}
