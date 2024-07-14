package com.project.aloneBab.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.aloneBab.board.model.vo.RandomRecipe;

public interface BoardService {

	ArrayList<RandomRecipe> randomChoice(HashMap<String, Object> key);

	int insertReply(Reply rp);

	int deleteReply(int replyNo);

	int updateReply(Reply rp);

	Reply selectReply(Reply rp);

}
