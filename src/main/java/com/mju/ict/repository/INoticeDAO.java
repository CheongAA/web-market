package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Notice;

public interface INoticeDAO {

	public abstract List<Notice> selectAllNotices();

	public abstract Notice selectNoticeById(int id);
	
	public abstract void insertNotice(Notice notice);

	public abstract void updateNotice(Notice notice);

	public abstract void deleteNoticeById(int id);

	public abstract void addNoticeView(int id);


}
