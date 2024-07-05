package com.project.aloneBab.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.aloneBab.common.AllException;
import com.project.aloneBab.common.PageInfo;
import com.project.aloneBab.member.model.vo.Member;
import com.project.aloneBab.notice.model.service.NoticeService;
import com.project.aloneBab.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	
	// 공지사항 목록 페이지 이동
	@RequestMapping("notice.no")
	public String noticeListView(@RequestParam(value="Page", defaultValue="1") int currentPage, Model model) {		
		//throw new AllException("오류가 발생했습니다");
		
		int listCount = nService.noticeListCount();		

		PageInfo pi = PageInfo.getPagination(currentPage, listCount);
		String boardGenre = "공지";
		ArrayList<Notice> noticeList = nService.noticeList(pi, boardGenre);
		
		if(noticeList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("noticeList", noticeList);
			return "noticeList";
		}else {
			throw new AllException("공지사항 게시글 목록을 불러오지 못했습니다");
		}
		
		
	}
	
	@RequestMapping("noticeSelect.no")
	public String noticeSelect(@RequestParam("boardNo") int boardNo, Model model, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Notice no = nService.noticeSelect(boardNo, loginUser);
		ArrayList<Notice> noticeListMin =  nService.noticeListMin(no.getBoardNo());
		
		if(no != null) {
			model.addAttribute("no",no);
			model.addAttribute("noticeListMin", noticeListMin);
			
			return "noticeContent";
		}else {
			throw new AllException("공지사항 게시글을 불러오지 못했습니다");
		}
	}
	


	@RequestMapping("noticeWriteView.no")
	public String noticeWriteView() {
		
		return "noticeWrite";
	}
	
	
	@RequestMapping("noticeWrite.no")
	public String noticeWrite(@ModelAttribute Notice n, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		n.setWriter(loginUser.getId());
		int result = nService.noticeWrite(n);
		
		if(result > 0 ) {
			return "redirect:notice.no";
		}else {
			throw new AllException("공지사항 게시글을 등록하지 못했습니다");
		}
		
	}
	
	@RequestMapping("noticeUpdateView.no")
	public String noticeUpdateView(@RequestParam("boardNo") int boardNo, Model model) {
		
		Notice no = nService.noticeSelect(boardNo, null);
		
		if(no != null) {
			model.addAttribute("no",no);
			return "noticeUpdate";
		}else {
			throw new AllException("공지사항 게시글 수정 페이지를 불러오지 못했습니다");
		}		
	}
	
		
	
	// 공지사항 수정
	@RequestMapping("noticeUpdate.no")
	public String noticeUpdate(@ModelAttribute Notice no) {
		
		int result = nService.noticeUpdate(no);
				
		if(result > 0 ) {
			return "redirect:notice.no";
		}else {
			throw new AllException("공지사항 게시글을 등록하지 못했습니다");
		}
	
	}

	@RequestMapping("noticeDelete.no")
	public int noticeDelete(@RequestParam("boardNo") int boardNo) {
		
		int result = nService.noticeDelete(boardNo);
		
		if(result > 0 ) {
			return result;
		}else {
			throw new AllException("공지사항 게시글을 삭제하지 못했습니다");
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
