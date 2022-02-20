package com.jaego.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.jaego.web.dto.LectureroomDto;
import com.jaego.web.service.LectureroomService;
import com.jaego.web.util.PageMaker;

@Controller
@SessionAttributes("lectureroomDto")
public class LectureroomController {
	
	@Autowired
	private LectureroomService lectureroomService;
	
	
	@RequestMapping(value="/lectureroom/list")
	public String list( PageMaker  pageMaker , Model model , HttpServletRequest request ){
		int totCount=lectureroomService.lectureroomTotalCount(pageMaker);
		pageMaker.setTotPage(totCount);
		List<LectureroomDto>  lectureroomList=lectureroomService.lectureroomList(pageMaker);
		String pagination= pageMaker.bootStrapPagingHTML(request.getContextPath()  +"/lectureroom/list");
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("totCount", totCount);
		model.addAttribute("lectureroomList", lectureroomList);
		return "/lectureroom/list";
	}
	
	@RequestMapping(value="/lectureroom/read/{lectureroomId}")
	public String read(Model model, @PathVariable int lectureroomId) {
		model.addAttribute("lectureroomDto", lectureroomService.read(lectureroomId));
		return "/lectureroom/read";
		
	}
	
	//새글 작성
	@RequestMapping(value="/lectureroom/write", method=RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("lectureroomDto", new LectureroomDto());
		return "/lectureroom/write";
	}
	
	//새글 등록
	@RequestMapping(value="/lectureroom/write", method=RequestMethod.POST)
	public String write(@ModelAttribute("lectureroomDto")LectureroomDto lectureroom,
			@RequestParam(name="file")MultipartFile image, HttpServletRequest req,
			@Valid LectureroomDto lectureroomDto,
			BindingResult bindingResult) throws Exception 
	{
		String path = "/resources/lectureroom";
		String filePath = req.getSession().getServletContext().getRealPath("/")+path;
		String fileName = image.getOriginalFilename();
		
		if(bindingResult.hasErrors()) {
			return "/lectureroom/write";
		}
		if(!fileName.isEmpty()) {
			try {
				File p = new File(filePath+"/"+fileName);
				image.transferTo(p);
				lectureroom.setLectureroomFname(fileName);
				lectureroomService.write(lectureroom);
			}catch(RuntimeException e) {
				return "/lectureroom/write";
			}catch(IOException e) {
				e.printStackTrace();
			}
		}else {
			lectureroomService.write(lectureroomDto);
			return "redirect:/lectureroom/list";
		}
	
		
		return "redirect:/lectureroom/list";
	}
	
	
	//글 수정
	@RequestMapping(value="/lectureroom/edit/{lectureroomId}", method=RequestMethod.GET)
	public String edit(@PathVariable int lectureroomId, Model model) {
			LectureroomDto lectureroomDto = lectureroomService.read(lectureroomId);
			model.addAttribute("lectureroomDto", lectureroomDto);
			return "/lectureroom/edit";
	}
	
	@RequestMapping(value="/lectureroom/edit/{lectureroomId}", method=RequestMethod.POST)
	public String edit(@Valid @ModelAttribute LectureroomDto lectureroomDto,
			BindingResult result, String pwd,
			SessionStatus sessionStatus, Model model) {
		if(result.hasErrors()) {
			return "/lectureroom/edit";
		}
		else {
				if(lectureroomDto.getLectureroomPassword() == pwd) {
					lectureroomService.edit(lectureroomDto);
					sessionStatus.setComplete();
					return "redirect:/lectureroom/list";
				
		}
		model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
		return "/lectureroom/edit";
		}
	}
	
	@RequestMapping(value="/lectureroom/delete/{lectureroomId}", method=RequestMethod.GET)
	public String delete(@PathVariable int lectureroomId, Model model) {
		model.addAttribute("lectureroomId", lectureroomId);
		return "/lectureroom/delete";
	}
	
	@RequestMapping(value="/lectureroom/delete", method=RequestMethod.POST)
	public String delete(int lectureroomId, String pwd, Model model) {
		int rowCount;
		LectureroomDto lectureroomDto = new LectureroomDto();
		lectureroomDto.setLectureroomId(lectureroomId);
		lectureroomDto.setLectureroomPassword(pwd);
		
		rowCount = lectureroomService.delete(lectureroomDto);
		
		if(rowCount == 0) {
			model.addAttribute("lectureroomId", lectureroomId);
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다. ");
			return "/lectureroom/delete";
		}
		else {
			return "redirect:/lectureroom/list";
		}
	}
	
	@RequestMapping(value="/lectureroom/reply/{lectureroomId}", method=RequestMethod.GET)
	public String reply(Model model,@PathVariable int lectureroomId) {
		model.addAttribute("lectureroomDto", new LectureroomDto());
		model.addAttribute("lectureroomId", lectureroomId);
		return "/lectureroom/reply";
	}
	
	@RequestMapping(value="/lectureroom/reply/{lectureroomId}", method=RequestMethod.POST)
	public String reply(LectureroomDto lectureroomDto, BindingResult bindingResult) {
		System.out.println(lectureroomDto.getLectureroomId());
		if(bindingResult.hasErrors()) {
			return "/lectureroom/reply";
		}
		lectureroomService.reply(lectureroomDto);
		return "redirect:/lectureroom/read/{lectueroomId}";
	}
	
}