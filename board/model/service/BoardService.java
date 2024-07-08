package com.project.aloneBab.board.model.service;

import java.util.ArrayList;

import com.project.aloneBab.board.model.vo.Board;
import com.project.aloneBab.board.model.vo.Image;
import com.project.aloneBab.board.model.vo.Recipe;

public interface BoardService {

	Board selectMyBoard(int boardNo);

	Recipe selectRecipe(int boardNo);

	ArrayList<Image> selectImage(int recipeNo);

}
