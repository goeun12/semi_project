package com.project.aloneBab.board.model.vo;

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
	private int imageNo;
	private String imageURL;
	private String imageName;
	private int titleImg;
	
	
	
}