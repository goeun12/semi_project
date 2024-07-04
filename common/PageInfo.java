package com.project.aloneBab.common;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class PageInfo {
	
	
	private int currentPage;
	private int listCount;
	private int pageLimite;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int boardLimite;
	
	
	public static PageInfo getPagination(int currentPage, int listCount) {
			
			int pageLimite = 5;
			int boardLimite = 10;
			
			int maxPage = (int)Math.ceil((double)listCount/boardLimite);
			int startPage = ((currentPage-1)/pageLimite)*pageLimite + 1;
			int endPage = startPage + pageLimite -1;
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount, pageLimite, maxPage, startPage, endPage, boardLimite);
			
			return pi;			
			
	}

}
