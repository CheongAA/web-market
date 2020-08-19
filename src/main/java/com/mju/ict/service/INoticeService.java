package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.Notice;

public interface INoticeService {

	public abstract List<Notice> getAllNotices();

	public abstract void registerNotice(Notice notice);

	public abstract Notice getNoticeById(int id);

	public abstract void addNoticeView(int id);

	public abstract void updateNotice(Notice notice);

	public abstract void deleteNoticeById(int id);

}
