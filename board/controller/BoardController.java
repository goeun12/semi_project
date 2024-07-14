package com.project.aloneBab.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.aloneBab.board.model.service.BoardService;
import com.project.aloneBab.board.model.vo.RandomRecipe;

@Controller
public class BoardController {
	
	
	@Autowired
	private BoardService bService;
	

	@RequestMapping("recipe.re")
	public String recipeListView() {
		
		return "recipeList";
	}
	

	@RequestMapping("write.re")
	public String recipeWriteView() {
		
		return "recipeWrite";
	}
	

	@RequestMapping("tip.tip")
	public String tipListView() {
		
		return "tipList";
	}
	

	@RequestMapping("write.tip")
	public String tipWriteView() {
		
		return "tipWrite";
	}

	
	
	
	
	
	

	@RequestMapping("random.re")
	public String randomView() {
		
		return "randomMenu";
	}


	@RequestMapping(value="randomChoice.re", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String randomChoice(@RequestParam("form") String form) {

		ModelAndView mav = new ModelAndView ();
		if(form != null && !form.isEmpty()) {
			String[] splitAnq = form.split("&"); // 배열 : nation=cn, nation=jp,
			
			ArrayList<String> nation = new ArrayList<String>();
			ArrayList<String> difficulty = new ArrayList<String>();
			for(String elem : splitAnq) {
				String[] splitEq = elem.split("=");
				if(splitEq[0].equals("nation")) {
					nation.add(splitEq[1]);
				} else {
					difficulty.add(splitEq[1]);
				}
			}
			
		
			HashMap<String, Object> key = new HashMap<String, Object>();
			key.put("nation", nation);
			key.put("difficulty", difficulty);
							
			ArrayList<RandomRecipe> ra = bService.randomChoice(key);
			
				
			Random random = new Random();			
			int num = random.nextInt(ra.size());	
				
			RandomRecipe randomRecipe = ra.get(num);	
					
			JSONObject json = new JSONObject();
			json.put("boardNo", randomRecipe.getBoardNo());
			json.put("title", randomRecipe.getTitle());
			json.put("recipeNo", randomRecipe.getRecipeNo());
			json.put("imageNo", randomRecipe.getImageNo());
			json.put("imageURL", randomRecipe.getImageURL());
			json.put("imageName", randomRecipe.getImageName());
			json.put("titleImg", randomRecipe.getTitleImg());

			return json.toString();
				
					
		}else {
			return "0";
		}
		
	}


	@RequestMapping(value="insertReply.bo", produces="application/json; charset=UTF-8")
	@ResponseBody	
	public String insertReply(@RequestParam("boardNo") int boardNo, @RequestParam("rpWriter") String writer, @RequestParam("rpContent") String content) {
		
		Reply rp = new Reply();
		rp.setBoardNo(boardNo);
		rp.setWriter(writer);
		rp.setContent(content);
		
		int result = bService.insertReply(rp);
		
		rp = bService.selectReply(rp);
		
		if(result > 0) {
			JSONObject json = new JSONObject();
			
			json.put("replyNo", rp.getReplyNo());
			json.put("content", rp.getContent());
			json.put("writer", rp.getWriter());
			json.put("updateDate", rp.getUpdateDate());
			

			return json.toString();			
		}else {
			throw new AllException("댓글을 등록하지 못했습니다");
		}
		
	}
	
	@RequestMapping(value="deleteReply.bo", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String deleteReply(@RequestParam("replyNo") int replyNo) {
		
		int result = bService.deleteReply(replyNo);
		
		if(result > 0 ) {
			return "0";
		}else {
			throw new AllException("댓글을 삭제하지 못했습니다");
		}
	}
	
	@RequestMapping(value="updateReply.bo", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String updateReply(@RequestParam("replyNo") int replyNo, @RequestParam("content") String content) {
		Reply rp = new Reply();
		rp.setReplyNo(replyNo);
		rp.setContent(content);
		System.out.println(rp);
		
		
		int result = bService.updateReply(rp);
		
		if(result > 0 ) {
			JSONObject json = new JSONObject();
			json.put("content", rp.getContent());
						
			System.out.println("json" + json);
			return json.toString();
		}else {
			throw new AllException("댓글을 수정하지 못했습니다");
		}
	}
	
	
	



















	
}
