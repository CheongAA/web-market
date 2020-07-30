package com.mju.ict.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mju.ict.model.Notice;
import com.mju.ict.service.INoticeService;

@Controller
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	INoticeService noticeService;

	//공지사항 목록 페이지
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String getNotice(Model model) {
		List<Notice> notices = noticeService.getAllNotices();
		
		model.addAttribute("notices", notices);
		return "notice/list";
	}
	
	//공지사항 디테일 페이지
	@RequestMapping(value = "/notice/{id}", method = RequestMethod.GET)
	public String getNoticeDetail(@PathVariable int id,Model model) {
		noticeService.addNoticeView(id);
		Notice notice = noticeService.getNoticeById(id);

		model.addAttribute("notice", notice);
		return "notice/detail";
	}

}
