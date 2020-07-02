package com.koreait.mybatis04.dao;

import java.util.ArrayList;

import com.koreait.mybatis04.dto.ImageBoardDTO;

public interface ImageBoardDAO {

	//1. imageBoardInsert
	public void imageBoardInsert(String iWriter ,String iTitle,String iContent,String saveFilename);

	public ArrayList<ImageBoardDTO> selectimageBoardList();
}
