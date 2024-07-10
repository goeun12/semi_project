package com.project.aloneBab.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.aloneBab.board.model.vo.Board;
import com.project.aloneBab.board.model.vo.DivideSearch;
import com.project.aloneBab.board.model.vo.Image;
import com.project.aloneBab.board.model.vo.RandomRecipe;
import com.project.aloneBab.board.model.vo.Recipe;
import com.project.aloneBab.common.PageInfo;

@Repository("bDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession, String i) {
		return sqlSession.selectOne("recipe-mapper.getListCount", i);
	}

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, String i) {
		RowBounds rb = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("recipe-mapper.selectBoardList", i, rb);
	}

	public ArrayList<Recipe> selectRecipeList(SqlSessionTemplate sqlSession, Integer bId) {
		return (ArrayList)sqlSession.selectList("recipe-mapper.selectRecipeList", bId);
	}

	public ArrayList<Image> selectImageList(SqlSessionTemplate sqlSession, Integer rId) {
		return (ArrayList)sqlSession.selectList("recipe-mapper.selectImageList", rId);
	}

	public int updateCount(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("recipe-mapper.updateCount", bId);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("recipe-mapper.selectBoard", bId);
	}

	public int insertImage(SqlSessionTemplate sqlSession, ArrayList<Image> iList) {
		return sqlSession.insert("recipe-mapper.insertImage", iList);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("recipe-mapper.deleteRecipe", bId);
	}

	public int getDivideCount(SqlSessionTemplate sqlSession, DivideSearch ds) {
		return sqlSession.selectOne("recipe-mapper.getDivideCount", ds);
	}

	public ArrayList<Board> selectDivideBoardList(SqlSessionTemplate sqlSession, PageInfo pi, DivideSearch ds) {
		RowBounds rb = new RowBounds((pi.getCurrentPage()-1)*pi.getBoardLimit(), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("recipe-mapper.selectDivideBoardList", ds, rb);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("recipe-mapper.insertBoard", b);
	}

	public int insertRecipe(SqlSessionTemplate sqlSession, Recipe recipe) {
		return sqlSession.insert("recipe-mapper.insertRecipe", recipe);
	}

	public ArrayList<Board> selectRecommendBoardList(SqlSessionTemplate sqlSession, String nation) {
		return (ArrayList)sqlSession.selectList("recipe-mapper.selectRecommendBoardList", nation);
	}

//	public ArrayList<Recipe> selectDivideRecipeList(SqlSessionTemplate sqlSession, DivideSearch ds) {
//		return (ArrayList)sqlSession.selectList("recipe-mapper.selectDivideRecipeList", ds);
//	}
//
//	public ArrayList<Image> selectDivdeImageList(SqlSessionTemplate sqlSession, DivideSearch ds) {
//		return (ArrayList)sqlSession.selectList("recipe-mapper.selectDivdeImageList", ds);
//	}

	public Board selectMyBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectMyBoard", boardNo);
	}

	public Recipe selectRecipe(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectRecipe", boardNo);
	}

	public ArrayList<Image> selectImage(SqlSessionTemplate sqlSession, int recipeNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectImage", recipeNo);
	}
	
	public ArrayList<RandomRecipe> randomChoice(SqlSessionTemplate sqlSession, HashMap<String, Object> key) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.randomChoice", key);
	}

}