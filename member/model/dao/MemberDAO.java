package com.project.aloneBab.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.aloneBab.board.model.vo.Board;
import com.project.aloneBab.common.PageInfo;
import com.project.aloneBab.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public Member login(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.login", m);
	}

	public Member findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	public Member findPw(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findPw", m);
	}

	public void updatePwd(SqlSessionTemplate sqlSession, Member member) {
		sqlSession.update("memberMapper.updatePwd", member);
	}

	public int getListCount(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.getListCount", id);
	}

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, String id) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectBoardList", id, rowBounds);
	}

}
