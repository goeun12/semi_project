package com.project.aloneBab.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.aloneBab.common.PageInfo;
import com.project.aloneBab.notice.model.dao.NoticeDAO;
import com.project.aloneBab.notice.model.vo.Notice;

@Service("nService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO nDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int noticeListCount() {
		
		return nDAO.noticeListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> noticeList(PageInfo pi, String boardGenre) {
		
		return nDAO.noticeList(sqlSession, pi, boardGenre);
	}

	@@Override
	public Notice noticeSelect(int boardNo, Member loginUser) {
		
		Notice no = nDAO.noticeSelect(sqlSession, boardNo);
		
		if(loginUser != null && loginUser.getId() != no.writer) {
			no.setCount(no.getCount()+1);
		}
			
		return no;
	}

	@Override
	public ArrayList<Notice> noticeListMin(int BoardNo) {
		
		return  nDAO.noticeListMin(sqlSession, BoardNo);
	}

	@Override
	public int noticeWrite(Notice n) {
	
		return nDAO.noticeWrite(sqlSession, n);
	}

	@Override
	public int noticeUpdate(Notice no) {
		
		return nDAO.noticeUpdate(sqlSession, no);
	}

	@Override
	public int noticeDelete(int boardNo) {

		return nDAO.noticeDelete(sqlSession, boardNo);
	}

	
	
	@Override
	public ArrayList<Notice> noticeSearchList(PageInfo pi, String key) {
		
		return nDAO.noticeSearchList(sqlSession, pi,key);
	}

	@Override
	public Notice noticeCommon() {
		
		return nDAO.noticeCommon(sqlSession);
	
	
	
	
	
	
}