package com.project.aloneBab.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.aloneBab.common.AllException;
import com.project.aloneBab.common.PageInfo;
import com.project.aloneBab.member.model.vo.Member;
import com.project.aloneBab.notice.model.service.NoticeService;
import com.project.aloneBab.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	
	@RequestMapping("notice.no")
	public String noticeListView(@RequestParam(value="Page", defaultValue="1") int currentPage, Model model) {		

		
		int listCount = nService.noticeListCount(null);		

		PageInfo pi = PageInfo.getPagination(currentPage, listCount);
		ArrayList<Notice> noticeList = nService.noticeList(pi);
		
		if(noticeList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("noticeList", noticeList);
			return "noticeList";
		}else {
			throw new AllException("공지사항 게시글 목록을 불러오지 못했습니다");
		}
		
		
	}
	
	@RequestMapping("noticeSelect.no")
	public String noticeSelect(@RequestParam("boardNo") int boardNo, @RequestParam(value="myPage", defaultValue="") String myPage, Model model, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Notice no = nService.noticeSelect(boardNo, loginUser);
		ArrayList<Notice> noticeListMin =  nService.noticeListMin(boardNo);
		ArrayList<Reply> rpList =  nService.rpList(boardNo);
		
		if(no != null) {
			model.addAttribute("no",no);
			model.addAttribute("noticeListMin", noticeListMin);
			model.addAttribute("myPage", myPage);
			model.addAttribute("rpList", rpList);
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
	
	
	@RequestMapping("noticeSearch.no")
	public String noticeSearch(@RequestParam("key") String key, @RequestParam(value="Page", defaultValue="1") int currentPage, Model model) {
		
		int listCount = nService.noticeListCount(key);		
		model.addAttribute("listCount", listCount);
		model.addAttribute("key", key);
		
		PageInfo pi = PageInfo.getPagination(currentPage, listCount);
		ArrayList<Notice> noticeSearchList = nService.noticeSearchList(pi, key);
		System.out.println(noticeSearchList);
		
		if(listCount > 0) {	
			model.addAttribute("page", currentPage);
			model.addAttribute("pi", pi);
			model.addAttribute("noticeSearchList", noticeSearchList);
		
			return "noticeSearchList";		
			
		}else if(listCount == 0) {
			model.addAttribute("msg", "검색 결과가 없습니다.");
			
			return "noticeSearchList";
		
		}else{
			throw new AllException("검색 결과를 조회하지 못했습니다.");
		}		
	}
	
	@RequestMapping(value="noticeCommon.no", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String noticeCommon(Model model) {
		
		Notice no = nService.noticeCommon();
		JSONObject json = new JSONObject();
		json.put("boardNo", no.getBoardNo());
		json.put("boardTitle", no.getTitle());
		return json.toString();
		
	}
	
	
	
	
	
	
	
	
	
}
