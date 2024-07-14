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

}
