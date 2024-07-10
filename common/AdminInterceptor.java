package com.project.aloneBab.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.project.aloneBab.member.model.vo.Member;

public class AdminInterceptor implements HandlerInterceptor{

	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		
//		HttpSession session = request.getSession();		
//		Member loginUser = (Member)session.getAttribute("loginUser");
//		
//		if(loginUser.getIsAdmin().equals("N")) {
//			throw new AllException("해당 메뉴에 대한 접근 권한이 없습니다. 해당 메뉴는 관리자만 이용할 수 있습니다.");
//		}
//		
//		
//		return HandlerInterceptor.super.preHandle(request, response, handler);
//	}
	
	
	
	
	
}