package com.project.aloneBab.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Image {
	private int imgNo;
	private int recipeNo;
	private String imageURL;
	private String imageName;
	private int titleImg;
	// imgStatus 는 없음
}
