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
	
	@Override
	public int joinMember(Member m) {
		return mDAO.joinMember(sqlSession, m);
	}

	@Override
	public int checkId(String id) {
		return mDAO.checkId(sqlSession, id);
	}

	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(String id) {
		return mDAO.deleteMember(sqlSession, id);
	}

	@Override
	public int joinAdmin(Member m) {
		return mDAO.joinAdmin(sqlSession, m);
	}
	
	@Override
	public ArrayList<Member> selectMemberList(String admin) {
		return mDAO.selectMemberList(sqlSession, admin);
	}
	
	@Override
	public ArrayList<Member> selectSearchMember(String search) {
		return mDAO.selectSearchMember(sqlSession, search);
	}
	
	@Override
	public int updateAdminStatus(Member m) {
		return mDAO.updateAdminStatus(sqlSession, m);
	}
	

}
