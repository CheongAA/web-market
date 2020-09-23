package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.Notice;
import com.mju.ict.model.PagingCriteria;

public interface INoticeService {

	public abstract List<Notice> getAllNotices(PagingCriteria cri);

	public abstract Notice getNoticeById(int id);

	public abstract void registerNotice(Notice notice);

	public abstract void updateNotice(Notice notice);

	public abstract void deleteNoticeById(int id);

	public abstract void addNoticeView(int id);

	public abstract int countNotice();
}
