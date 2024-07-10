package com.project.aloneBab.notice.model.vo;

import java.sql.Date;

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
public class Notice {
	
	private int boardNo;
	private String boardGenre;
	private String writer;
	private String title;
	private String content;
	private Date createDate;
	private Date updateDate;
	private char status;
	private int count;

	
}