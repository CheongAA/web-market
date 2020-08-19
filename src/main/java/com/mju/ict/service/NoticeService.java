package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Notice;
import com.mju.ict.repository.INoticeDAO;

@Service
public class NoticeService implements INoticeService{

	@Autowired
	INoticeDAO noticeDAO;

	@Override
	public List<Notice> getAllNotices() {
		return noticeDAO.selectAllNotices();
	}

	@Override
	public void registerNotice(Notice notice) {
		noticeDAO.insertNotice(notice);
	}

	@Override
	public Notice getNoticeById(int id) {
		return noticeDAO.selectNoticeById(id);
	}

	@Override
	public void addNoticeView(int id) {
		noticeDAO.addNoticeView(id);		
	}

	@Override
	public void updateNotice(Notice notice) {
		noticeDAO.updateNotice(notice);
	}

	@Override
	public void deleteNoticeById(int id) {
		noticeDAO.deleteNoticeById(id);
		
	}




}
