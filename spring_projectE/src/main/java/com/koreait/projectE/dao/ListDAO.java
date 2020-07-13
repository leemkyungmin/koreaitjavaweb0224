package com.koreait.projectE.dao;

import java.util.ArrayList;

import com.koreait.projectE.dto.DepartmentDTO;
import com.koreait.projectE.dto.MainListDTO;

public interface ListDAO {

	/*public ArrayList<String> si_list();
	
	public String[] dong_list(String si);*/
	
	public ArrayList<MainListDTO> main_list();
	
	public ArrayList<DepartmentDTO> location_list(String location);
	
	public MainListDTO get_locationCount(String location);
<<<<<<< HEAD
	
	public ArrayList<DepartmentDTO> search_list(String query);
=======
		
>>>>>>> branch 'master' of https://github.com/leemkyungmin/koreaitjavaweb0224.git
}
