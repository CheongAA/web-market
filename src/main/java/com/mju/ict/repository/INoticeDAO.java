package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Notice;
import com.mju.ict.model.PagingCriteria;

public interface INoticeDAO {

	public abstract List<Notice> selectAllNotices(PagingCriteria cri);

	public abstract Notice selectNoticeById(int id);
	
	public abstract void insertNotice(Notice notice);

	public abstract void updateNotice(Notice notice);

	public abstract void deleteNoticeById(int id);

	public abstract void addNoticeView(int id);

	public abstract int countNotice();


}
