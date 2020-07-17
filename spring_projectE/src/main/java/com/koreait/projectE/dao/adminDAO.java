package com.koreait.projectE.dao;

import java.util.ArrayList;
import java.util.Map;

import com.koreait.projectE.dto.CustomerDTO;
import com.koreait.projectE.dto.DepartmentDTO;
import com.koreait.projectE.dto.ReviewDTO;

public interface adminDAO {

	// 한 페이지에 보여줘야 할 회원리스트
	public ArrayList<CustomerDTO> getCustomList(Map<String, Integer> record);
	
	// 전체 회원 수
	public int getTotelRecord();
	
	// 한 페이지에 보여줄 업체 리스트
	public ArrayList<DepartmentDTO> getDepartmentList(Map<String, Integer> record);
	
	// 전체 업체 수
	public int getTotelDept();
	
	public CustomerDTO UpdateUserPage(int cNo);
	
	public ArrayList<CustomerDTO> getAjaxCutomer(String query);
	
	public DepartmentDTO UpdateDepartmentPage(String dNo);
	
	public void deleteUser(String cNo);
	public void deleteReview(String cNo);
	
	public void UpdateUser(String cGrade,String cNo);
	
	// 승인 받아야 하는 업체리스트
	public ArrayList<DepartmentDTO> deptAcceptList(Map<String, Integer> record);

	// 승인 업체 view
	public DepartmentDTO deptAcceptView(long dNo);
	
	// 승인 받아야 하는 업체 수
	public int deptAcceptCount();
	
	// 업체 승인
	public void deptAccept(int dNo);
	
	// 업체 거절 -> 삭제
	public void deptReject(int dNo);
	

	public ArrayList<ReviewDTO> customerReview(Map<String, Integer> record);

	// 업체리스트에서 검색
	public ArrayList<DepartmentDTO> searchQueryDeptInfo(Map<String, Object> record);
	
	// 검색한 리트스 개수
	public int searchQueryDeptCount(String query);


}
