package com.jaego.web.service;

import java.util.List;

import com.jaego.web.dto.LectureroomDto;
import com.jaego.web.util.PageMaker;

public interface LectureroomService {
	public abstract List<LectureroomDto> lectureroomList(PageMaker  pageMaker);

	public abstract void write(LectureroomDto lectureroomDto);

	public abstract LectureroomDto read(int LectureroomId);

	public abstract int delete(LectureroomDto lectureroomDto);

	public abstract int edit(LectureroomDto lectureroomDto);

	public abstract void reply(LectureroomDto lectureroomDto);

	public abstract int lectureroomTotalCount(PageMaker pageMaker);
}
