package com.project.aloneBab.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.aloneBab.board.model.dao.BoardDAO;
import com.project.aloneBab.board.model.vo.Board;
import com.project.aloneBab.board.model.vo.DivideSearch;
import com.project.aloneBab.board.model.vo.Image;
import com.project.aloneBab.board.model.vo.PageInfo;
import com.project.aloneBab.board.model.vo.Recipe;


@Service("bService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bDAO;

	@Override
	public int getListCount(String i) {
		return bDAO.getListCount(sqlSession, i);
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi, String i) {
		return bDAO.selectBoardList(sqlSession, pi, i);
	}

	@Override
	public ArrayList<Recipe> selectRecipeList(Integer bId) {
		return bDAO.selectRecipeList(sqlSession, bId);
	}

	@Override
	public ArrayList<Image> selectImageList(Integer rId) {
		return bDAO.selectImageList(sqlSession, rId);
	}

	@Override
	public Board selectBoard(int bId, String id) {
		Board b = bDAO.selectBoard(sqlSession, bId);
		if(b != null) {
			if(id != null && !b.getWriter().equals(id)) {// 로그인 유저가 있으며, 작성자와 로그인유저가 같다면
				int result = bDAO.updateCount(sqlSession, bId);
				if(result>0) {
					b.setBoardCount(b.getBoardCount()+1);
				}
			}
		}
		return b;
	}

	@Override
	public int insertImage(ArrayList<Image> iList) {
		return bDAO.insertImage(sqlSession, iList);
	}

	@Override
	public int deleteBoard(int bId) {
		return bDAO.deleteBoard(sqlSession, bId);
	}

	@Override
	public int getDivideCount(DivideSearch ds) {
		return bDAO.getDivideCount(sqlSession, ds);
	}

	@Override
	public ArrayList<Board> selectDivideBoardList(PageInfo pi, DivideSearch ds) {
		return bDAO.selectDivideBoardList(sqlSession,pi,ds);
	}

	@Override
	public int insertBoard(Board b) {
		return bDAO.insertBoard(sqlSession, b);
	}

	@Override
	public int insertRecipe(Recipe recipe) {
		return bDAO.insertRecipe(sqlSession, recipe);
	}

	@Override
	public ArrayList<Board> selectRecommendBoardList(String nation) {
		return bDAO.selectRecommendBoardList(sqlSession, nation);
	}

//	@Override
//	public ArrayList<Recipe> selectDivideRecipeList(DivideSearch ds) {
//		return bDAO.selectDivideRecipeList(sqlSession,ds);
//	}
//
//	@Override
//	public ArrayList<Image> selectDivdeImageList(DivideSearch ds) {
//		return bDAO.selectDivdeImageList(sqlSession,ds);
//	}

	
}
