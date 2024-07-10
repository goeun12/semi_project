package com.project.aloneBab.board.model.vo;

import org.springframework.security.access.annotation.Secured;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class RandomRecipe {
	private int boardNo;
	private int title;
	private int recipeNo;
	private int imgNo;
	private String imageURL;
	private String imageName;
	private int titleImg;
	
	
	
}
