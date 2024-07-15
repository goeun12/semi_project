package com.project.aloneBab.board.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import com.project.aloneBab.board.model.vo.Board;
import com.project.aloneBab.board.model.vo.DivideSearch;
import com.project.aloneBab.board.model.vo.Image;
import com.project.aloneBab.board.model.vo.RandomRecipe;
import com.project.aloneBab.board.model.vo.Recipe;
import com.project.aloneBab.board.model.vo.Reply;
import com.project.aloneBab.common.PageInfo;

public interface BoardService {

	int getListCount(String i);

	ArrayList<Board> selectBoardList(PageInfo pi, String string);

	ArrayList<Recipe> selectRecipeList(Integer bId);

	ArrayList<Image> selectImageList(Integer rId);

	Board selectBoard(int bId, String id);

	int insertImage(ArrayList<Image> iList);

	int deleteBoard(int bId);

	int getDivideCount(DivideSearch ds);

	ArrayList<Board> selectDivideBoardList(PageInfo pi, DivideSearch ds);

	int insertBoard(Board b);

	int insertRecipe(Recipe recipe);

	ArrayList<Board> selectRecommendBoardList(String nation);

	int updateRecipe(Recipe recipe);

	void deleteImage(int recipeNo);

	int updateBoard(Board b);

	int editImage(ArrayList<Image> iList);

	ArrayList<Reply> selectReplyList(Integer bNo);
	
	ArrayList<RandomRecipe> randomChoice(HashMap<String, Object> key);

	Board selectMyBoard(int boardNo);

	Recipe selectRecipe(int boardNo);
	
	Board tipcomment(int bId, String id);
	
	ArrayList<Reply> tipcomment(PageInfo pi);

	int getTipListCount(String i);

	ArrayList<Board> tipListView(PageInfo pi, String string);

	int insertTip(Board b);

	Board selectTip(int bNo, String id);

	int updateTip(Board b);

	int deleteTip(int bNo);

	ArrayList<Board> searchTip(String searchType, String honeyKeyword);
	
	int insertReply(Reply rp);

	int deleteReply(int replyNo);

	int updateReply(Reply rp);

	Reply selectReply(Reply rp);

}
