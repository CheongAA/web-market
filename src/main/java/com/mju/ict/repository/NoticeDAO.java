package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Notice;
import com.mju.ict.model.PagingCriteria;

@Repository
public class NoticeDAO implements INoticeDAO{
    @Autowired
    private SqlSession sqlSession;

	@Override
	public List<Notice> selectAllNotices(PagingCriteria cri) {
		return sqlSession.selectList("selectAllNotices",cri);
	}

	@Override
	public Notice selectNoticeById(int id) {
		return sqlSession.selectOne("selectNoticeById", id);
	}

	@Override
	public void insertNotice(Notice notice) {
		sqlSession.insert("insertNotice", notice);
	}

	@Override
	public void addNoticeView(int id) {
		sqlSession.update("addNoticeView",id);
		
	}

	@Override
	public void updateNotice(Notice notice) {
		sqlSession.update("updateNotice",notice);
	}

	@Override
	public void deleteNoticeById(int id) {
		sqlSession.delete("deleteNoticeById", id);
	}

	@Override
	public int countNotice() {
		return sqlSession.selectOne("countNotice");
	}



}
