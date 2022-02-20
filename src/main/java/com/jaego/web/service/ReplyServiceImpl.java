package com.jaego.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jaego.web.dto.ReplyDto;
import com.jaego.web.repository.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService  {

	 	@Autowired
	    ReplyDAO replyDao;
	    
	    // ´ñ±Û ¸ñ·Ï
	    @Override
	    public List<ReplyDto> list(Map<String,Object> param) {
	        return replyDao.list(param);
	    }
	    // ´ñ±Û ÀÛ¼º
	    @Override
	    public void create(ReplyDto vo) {
	        replyDao.create(vo);
	    }
	    // ´ñ±Û ¼öÁ¤
	    @Override
	    public void update(ReplyDto vo) {
	   
	 
	    }
	    // ´ñ±Û »èÁ¦
	    @Override
	    public void delete(Integer rno) {
	   	 
	    }
		@Override
		public int replyTotalCount(int lectureroomId) {		
			  return replyDao.replyTotalCount(lectureroomId);
		}
	    
	    
}
