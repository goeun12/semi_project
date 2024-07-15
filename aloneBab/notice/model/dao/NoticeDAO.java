package com.project.aloneBab.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.aloneBab.board.model.vo.Reply;
import com.project.aloneBab.common.PageInfo;
import com.project.aloneBab.notice.model.vo.Notice;

@Repository("nDAO")
public class NoticeDAO {

	public int noticeListCount(SqlSessionTemplate sqlSession, String key) {
		
		return sqlSession.selectOne("noticeMapper.noticeListCount", key);
	}

	public ArrayList<Notice> noticeList(SqlSessionTemplate sqlSession, PageInfo pi, String boardGenre) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds RowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.noticeList", boardGenre, RowBounds);
	}

	public Notice noticeSelect(SqlSessionTemplate sqlSession, int boardNo) {

		return sqlSession.selectOne("noticeMapper.noticeSelect", boardNo);
	}

	public ArrayList<Notice> noticeListMin(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("noticeMapper.noticeListMin", boardNo);
	}

	public int noticeWrite(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.insert("noticeMapper.noticeWrite", n);
	}

	public int noticeUpdate(SqlSessionTemplate sqlSession, Notice no) {
		
		return sqlSession.update("noticeMapper.noticeUpdate", no);
	}

	public int noticeDelete(SqlSessionTemplate sqlSession, int boardNo) {

		return sqlSession.update("noticeMapper.noticeDelete", boardNo);
	}

	public ArrayList<Notice> noticeSearchList(SqlSessionTemplate sqlSession, PageInfo pi,
			String key) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds RowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.noticeSearchList", key, RowBounds);
	}

	public Notice noticeCommon(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("noticeMapper.noticeCommon");
	}

	public int countUpdate(SqlSessionTemplate sqlSession, Notice no) {

		return sqlSession.update("noticeMapper.countUpdate", no);
	}
	
	public ArrayList<Reply> rpList(SqlSessionTemplate sqlSession, int boardNo) {
		
		return (ArrayList)sqlSession.selectList("noticeMapper.rpList", boardNo);
	}




	
}