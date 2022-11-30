package cs.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cs.dao.face.CsDao;
import cs.service.face.CsService;

@Service
public class CsServiceImpl implements CsService {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CsDao csDao;
	
}
