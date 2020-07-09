package com.koreait.projectE.dao;

import java.util.ArrayList;

import com.koreait.projectE.dto.MainListDTO;

public interface ListDAO {

	/*public ArrayList<String> si_list();
	
	public String[] dong_list(String si);*/
	
	public ArrayList<MainListDTO> main_list();
}
