package diary.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import diary.dao.face.DiaryDao;
import diary.service.face.DiaryService;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired DiaryDao diaryDao;

	@Override
	public void test() {
		// TODO Auto-generated method stub
		
	}

}
