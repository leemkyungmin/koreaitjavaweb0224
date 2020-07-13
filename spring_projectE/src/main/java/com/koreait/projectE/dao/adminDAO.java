package com.koreait.projectE.dao;

import java.util.ArrayList;

import com.koreait.projectE.dto.CustomerDTO;
import com.koreait.projectE.dto.DepartmentDTO;

public interface adminDAO {

	
	public ArrayList<CustomerDTO> getCustomList();
	
	public ArrayList<DepartmentDTO> getDepartmentList();
	
	public CustomerDTO UpdateUserPage(int cNo);
	
	public ArrayList<CustomerDTO> getAjaxCutomer(String query);
	
	
	// 승인 받아야 하는 업체리스트
	public ArrayList<DepartmentDTO> deptAcceptList();
	
}


