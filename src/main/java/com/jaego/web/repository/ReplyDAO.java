package com.jaego.web.repository;

import java.util.List;
import java.util.Map;

import com.jaego.web.dto.ReplyDto;

public interface ReplyDAO {

	// ��� ���
	public List<ReplyDto> list(Map<String, Object> param);

	// ��� �Է�
	public void create(ReplyDto vo);

	// ��� ����
	public void update(ReplyDto vo);

	// ��� ����
	public void delete(Integer rno);

	public int replyTotalCount(int lectureroomId);

}
