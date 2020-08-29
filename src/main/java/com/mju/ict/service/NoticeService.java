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

	//공지 전체 조회
	@Override
	public List<Notice> getAllNotices() {
		return noticeDAO.selectAllNotices();
	}
	
	//notice_id로 공지사항 조회
	@Override
	public Notice getNoticeById(int id) {
		return noticeDAO.selectNoticeById(id);
	}

	//공지사항 등록
	@Override
	public void registerNotice(Notice notice) {
		noticeDAO.insertNotice(notice);
	}

	//공지사항 수정
	@Override
	public void updateNotice(Notice notice) {
		noticeDAO.updateNotice(notice);
	}

	//공지사항 삭제
	@Override
	public void deleteNoticeById(int id) {
		noticeDAO.deleteNoticeById(id);		
	}


	//공지사항 조회수 증가
	@Override
	public void addNoticeView(int id) {
		noticeDAO.addNoticeView(id);		
	}

}
