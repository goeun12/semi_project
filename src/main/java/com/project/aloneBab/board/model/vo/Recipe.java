package com.project.aloneBab.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Recipe {
	private int recipeNo;
	private int boardNo;
	private String intro;
	private String nation;
	private String difficulty;
	private String ingredients;
}
