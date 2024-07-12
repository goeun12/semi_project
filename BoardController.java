package com.project.aloneBab.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.aloneBab.board.model.service.BoardService;
import com.project.aloneBab.board.model.vo.Board;
import com.project.aloneBab.board.model.vo.DivideSearch;
import com.project.aloneBab.board.model.vo.Image;
import com.project.aloneBab.board.model.vo.PageInfo;
import com.project.aloneBab.board.model.vo.Recipe;
import com.project.aloneBab.common.Pagination;
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
//		System.out.println(bList);
		ArrayList<Recipe> rList = bService.selectRecipeList(null);
		// null 넘기면 : 전체 조회(레시피 다가져옴)
//		System.out.println(rList);
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
//		System.out.println(iList);
		
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
	public String bunryuRecipe(@RequestParam(value="nation", required=false) String nation, @RequestParam(value="difficulty", required=false) String diffi, @RequestParam(value="searchWord", required=false) String find, Model model) {
//	public String bunryuRecipe(@ModelAttribute DivideSearch ds, Model model) {
//		if(ds.getSearchWord().trim() == null && ds.getNation().equals("all") && ds.getDifficulty().equals("all")) { // 아무것도 안하고 검색 눌렀음
//			return "recipeList"; // 돌려보냄
		if(diffi==null && find == null) {
			diffi = "all";
			find = "";
		}
		System.out.println(diffi);
		System.out.println(find);
		if(find.trim().isEmpty() && nation.equals("all") && diffi.equals("all")) {
			System.out.println("검색어 없고 전체 국가 난이도 없슴");
			return "recipeList";
		} else { // 무언가 검색어를 썼거나, 나라를 선택했거나, 난이도를 선택했음 
			DivideSearch ds = new DivideSearch();
			ds.setDifficulty(diffi);
			ds.setNation(nation);
			ds.setSearchWord(find);
			int listCount1 = bService.getDivideCount(ds); // 단어, 나라, 난이도로 분류한 갯수
			PageInfo pi = Pagination.getPageInfo(1, listCount1, 12);
			
			ArrayList<Board> bList = bService.selectDivideBoardList(pi,ds); // 페이지인포랑 분류한거로 보드리스트 가져오기
//			ArrayList<Recipe> rList = bService.selectDivideRecipeList(ds);
			ArrayList<Recipe> rList = bService.selectRecipeList(null); // 리스트화면에서 보드넘버랑 비교해서 할거라서 걍 다 가져옴
//			ArrayList<Image> iList = bService.selectDivdeImageList(ds);  
			// bId = recipeNo 랑 recipeNo = recipeNo 끼리 맞출꺼라 다 가져 와도 될듯함			
			ArrayList<Image> iList = bService.selectImageList(null); // 리스트 화면에서 레시피넘버랑 비교해서 할거라 다 가져옴
			
			String nothing = null;
			
			if(bList != null) {
				model.addAttribute("pi", pi);
				model.addAttribute("bList", bList);
				model.addAttribute("rList", rList);
				model.addAttribute("iList", iList);
				return "recipeList";
			}else { // 보드리스트가 비었다 = 분류에 맞는게 하나도 없다 = 띄울게 없다
				model.addAttribute("nothing", nothing);
				return "recipeList";
			}
		
		}
	}
	
	
	// 레시피 상세 보기
	@RequestMapping("recipeContent.re")
	public String recipeContentView(@RequestParam("bNo") int bNo, @RequestParam("page") int page, @RequestParam("rNo") int rNo,  HttpSession session, Model model) {
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
				Collections.shuffle(bList);
				
				model.addAttribute("b",b);
				model.addAttribute("r",r);
				model.addAttribute("iList", iList);
				model.addAttribute("contents", contents);
				model.addAttribute("rList", rList);
				model.addAttribute("iListAll", iListAll);
				model.addAttribute("bList", bList);
				
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
				System.out.println("보컨 136"); // 뭔가 에러 아무튼 돌려보내면 됨
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
			// 이미지가 없다는 뜻
			// 이미지 안넣냐고 물어보기
			System.out.println("이미지 리스트 없음");
		} else {
			result1 = bService.insertBoard(b); // 게시판에 넣는 서비스 성공시 1
			if(result1>0) {
				int rResult = bService.insertRecipe(recipe);
				if(rResult>0) {
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
		if(result1 + result2 == 1 + iList.size()) { // 잘 들어갔다는 뜻
//			if(result2 == 0) { // 이미지가 없다는 뜻, 우린 이미지 없으면 작성 불가능
//				return "redirect:";
//			} else {
//			}
			
			return "redirect:recipe.re";
		} else { // 에러가 나서 레시피 작성에 실패한 경우
			for(Image i : iList) {
				deleteFile(i.getImageName(), req);
			}
			return "redirect:index.jsp";
		}
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
	
	
	
	
	
	// 꿀팁 목록 페이지 이동
	@RequestMapping("tip.tip")
	public String tipListView() {
		
		return "tipList";
	}
	
	// 꿀팁 작성 페이지 이동
	@RequestMapping("write.tip")
	public String tipWriteView() {
		
		return "tipWrite";
	}
	
	
	// 랜덤메뉴 페이지 이동
	@RequestMapping("random.re")
	public String randomView() {
		
		return "randomMenu";
	}
	
	// 공지사항 목록 페이지 이동
	@RequestMapping("notice.no")
	public String noticeListView() {
		
		return "noticeList";
	}
	
	// 공지사항 작성 페이지 이동
	@RequestMapping("write.no")
	public String noticeWriteView() {
		
		return "noticeWrite";
	}
	
	// 공지사항 수정
	@RequestMapping("edit.no")
	public String noticeEdit() {
		
		return null;
	}
	
	
	
}
