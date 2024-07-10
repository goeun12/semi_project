package com.project.aloneBab.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.aloneBab.board.model.dao.BoardDAO;
import com.project.aloneBab.board.model.vo.RandomRecipe;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bDAO;

	@Override
	public ArrayList<RandomRecipe> randomChoice(HashMap<String, Object> key) {
		// TODO Auto-generated method stub
		return bDAO.randomChoice(sqlSession, key);
	}


	
	
	
	
	

}
