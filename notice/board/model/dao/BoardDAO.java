package com.project.aloneBab.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.aloneBab.board.model.vo.RandomRecipe;

@Repository
public class BoardDAO {

	public ArrayList<RandomRecipe> randomChoice(SqlSessionTemplate sqlSession, HashMap<String, Object> key) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.randomChoice", key);
	}

	

}
