package com.project.aloneBab.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.aloneBab.board.model.vo.Board;
import com.project.aloneBab.common.PageInfo;
import com.project.aloneBab.member.model.dao.MemberDAO;
import com.project.aloneBab.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;
	
	@Override
	public Member login(Member m) {
		return mDAO.login(sqlSession, m);
	}
	
	@Override
	public Member findId(Member m) {
		return mDAO.findId(sqlSession, m);
	}
	
	@Override
	public Member findPw(Member m) {
		return mDAO.findPw(sqlSession, m);
	}
	
	@Override
	public void updatePwd(Member member) {
		mDAO.updatePwd(sqlSession, member);
	}
	
	@Override
	public int getListCount(String id) {
		return mDAO.getListCount(sqlSession, id);
	}
	
	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi, String id) {
		return mDAO.selectBoardList(sqlSession, pi, id);
	}
}
