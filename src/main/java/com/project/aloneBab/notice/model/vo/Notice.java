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
	
	public int boardNo;
	public String boardGenre;
	public String writer;
	public String title;
	public String content;
	public Date createDate;
	public Date updateDate;
	public char status;
	public int count;

	
}