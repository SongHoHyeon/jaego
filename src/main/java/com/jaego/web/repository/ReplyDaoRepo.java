package com.jaego.web.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jaego.web.dto.ReplyDto;

@Repository
public class ReplyDaoRepo implements ReplyDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ReplyDaoRepo(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}	
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	
    // ��� ���
    @Override
    public List<ReplyDto> list(Map<String,Object> param) {
        return sqlSessionTemplate.selectList("reply.listReply", param);
    }
    
    
    // ��� �ۼ�
    @Override
    public void create(ReplyDto vo) {
    	 sqlSessionTemplate.insert("reply.insertReply", vo);
    }
    
    
    // ��� ����
    @Override
    public void update(ReplyDto vo) {
      
 
    }
    // ��� ����
    @Override
    public void delete(Integer rno) {
      
 
    }

	@Override
	public int replyTotalCount(int lectureroomId) {
		return sqlSessionTemplate.selectOne("reply.replyTotalCount", lectureroomId);
	}
 
	

}
