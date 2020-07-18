package com.koreait.projectE.command.Admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.command.PageMaker;
import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.adminDAO;
import com.koreait.projectE.dto.DepartmentDTO;

public class AdminDeptAcceptListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// 업체승인 목록 페이지 구현
		String pageStr = request.getParameter("page"); // 현재 페이지
		if (pageStr == null || pageStr.isEmpty()) {
			pageStr = "1";
		}
		int page = Integer.parseInt(pageStr);
		
		// 현재 페이지 번호를 이용해 페이지 시작과 끝의 번호를 구한다
		int recordPerPage = 15; // 1페이지당 보여줄 갯수
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = recordPerPage * page;
		
		Map<String, Integer> record = new HashMap<String, Integer>();
		record.put("beginRecord", beginRecord);
		record.put("endRecord", endRecord);
		
		// 업체 리스트 가져오기
		adminDAO aDAO = sqlSession.getMapper(adminDAO.class);
		ArrayList<DepartmentDTO> deptList = aDAO.deptAcceptList(record);
		
		int totalRecord = aDAO.deptAcceptCount();
		
		// 페이지 뷰 생성
		String pageView = PageMaker.getPageView("deptAccpetPage", page, recordPerPage, totalRecord);
				
		model.addAttribute("page", page);
		model.addAttribute("deptList", deptList);
		model.addAttribute("pageView", pageView);
	}

}
