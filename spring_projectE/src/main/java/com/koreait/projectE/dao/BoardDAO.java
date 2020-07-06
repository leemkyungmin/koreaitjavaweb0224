package com.koreait.projectE.dao;

import java.util.ArrayList;

import com.koreait.projectE.dto.DepartmentDTO;
import com.koreait.projectE.dto.MenuDTO;
import com.koreait.projectE.dto.ReviewDTO;

public interface BoardDAO {
   
	
	//리뷰에서 Rating 평점을 가져와 update
	public void DepartRatingUpdate(String dSaup_no);
	
	// 업체 정보 가져오기 
	public DepartmentDTO DepartView(String dSaup_no);
	// 리뷰 가져오기 
	public ArrayList<ReviewDTO> reviewList(String dSaup_no);
	// 조회수 증가 
	public void UpdateHit(String dSaup_no);
	// 메뉴 정보 가져오기
	
	//appointment 개수 가져오기 
	public int appointmentCount(String dSaup_no);
	
	// 주소로 사이드 리스트 받아 오기 
	public ArrayList<DepartmentDTO> getSide_list(String addr);
	
	public ArrayList<MenuDTO> menuList(String dSaup_no);
}
