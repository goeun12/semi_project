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

		@RequestMapping("randomChoice.re")
		public String randomChoice(@RequestParam("nation") String[] nation, @RequestParam("difficulty") String[] difficulty, Model model) {
					
		HashMap<String, Object> key = new HashMap<String, Object>();
		key.put("nation", nation);
		key.put("difficulty", difficulty);
						
		ArrayList<RandomRecipe> ra = bService.randomChoice(key);
		
		Random random = new Random();			
		int num = random.nextInt(ra.size() + 1);	
			
		RandomRecipe randomRecipe = ra.get(num);	
			
		model.addAttribute(randomRecipe);
						
		return "randomMenu";
		}
		
		
		
		@RequestMapping("randomContent.re")
		public String randomContent() {
			
			return "randomMenu";
		}


}
