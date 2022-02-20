package com.jaego.web.service;

import java.util.List;
import java.util.Map;

import com.jaego.web.dto.ReplyDto;

public interface ReplyService {

	// ´ñ±Û ¸ñ·Ï
	public List<ReplyDto> list(Map<String,Object> param);

	// ´ñ±Û ÀÔ·Â
	public void create(ReplyDto vo);

	// ´ñ±Û ¼öÁ¤
	public void update(ReplyDto vo);

	// ´ñ±Û »èÁ¦
	public void delete(Integer rno);

	public int replyTotalCount(int lectureroomId);
}
