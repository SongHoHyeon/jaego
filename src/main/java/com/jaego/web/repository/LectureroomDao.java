package com.jaego.web.repository;

import java.util.List;

import com.jaego.web.dto.LectureroomDto;
import com.jaego.web.util.PageMaker;

public interface LectureroomDao {
	public abstract List<LectureroomDto> lectureroomList(PageMaker  pageMaker);

	public abstract void insert(LectureroomDto lectureroomDto);

	public abstract LectureroomDto select(int LectureroomId);

	public abstract int delete(LectureroomDto lectureroomDto);

	public abstract int deleteAll();

	public abstract int update(LectureroomDto lectureroomDto);

	public abstract void replyinsert(LectureroomDto lectureroomDto);

	public abstract int lectureroomTotalCount(PageMaker pageMaker);
}
