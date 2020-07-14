package com.koreait.projectE.dao;

import java.util.ArrayList;

import com.koreait.projectE.dto.CustomerDTO;
import com.koreait.projectE.dto.DepartmentDTO;

public interface adminDAO {

	
	public ArrayList<CustomerDTO> getCustomList();
	
	public ArrayList<DepartmentDTO> getDepartmentList();
	
	public CustomerDTO UpdateUserPage(int cNo);
	
	public ArrayList<CustomerDTO> getAjaxCutomer(String query);
	
	public DepartmentDTO UpdateDepartmentPage(String dNo);
	
	public void deleteUser(String cNo);
	public void deleteReview(String cNo);
	
	// 승인 받아야 하는 업체리스트
	public ArrayList<DepartmentDTO> deptAcceptList();
	
	// 승인 업체 view
	public DepartmentDTO deptAcceptView(long dNo);
	
	// 업체 승인
	public void deptAccept(int dNo);
	
	// 업체 거절 -> 삭제
	public void deptReject(int dNo);
}


