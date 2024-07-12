package com.project.aloneBab.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	private String name;
	private String id;
	private String pwd;
	private String phone;
	private String address;
	private String isAdmin;
	private String status;
	private Date joinDate;
}
