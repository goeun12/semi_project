package com.project.aloneBab.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.aloneBab.board.model.dao.BoardDAO;
import com.project.aloneBab.board.model.vo.Board;
import com.project.aloneBab.board.model.vo.Image;
import com.project.aloneBab.board.model.vo.Recipe;

@Service("bService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bDAO;
	
	@Override
	public Board selectMyBoard(int boardNo) {
		return bDAO.selectMyBoard(sqlSession, boardNo);
	}
	
	@Override
	public Recipe selectRecipe(int boardNo) {
		return bDAO.selectRecipe(sqlSession, boardNo);
	}
	
	@Override
	public ArrayList<Image> selectImage(int recipeNo) {
		return bDAO.selectImage(sqlSession, recipeNo);
	}
}
