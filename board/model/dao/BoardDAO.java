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

	public int insertReply(SqlSessionTemplate sqlSession, Reply rp) {

		return sqlSession.insert("boardMapper.insertReply",rp);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		
		return sqlSession.update("boardMapper.deleteReply", replyNo);
	}

	public int updateReply(SqlSessionTemplate sqlSession, Reply rp) {
		
		return sqlSession.update("boardMapper.updateReply", rp);
	}

	public Reply selectReply(SqlSessionTemplate sqlSession, Reply rp) {
		
		return sqlSession.selectOne("boardMapper.selectReply",rp);
	}


}
