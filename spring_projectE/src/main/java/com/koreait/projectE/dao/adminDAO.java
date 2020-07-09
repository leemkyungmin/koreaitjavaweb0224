package com.koreait.projectE.dao;

import java.util.ArrayList;

import com.koreait.projectE.dto.CustomerDTO;
import com.koreait.projectE.dto.DepartmentDTO;

public interface adminDAO {

	
	public ArrayList<CustomerDTO> getCustomList();
	
	public ArrayList<DepartmentDTO> getDepartmentList();
	
	public CustomerDTO UpdateUserPage(int cNo);
}


