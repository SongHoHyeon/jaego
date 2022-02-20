package com.jaego.web.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jaego.web.dto.LectureroomDto;
import com.jaego.web.util.PageMaker;

@Repository
public class LectureroomDaoRepo implements LectureroomDao{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public LectureroomDaoRepo(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<LectureroomDto> lectureroomList(PageMaker  pageMaker) {
		return sqlSessionTemplate.selectList("lectureroomList",pageMaker);
	}

	@Override
	public void insert(LectureroomDto lectureroomDto) {
		sqlSessionTemplate.insert("insert", lectureroomDto);
	}
	
	@Override
	public int delete(LectureroomDto lectureroomDto) {
		return sqlSessionTemplate.delete("delete", lectureroomDto);
	}
	
	@Override
	public int deleteAll() {
		return sqlSessionTemplate.delete("deleteAll");
	}

	@Override
	public int update(LectureroomDto lectureroomDto) {
		return sqlSessionTemplate.update("update", lectureroomDto);
	}
	
	@Override
	public LectureroomDto select(int lectureroomId) {
		LectureroomDto dto = (LectureroomDto) sqlSessionTemplate.selectOne("select", lectureroomId);
		return dto;
	}
	
	@Override
	public void replyinsert(LectureroomDto lectureroomDto) {
		sqlSessionTemplate.insert("replyinsert", lectureroomDto);
	}

	@Override
	public int lectureroomTotalCount(PageMaker pageMaker) {
		return sqlSessionTemplate.selectOne("lectureroomTotalCount" , pageMaker);
	}
	
	
}
