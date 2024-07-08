package com.project.aloneBab.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.aloneBab.board.model.service.BoardService;
import com.project.aloneBab.board.model.vo.Board;
import com.project.aloneBab.board.model.vo.Image;
import com.project.aloneBab.board.model.vo.Recipe;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	// 레시피 목록 페이지 이동
	@RequestMapping("recipe.re")
	public String recipeListView() {
		
		return "recipeList";
	}
	
	// 레시피 작성 페이지 이동
	@RequestMapping("write.re")
	public String recipeWriteView() {
		
		return "recipeWrite";
	}
	
	// 꿀팁 목록 페이지 이동
	@RequestMapping("tip.tip")
	public String tipListView() {
		
		return "tipList";
	}
	
	// 꿀팁 작성 페이지 이동
	@RequestMapping("write.tip")
	public String tipWriteView() {
		
		return "tipWrite";
	}
	
	
	// 랜덤메뉴 페이지 이동
	@RequestMapping("random.re")
	public String randomView() {
		
		return "randomMenu";
	}
	
	// 내 글 화면에서 게시글로 넘어가는 과정
	@RequestMapping("selectMyBoard.bo")
	public String selectMyBoard(@RequestParam("boardNo") int boardNo,
								@RequestParam("page") int page,
								HttpSession session,
								Model model) {
		Board board = bService.selectMyBoard(boardNo);

		String genre = board.getBoardGenre();
		
		model.addAttribute("myPage", "Y");
		
		if(genre.equals("레시피")) {
			Recipe recipe = bService.selectRecipe(board.getBoardNo());
			ArrayList<Image> iList = bService.selectImage(recipe.getRecipeNo());
			
			model.addAttribute("board", board);
			model.addAttribute("recipe", recipe);
			model.addAttribute("iList", iList);
			model.addAttribute("page", page);
			
			return "recipeContent";	// redirect로 상세조회 페이지 url넣기
		} else {
			
			model.addAttribute("page", page);
			
			if(genre.equals("꿀팁")) {
				model.addAttribute("board", board);
				return "tipContent"; // redirect로 상세조회 페이지 url넣기
			} else {
				model.addAttribute("boardNo", board.getBoardNo());
				
				
				return "redirect:noticeSelect.no";
			}
		}
		
	}
	
	
	
	
}
