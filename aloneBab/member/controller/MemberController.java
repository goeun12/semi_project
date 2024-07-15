package com.project.aloneBab.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;
import com.project.aloneBab.board.model.vo.Board;
import com.project.aloneBab.common.AllException;
import com.project.aloneBab.common.PageInfo;
import com.project.aloneBab.common.Pagination;
import com.project.aloneBab.member.model.exception.MemberException;
import com.project.aloneBab.member.model.service.MemberService;
import com.project.aloneBab.member.model.vo.Member;

@Controller
@SessionAttributes("loginUser")
public class MemberController {
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("admin.user")
	public String adminView(@RequestParam(value="check", defaultValue="total") String check, Model model) {
			
		ArrayList<Member> mList = null;
		
		if(check.equals("total")) {
			mList = mService.selectMemberList(null);
		} else {
			mList = mService.selectMemberList(check);
		}
		
		model.addAttribute("check", check);
		model.addAttribute("userList", mList);	
		
		return "adminPage";
	}
	
	@RequestMapping("searchUser.user")
	public String searchUser(@RequestParam("search") String search,
							 Model model) {
		
		ArrayList<Member> userList = mService.selectSearchMember(search);
		
		model.addAttribute("userList", userList);
		
		return "adminPage";
	}
	
	@RequestMapping("adminUpdateStatus.user")
	@ResponseBody
	public String adminUpdateStatus(@ModelAttribute Member m) {
		int result = mService.updateAdminStatus(m);
		
		return result == 1 ? "success" : "fail";
	}
	
	// 로그인 화면으로 이동
	@RequestMapping("loginView.user")
	public String loginView(Model model) {
		
		return "login_user";
	}
	
	// 로그인 과정
	@RequestMapping("login.user")
	public String login(@ModelAttribute Member m,
						@RequestParam("change") String change,
						Model model,
						HttpSession session) {
		Member loginUser = mService.login(m);
		
		if(loginUser != null) {
			if(bcrypt.matches(m.getPwd(), loginUser.getPwd())) {
				session.setAttribute("loginUser", loginUser);
				
				if(change.equals("Y")) {
					return "redirect:edit.user";	// 회원 정보 수정 페이지로 가기
				} else {
					if(loginUser.getIsAdmin().equals("N")) {
						return "redirect:recipe.re";	// 레시피 리스트로 가기
					} else {
						return "redirect:admin.user";	// 관리자 페이지
					}
				}
			} else {
				throw new MemberException("로그인에 실패하였습니다.");
			}
		} else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
	}
	
	// 로그아웃
	@RequestMapping("logout.user")
	public String logout(SessionStatus session) {
		session.setComplete();
		
		return "redirect:loginView.user";
	}

	// 회원가입 화면으로 이동
	@RequestMapping("joinView.user")
	public String joinView() {
		
		return "join_account";
	}
	
	// 아이디 중복확인
	@RequestMapping("checkId.user")
	@ResponseBody
	public int checkId(@RequestParam("id") String id) {
		return mService.checkId(id);
	}
	
	
	// 회원가입 과정
	@RequestMapping("joinMember.user")
	public String joinMember(@ModelAttribute Member m) {
		m.setPwd(bcrypt.encode(m.getPwd()));
		m.setIsAdmin("N");
		int result = mService.joinMember(m);
		if(result > 0) {
			return "redirect:loginView.user";
		}else {
			throw new AllException("회원가입에 실패하였습니다.");
		}
	}
	
	// 회원정보 수정 화면으로 이동
	@RequestMapping("edit.user")
	public String editView(Model model) {
		return "modify_account";
	}

	// 회원정보 수정 기능
	@RequestMapping("/modify.user")
	public String updateMember(@ModelAttribute Member m, HttpSession session, Model model) {
		if(m.getPwd().equals("")) {
			m.setPwd(((Member)session.getAttribute("loginUser")).getPwd());
		} else {
			m.setPwd(bcrypt.encode(m.getPwd()));
		}
		if(m.getAddress().equals("")) {
			m.setAddress(((Member)session.getAttribute("loginUser")).getAddress());
		}
		int result = mService.updateMember(m);
		if(result > 0) {
			model.addAttribute("loginUser", mService.login(m));
			return "../home";
		} else {
			throw new AllException("회원정보 수정에 실패하였습니다.");
		}
	}

	// 회원 탈퇴 기능
	@RequestMapping("delete.user")
	public String deleteMember(@RequestParam("id") String id) {
		int result = mService.deleteMember(id);
		if(result > 0) {
			return "redirect:logout.user";
		} else {
			throw new AllException("회원 탈퇴에 실패하였습니다.");
		}
	}
	
	// 관리자 회원가입 페이지 이동
	@RequestMapping("joinAdmin.user")
	public String joinAdmin() {
		return "join_admin";
	}
	
	// 관리자 회원가입 기능
	@RequestMapping("signUpAdmin.user")
	public String joinAdmin(@ModelAttribute Member m) {
		m.setPwd(bcrypt.encode(m.getPwd()));
		m.setIsAdmin("Y");
		int result = mService.joinMember(m);
		if(result > 0) {
			return "../home";
		} else {
			throw new AllException("관리자 회원가입에 실패하였습니다.");
		}
	}
	
	// 아이디/비밀번호 찾기 화면으로 이동
	@RequestMapping("findInfo.user")
	public String findInfoView() {
		
		return "id_find";
	}
	
	// 아이디 찾기 화면으로 이동
	@RequestMapping("findIdView.user")
	public String findIdView() {
		
		return "id_find";
	}	
	
	// 아이디 찾기 과정		-> Ajax 활용?
	@RequestMapping("findId.user")
	@ResponseBody
	public void findId(@ModelAttribute Member m,
					   HttpServletResponse response) {
		Member user = mService.findId(m);
		
		Gson gson = new Gson();
		response.setContentType("application/json; charset=UTF-8");
		try {
			gson.toJson(user, response.getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 비밀번호 찾기 화면으로 이동
	@RequestMapping("findPwView.user")
	public String findPwView() {
		
		return "pw_find";
	}
	
	// 비밀번호 찾기 과정		-> Ajax 활용?
	@RequestMapping("findPw.user")
	@ResponseBody
	public void findPw(@ModelAttribute Member m,
					   HttpServletResponse response) {
		Member user = mService.findPw(m);
		
		if(user != null) {
			int num = (int)(Math.random() * 1000000);
			String rowPwd = String.valueOf(num);
			
			while(rowPwd.length() != 6) {
				rowPwd += "0";
			}
			
			String pwd = bcrypt.encode(rowPwd);
			Member member = new Member();
			member.setId(user.getId());
			member.setPwd(pwd);
			
			mService.updatePwd(member);
			
			user.setPwd(rowPwd);
		}
		
		Gson gson = new Gson();
		response.setContentType("application/json; charset=UTF-8");
		try {
			gson.toJson(user, response.getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	// 회원이 작성한 게시글 목록 화면으로 이동
	@RequestMapping("write.user")
	public String writePageView(@RequestParam(value="page", defaultValue="1") int currentPage,
							  	HttpSession session,
								Model model) {
		String id = ((Member)session.getAttribute("loginUser")).getId();
		int listCount = mService.getListCount(id);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> list = mService.selectBoardList(pi, id);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("page", currentPage);
			
			return "myWritePage";
		} else {
			throw new MemberException("나의 글 조회를 실패했습니다.");
		}
				
	}
	
	@RequestMapping("privacy.com")
	public String privacy() {
		return "privacy";
	}
}
