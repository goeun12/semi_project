package com.project.aloneBab.member.model.service;

import java.util.ArrayList;

import com.project.aloneBab.board.model.vo.Board;
import com.project.aloneBab.common.PageInfo;
import com.project.aloneBab.member.model.vo.Member;

public interface MemberService {

	Member login(Member m);

	Member findId(Member m);

	Member findPw(Member m);

	void updatePwd(Member member);

	int getListCount(String id);

	ArrayList<Board> selectBoardList(PageInfo pi, String id);

}
