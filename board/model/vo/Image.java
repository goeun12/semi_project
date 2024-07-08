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
public class Image {
	private int imageNo;
	private int recipeNo;
	private String imageUrl;
	private String imageName;
	private int titleImg;
}
