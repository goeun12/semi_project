package com.project.aloneBab.board.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Reply {
	private int replyNo;
	private String writer;
	private int boardNo;
	private String content;
	private Date createDate;
	private Date updateDate;
	private String status;
}