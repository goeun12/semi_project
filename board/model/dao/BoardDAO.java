package com.project.aloneBab.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.aloneBab.board.model.vo.Board;
import com.project.aloneBab.board.model.vo.Image;
import com.project.aloneBab.board.model.vo.Recipe;

@Repository("bDAO")
public class BoardDAO {

	public Board selectMyBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectMyBoard", boardNo);
	}

	public Recipe selectRecipe(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectRecipe", boardNo);
	}

	public ArrayList<Image> selectImage(SqlSessionTemplate sqlSession, int recipeNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectImage", recipeNo);
	}

}
