package com.project.aloneBab.board.model.service;

import java.util.ArrayList;

import com.project.aloneBab.board.model.vo.Board;
import com.project.aloneBab.board.model.vo.DivideSearch;
import com.project.aloneBab.board.model.vo.Image;
import com.project.aloneBab.board.model.vo.PageInfo;
import com.project.aloneBab.board.model.vo.Recipe;
import com.project.aloneBab.board.model.vo.Reply;

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



}
