package com.project.aloneBab.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.aloneBab.board.model.service.BoardService;
import com.project.aloneBab.board.model.vo.Board;
import com.project.aloneBab.board.model.vo.DivideSearch;
import com.project.aloneBab.board.model.vo.Image;
import com.project.aloneBab.board.model.vo.RandomRecipe;
import com.project.aloneBab.board.model.vo.Recipe;
import com.project.aloneBab.board.model.vo.Reply;
import com.project.aloneBab.common.AllException;
import com.project.aloneBab.common.PageInfo;
import com.project.aloneBab.common.Pagination;
import com.project.aloneBab.member.model.exception.MemberException;
import com.project.aloneBab.member.model.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	// 레시피 목록 페이지 이동
		@RequestMapping("recipe.re")
		public String recipeListView(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
			int listCount = bService.getListCount("레시피");
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 12);
			
			ArrayList<Board> bList = bService.selectBoardList(pi, "레시피");
			
			ArrayList<Recipe> rList = bService.selectRecipeList(null);
			// null 넘기면 : 전체 조회(레시피 다가져옴)
			ArrayList<Image> iList = bService.selectImageList(null);
			if(bList != null) {
				// bList 가 들어있을 때 : iList 다 비교해봤을 때 레시피 넘버랑 하나도 맞는게 없다면 해당 boardNo 보드 삭제
				// b & r 은 1대1 관계
				if(rList != null) {
					for(Recipe r : rList) {
						int count = 0;
						
						for(Image i : iList) {
							if(r.getRecipeNo() == i.getRecipeNo()) {
								count = count+1;
							}
						}
						
						if(count==0) {
							bService.deleteBoard(r.getBoardNo());
						}
						
					}
					bList = bService.selectBoardList(pi, "레시피");
				}
			}else {
				
			}
			// null 넘기면 : 전체 조회(썸네일[image_level = 0] 가져옴)
			
			// 아직 테스트는 안해봄. 이론상 됨
			
			if(bList != null) {
				model.addAttribute("pi", pi);
				model.addAttribute("bList", bList);
				model.addAttribute("rList", rList);
				model.addAttribute("iList", iList);
				return "recipeList";
			} else {
				return "recipeList";
			}
		}
		
		// 레시피 분류한것들 조회
		@RequestMapping("searchRecipe.re")
		public String bunryuRecipe(@RequestParam(value="nation", defaultValue="all") String nation,
								   @RequestParam(value="difficulty", defaultValue="all") String diffi, 
								   @RequestParam(value="searchWord", defaultValue="") String find, 
								   @RequestParam(value="page", defaultValue="1") int currentPage,
								   Model model) {
//		public String bunryuRecipe(@ModelAttribute DivideSearch ds, Model model) {
//			if(ds.getSearchWord().trim() == null && ds.getNation().equals("all") && ds.getDifficulty().equals("all")) { // 아무것도 안하고 검색 눌렀음
//				return "recipeList"; // 돌려보냄

			if(find.trim().isEmpty() && nation.equals("all") && diffi.equals("all")) {
				return "recipeList";
			} else { // 무언가 검색어를 썼거나, 나라를 선택했거나, 난이도를 선택했음 
				DivideSearch ds = new DivideSearch();
				ds.setDifficulty(diffi);
				ds.setNation(nation);
				ds.setSearchWord(find);
				int listCount1 = bService.getDivideCount(ds); // 단어, 나라, 난이도로 분류한 갯수
				PageInfo pi = Pagination.getPageInfo(currentPage, listCount1, 12);
				
				ArrayList<Board> bList = bService.selectDivideBoardList(pi,ds); // 페이지인포랑 분류한거로 보드리스트 가져오기
//				ArrayList<Recipe> rList = bService.selectDivideRecipeList(ds);
				ArrayList<Recipe> rList = bService.selectRecipeList(null); // 리스트화면에서 보드넘버랑 비교해서 할거라서 걍 다 가져옴
//				ArrayList<Image> iList = bService.selectDivdeImageList(ds);  
				// bId = recipeNo 랑 recipeNo = recipeNo 끼리 맞출꺼라 다 가져 와도 될듯함			
				ArrayList<Image> iList = bService.selectImageList(null); // 리스트 화면에서 레시피넘버랑 비교해서 할거라 다 가져옴
				
				String nothing = null;
				
				if(bList != null) {
					model.addAttribute("pi", pi);
					model.addAttribute("bList", bList);
					model.addAttribute("rList", rList);
					model.addAttribute("iList", iList);
					model.addAttribute("nation", nation);
					model.addAttribute("searchWord", find);
					model.addAttribute("difficulty", diffi);
					return "recipeList";
				}else { // 보드리스트가 비었다 = 분류에 맞는게 하나도 없다 = 띄울게 없다
					model.addAttribute("nothing", nothing);
					return "recipeList";
				}
			
			}
		}
		
		
		// 레시피 상세 보기
		@RequestMapping("recipeContent.re")
		public String recipeContentView(@RequestParam("bNo") int bNo, @RequestParam(value="page", defaultValue="1") int page, @RequestParam("rNo") int rNo, @RequestParam(value="myPage", defaultValue="") String myPage, HttpSession session, Model model) {
			//Member loginUser = (Member)session.getAttribute("loginUser");
			String id = null;
			if((Member)session.getAttribute("loginUser") != null) {
				id = ((Member)session.getAttribute("loginUser")).getId();
				
			} 
				
				Board b = bService.selectBoard(bNo, id);// bId 는 보드넘버, id 는 로그인유저 아이디
				ArrayList<Recipe> r = bService.selectRecipeList((Integer)bNo);// 선택한 레시피 가져오기
				ArrayList<Image> iList = bService.selectImageList((Integer)rNo);// 레시피번호로 이미지들 가져오기
				
				if(b != null) {
					String[] contents = b.getContent().split("§§●");
					ArrayList<Board> bList = bService.selectRecommendBoardList(r.get(0).getNation()); // 같은 국가의 요리들 목록
					ArrayList<Recipe> rList = bService.selectRecipeList(null); // 전체 레시피 리스트
					ArrayList<Image> iListAll = bService.selectImageList(null); // 썸네일 사진 목록
					ArrayList<Reply> rpList = bService.selectReplyList((Integer)bNo); // 선택 보드 넘버의 댓글 목록
					Collections.shuffle(bList);
					
					model.addAttribute("b",b);
					model.addAttribute("r",r);
					model.addAttribute("iList", iList);
					model.addAttribute("contents", contents);
					model.addAttribute("rList", rList);
					model.addAttribute("rpList", rpList);
					model.addAttribute("iListAll", iListAll);
					model.addAttribute("bList", bList);
					model.addAttribute("myPage", myPage);
					model.addAttribute("page", page);
					
					return "recipeContent";
				} else {
					return "에러페이지";
				}
			
		}
		
		// 레시피 작성 페이지 이동
		@RequestMapping("write.re")
		public String recipeWriteView() {
			return "recipeWrite";
		}
		
		// 레시피 작성 ( 보드, 레시피 저장 가능 )
		@RequestMapping("insertRecipe.re")
		public String insertRecipe(@RequestParam("title") String title, @RequestParam("content") String content, @ModelAttribute Recipe recipe, @RequestParam("file") ArrayList<MultipartFile> files, HttpServletRequest req) {
			String id = ((Member)req.getSession().getAttribute("loginUser")).getId();
			Board b = new Board();
			b.setWriter(id);
			b.setBoardGenre("레시피");
			b.setTitle(title);
			b.setContent(content);
			
			
			ArrayList<Image> iList = new ArrayList<Image>();
			for(int i = 0; i< files.size(); i++) {
				MultipartFile upload = files.get(i);
				if(upload.getOriginalFilename() != "") {
					String[] returnArr = saveFile(upload, req);
					
					Image img = new Image();
					img.setImageName(returnArr[1]);
					img.setImageURL(returnArr[0]);
					iList.add(img);
				} else {
				}
			}
			
			for(int i=0; i<iList.size(); i++) {
				Image img = iList.get(i);
				if(i==0) {
					img.setTitleImg(0);
				} else {
					img.setTitleImg(1);
				}
			}
			
			int result1 = 0;
			int result2 = 0;
			int result3 = 0;
			if(iList.isEmpty()) {
				// 이미지가 없다는 뜻
				// 이미지 안넣냐고 물어보기
			} else {
				result1 = bService.insertBoard(b); // 게시판에 넣는 서비스 성공시 1
				if(result1>0) {
					result3 = bService.insertRecipe(recipe);
					if(result3>0) {
						for(Image i : iList) {
							i.setRecipeNo(recipe.getRecipeNo());
						}
						result2 = bService.insertImage(iList); // 성공시 이미지 갯수만큼 n
					}else {
						return "에러페이지";
					}
				}else {
					return "에러페이지";
				}
			} // if(iList.isEmpty()) 문 탈출
			if(result1 == 1) { // 잘 들어갔다는 뜻
				if(result3 == 1) {
					if(result2 >0) {
						return "redirect:recipe.re";
					}
				}
			} else { // 에러가 나서 레시피 작성에 실패한 경우
				for(Image i : iList) {
					deleteFile(i.getImageName(), req);
				}
				return "에러페이지";
			}
			return "redirect:recipe.re";
		}
		
		// 이미지 저장 메소드
		public String[] saveFile(MultipartFile upload, HttpServletRequest req) {
			String savePath = req.getSession().getServletContext().getRealPath("resources") + "\\image";
			
			File folder = new File(savePath);
			if(!folder.exists()) folder.mkdirs(); // image 폴더 생성
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			int randomNo = (int)(Math.random()*100000);
			String originalFileName = upload.getOriginalFilename();
			String renameFileName = sdf.format(new Date()) + randomNo + originalFileName.substring(originalFileName.lastIndexOf("."));
			
			String renamePath = folder + "\\" + renameFileName;
			try {
				upload.transferTo(new File(renamePath));
			} catch (Exception e) {
				System.out.println("파일 전송 실패" + e.getMessage()); // throw exception
			}
			String[] returnArr = new String[2];
			returnArr[0] = savePath;
			returnArr[1] = renameFileName;
			
			return returnArr;
		}
		
		// 글 쓰다가 에러가 났을 경우 입력하던 이미지 삭제
		public void deleteFile(String fileName, HttpServletRequest req) {
			String savePath = req.getSession().getServletContext().getRealPath("resources") + "\\image";
			
			File f = new File(savePath + "\\" + fileName);
			if(f.exists()) {
				f.delete();
			}
		}
		
		@RequestMapping("updateRecipe.re") // 수정페이지 들어가기
		public String updateRecipe(@RequestParam("bNumber") int bNo, @RequestParam("rNumber") int rNo, Model model) {
			Board b = bService.selectBoard(bNo, null);// bId 는 보드넘버, id 는 로그인유저 아이디
			ArrayList<Recipe> r = bService.selectRecipeList((Integer)bNo);// 선택한 레시피 가져오기
			ArrayList<Image> iList = bService.selectImageList((Integer)rNo);// 레시피번호로 이미지들 가져오기
			
			if(b != null) {
				String[] contents = b.getContent().split("§§●");
				
				model.addAttribute("b",b);
				model.addAttribute("r",r);
				model.addAttribute("iList", iList);
				model.addAttribute("contents", contents);
				
				return "editRecipe";
			} else {
				return "에러페이지";
			}
		}
		
		@RequestMapping("editRecipe.re") // 수정한거 집어넣기
		public String editRecipe(@RequestParam("title") String title, @RequestParam("content") String content, @ModelAttribute Recipe recipe, @RequestParam("file") ArrayList<MultipartFile> files, HttpServletRequest req, Model model) {
			String id = ((Member)req.getSession().getAttribute("loginUser")).getId();
			Board b = new Board();
			b.setBoardNo(recipe.getBoardNo());
			b.setWriter(id);
			b.setBoardGenre("레시피");
			b.setTitle(title);
			b.setContent(content);
		
			ArrayList<Image> iList = new ArrayList<Image>();
			for(int i = 0; i< files.size(); i++) {
				MultipartFile upload = files.get(i);
				if(upload.getOriginalFilename() != "") {
					String[] returnArr = saveFile(upload, req);
					
					Image img = new Image();
					img.setRecipeNo(recipe.getRecipeNo());
					img.setImageName(returnArr[1]);
					img.setImageURL(returnArr[0]);
					iList.add(img);
				} else {
					return "에러페이지"; // 뭔가 에러 아무튼 돌려보내면 됨
				}
			}
			
			for(int i=0; i<iList.size(); i++) {
				Image img = iList.get(i);
				if(i==0) {
					img.setTitleImg(0);
				} else {
					img.setTitleImg(1);
				}
			}
			
			int result1 = 0;
			int result2 = 0;
			if(iList.isEmpty()) {
				// 이미지 하나라도 비어있으면 못 넘어오게 바꿈 = 여기 절대 못지나감
				return "redirect:recipeList.jsp";
			} else {
				result1 = bService.updateBoard(b); // 게시판에 넣는 서비스 성공시 1
				if(result1>0) {
					int rResult = bService.updateRecipe(recipe);
					if(rResult>0) {
						for(Image i : iList) {
							i.setRecipeNo(recipe.getRecipeNo());
						}
						bService.deleteImage(recipe.getRecipeNo()); // 기존 이미지 다 삭제
						result2 = bService.editImage(iList); // 성공시 이미지 갯수만큼 n
					}else {
						return "에러페이지";
					}
				}else {
					return "에러페이지";
				}
				
				// return 없음 313줄
			} // if(iList.isEmpty()) 문 탈출
			if(result1 + result2 == 1 + iList.size()) { // 잘 들어갔다는 뜻
				Board b2 = bService.selectBoard(recipe.getBoardNo(), id);// bId 는 보드넘버, id 는 로그인유저 아이디
				ArrayList<Recipe> r = bService.selectRecipeList(recipe.getBoardNo());// 선택한 레시피 가져오기
				ArrayList<Image> iList2 = bService.selectImageList(recipe.getRecipeNo());// 레시피번호로 이미지들 가져오기
				
				if(b != null) {
					String[] contents = b.getContent().split("§§●");
					ArrayList<Board> bList = bService.selectRecommendBoardList(r.get(0).getNation());
					ArrayList<Recipe> rList = bService.selectRecipeList(null);
					ArrayList<Image> iListAll = bService.selectImageList(null);
					
					model.addAttribute("b",b2);
					model.addAttribute("r",r);
					model.addAttribute("iList", iList2);
					model.addAttribute("contents", contents); // model addattribute 이거 하나 더 했떠니 오류 생김 + 110줄에 String[] 배열 만들고서 애드함
					model.addAttribute("rList", rList);
					model.addAttribute("iListAll", iListAll);
					model.addAttribute("bList", bList);
					
					return "recipeContent";
				}
			} else { // 에러가 나서 레시피 작성에 실패한 경우
				for(Image i : iList) {
					deleteFile(i.getImageName(), req);
				}
				return "redirect:index.jsp";
			}
			return "redirect:recipeList.jsp";
		}	
			
		@RequestMapping("deleteRecipe.re")
		public String delete(@RequestParam("bNumber") int bId) {
			int bResult = bService.deleteBoard(bId);
			if(bResult > 0) {
				return "redirect:recipe.re";
			} else {
				return "에러페이지";
			}
		}

	// 회원이 작성한 게시글 목록 화면으로 이동
	@RequestMapping("myBoardList.bo")
	public String writePageView(@RequestParam(value="page", defaultValue="1") int currentPage,
							  	HttpSession session,
								Model model) {
		String id = ((Member)session.getAttribute("loginUser")).getId();
		int listCount = bService.getMemberListCount(id);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> list = bService.selectMemberBoardList(pi, id);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("page", currentPage);
			
			return "myWritePage";
		} else {
			throw new MemberException("나의 글 조회를 실패했습니다.");
		}
				
	}
	
	// 내 글 화면에서 게시글로 넘어가는 과정
	@RequestMapping("selectMyBoard.bo")
	public String selectMyBoard(@RequestParam("boardNo") int boardNo,
								@RequestParam("page") int page,
								HttpSession session,
								Model model) {
		Board board = bService.selectMyBoard(boardNo);

		String genre = board.getBoardGenre();
		
		model.addAttribute("myPage", "Y");
		model.addAttribute("page", page);
		
		if(genre.equals("레시피")) {
			Recipe recipe = bService.selectRecipe(board.getBoardNo());
			
			model.addAttribute("bNo", boardNo);
			model.addAttribute("rNo", recipe.getRecipeNo());
			
			return "redirect:recipeContent.re";	// redirect로 상세조회 페이지 url넣기
		} else {
			if(genre.equals("꿀팁")) {
				model.addAttribute("board", board);
				return "redirect:detail.tip"; // redirect로 상세조회 페이지 url넣기
			} else {
				model.addAttribute("boardNo", board.getBoardNo());
				
				
				return "redirect:noticeSelect.no";
			}
		}
		
	}
	
	@RequestMapping("tipcomment.tip")
	public String tipcomment(@RequestParam(value="Page", defaultValue="1") int currentPage, Model model) {		

		
		int listCount = bService.getListCount(null);		

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<Reply> tipcomment = bService.tipcomment(pi);
		
		if(tipcomment != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("tipcomment", tipcomment);
			return "tipcomment";
		}else {
			throw new AllException();
		}
		
		
	}
	
	@RequestMapping(value="insertReply.bo", produces="application/json; charset=UTF-8")
	@ResponseBody	
	public String insertReply(@RequestParam("boardNo") int boardNo, @RequestParam("rpWriter") String writer, @RequestParam("rpContent") String content) {
		
		Reply rp = new Reply();
		rp.setBoardNo(boardNo);
		rp.setWriter(writer);
		rp.setContent(content);
		
		int result = bService.insertReply(rp);
		
		rp = bService.selectReply(rp);
		
		if(result > 0) {
			JSONObject json = new JSONObject();
			
			json.put("replyNo", rp.getReplyNo());
			json.put("content", rp.getContent());
			json.put("writer", rp.getWriter());
			json.put("updateDate", rp.getUpdateDate());
			

			return json.toString();			
		}else {
			throw new AllException("댓글을 등록하지 못했습니다");
		}
		
	}
	
	@RequestMapping(value="deleteReply.bo", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String deleteReply(@RequestParam("replyNo") int replyNo) {
		
		int result = bService.deleteReply(replyNo);
		
		if(result > 0 ) {
			return "0";
		}else {
			throw new AllException("댓글을 삭제하지 못했습니다");
		}
	}
	
	@RequestMapping(value="updateReply.bo", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String updateReply(@RequestParam("replyNo") int replyNo, @RequestParam("content") String content) {
		Reply rp = new Reply();
		rp.setReplyNo(replyNo);
		rp.setContent(content);
		
		int result = bService.updateReply(rp);
		
		if(result > 0 ) {
			JSONObject json = new JSONObject();
			json.put("content", rp.getContent());
						
			return json.toString();
		}else {
			throw new AllException("댓글을 수정하지 못했습니다");
		}
	}
	
	@RequestMapping("random.re")
	public String randomView() {
		
		return "randomMenu";
	}

	@RequestMapping(value="randomChoice.re", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String randomChoice(@RequestParam("form") String form) {

		if(form != null && !form.isEmpty()) {
			String[] splitAnq = form.split("&"); // 배열 : nation=cn, nation=jp,
			
			ArrayList<String> nation = new ArrayList<String>();
			ArrayList<String> difficulty = new ArrayList<String>();
			for(String elem : splitAnq) {
				String[] splitEq = elem.split("=");
				if(splitEq[0].equals("nation")) {
					nation.add(splitEq[1]);
				} else {
					difficulty.add(splitEq[1]);
				}
			}
			
		
			HashMap<String, Object> key = new HashMap<String, Object>();
			key.put("nation", nation);
			key.put("difficulty", difficulty);
							
			ArrayList<RandomRecipe> ra = bService.randomChoice(key);
			
			if(ra != null && !ra.isEmpty()) {
				Random random = new Random();			
				int num = random.nextInt(ra.size());	
					
				RandomRecipe randomRecipe = ra.get(num);	
						
				JSONObject json = new JSONObject();
				json.put("boardNo", randomRecipe.getBoardNo());
				json.put("title", randomRecipe.getTitle());
				json.put("recipeNo", randomRecipe.getRecipeNo());
				json.put("imageNo", randomRecipe.getImageNo());
				json.put("imageURL", randomRecipe.getImageURL());
				json.put("imageName", randomRecipe.getImageName());
				json.put("titleImg", randomRecipe.getTitleImg());

				return json.toString();
								
			} else {
				return "1";
			}
							
		}else {
			return "0";
		}
		
	}
	
	
	@RequestMapping("randomContent.re")
	public String randomContent() {
		
		return "randomMenu";
	}
	
	@RequestMapping("search.tip")
	public String searchTip(
	    @RequestParam(value = "page", defaultValue = "1") int currentPage,
	    @RequestParam(value = "searchType") String searchType,
	    @RequestParam(value = "honeyKeyword") String honeyKeyword,
	    Model model
	) {
	    // 게시판 분류 '꿀팁'에 대한 게시물 수 가져오기
	    int listCount = bService.getTipListCount("꿀팁");

	    // 검색 결과 가져오기
	    ArrayList<Board> result = bService.searchTip(searchType, honeyKeyword);
	    
	    // 페이지 정보 설정
	    PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
	    
	    // 검색 결과에 따라 페이지네이션이 적용된 게시물 리스트 가져오기
	    ArrayList<Board> list = bService.tipListView(pi, "꿀팁");

	    // 모델에 데이터 추가
	    if (!result.isEmpty()) {
	        model.addAttribute("list", list);
	        model.addAttribute("result", result);
	        model.addAttribute("searchType", searchType);
	        model.addAttribute("honeyKeyword", honeyKeyword);
	        model.addAttribute("pi", pi); // 페이지 정보 추가

	        return "tipSearch"; // 해당 뷰로 이동    
	    } else {
	        model.addAttribute("msg", "검색 결과가 없습니다.");
	        return "tipSearch"; // 뷰 이름이 동일하더라도 메시지를 전달
	    }
	}

	
	// 꿀팁 목록 페이지 이동
	@RequestMapping("tip.tip")
	public String tipListView(@RequestParam(value="page", defaultValue="1")int currentPage, Model model) {
		
		// 게시글 불러오고 숫자 셈
		int listCount = bService.getListCount("꿀팁");
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> list = bService.tipListView(pi, "꿀팁");
		
		if(list!=null) {
			model.addAttribute("list", list);
			model.addAttribute("pi",pi);
		
			return "tipList";
		} else {
			throw new AllException("게시글 조회 실패.");
		}
	}
	
	// 꿀팁 작성 insert
	@RequestMapping("insert.tip")
	public String insertTip (@ModelAttribute Board b, HttpSession session) {
		String writer = ((Member)session.getAttribute("loginUser")).getId();
		b.setWriter(writer);
		b.setBoardGenre("꿀팁");
		
		int result = bService.insertTip(b);

		if(result >0) {
			return "redirect:tip.tip";
		}else {
			throw new AllException("게시글 작성 실패했어요.");		
		}
	}
	
	//꿀팁 게시판 글 하나 선택
	@RequestMapping("detail.tip")
	public String selectTip(@RequestParam("bNo")int bNo, @RequestParam("page")int page, HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String id = null;
		if(loginUser != null) {
			id = loginUser.getId();
		}
		Board board = bService.selectTip(bNo, id);
		
		if(board != null) {
			model.addAttribute("b", board);
			model.addAttribute("page", page);
			return "tipContent";
		}else {
			throw new AllException("게시글 상세보기 실패.");		
		}
	}
	
	// 꿀팁 작성 페이지 이동
	@RequestMapping("write.tip")
	public String tipWriteView() {
		return "tipWrite";
	}
	
	//꿅수정폼
	@RequestMapping("updateForm.tip")
	public String updateForm(@RequestParam("bNo")int bNo, @RequestParam("page") int page, Model model) {
		Board b = bService.selectTip(bNo, null);
		model.addAttribute("b", b);
		model.addAttribute("page", page); 
		return "tipEdit";
	}
	
	
	// 꿀팁 수정
	@RequestMapping("update.tip")
	public String updateTip(@ModelAttribute Board b, @RequestParam("page") int page, Model model) {

		b.setBoardGenre("꿀팁");
	    
		int result = bService.updateTip(b);
		
		if(result>0) {
			model.addAttribute("bNo", b.getBoardNo());
			model.addAttribute("page", page);
			return "redirect:detail.tip"; 
			
		} else {
			throw new AllException("게시글 수정을 실패했어요.");
		}
	}
	
	// 꿀팁 삭제
	@RequestMapping("delete.tip")
	public String deleteTip(@RequestParam("bNo")int bNo) {
		int result = bService.deleteTip(bNo);
		if(result>0) {
			return "redirect:tip.tip";
		}else {
			throw new AllException("게시글 삭제를 실패했습니다.");
		}
		
	}
	
}
