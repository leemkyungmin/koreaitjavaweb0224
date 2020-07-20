package com.koreait.projectE.command.Admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.command.PageMaker;
import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.AdminDAO;
import com.koreait.projectE.dto.CustomerDTO;

public class AdminSearchQueryCusInfo implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// 회원정보 검색 후 페이지 구현
		String pageStr = request.getParameter("page"); // 현재 페이지
		if (pageStr == null || pageStr.isEmpty()) {
			pageStr = "1";
		}
		int page = Integer.parseInt(pageStr);
		
		// 현재 페이지 번호를 이용해 페이지 시작과 끝의 번호를 구한다
		int recordPerPage = 15; // 1페이지당 보여줄 갯수
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = recordPerPage * page;

		String query = request.getParameter("query");
		
		Map<String, Object> record = new HashMap<String, Object>();
		record.put("beginRecord", beginRecord);
		record.put("endRecord", endRecord);
		record.put("query", query);
		
		AdminDAO aDAO = sqlSession.getMapper(AdminDAO.class);
		ArrayList<CustomerDTO> cList = aDAO.searchQueryCusInfo(record);
		
		// 검색한 갯수 구하기
		int totalRecord = aDAO.searchQueryCusCount(query);
		
		// 페이지 뷰 생성
		String pageView = PageMaker.getPageView2("searchQueryCysInfo?query=" + query, page, recordPerPage, totalRecord);
		
		// 데이터 MODEL에 담아 VIEW에 전달
		model.addAttribute("page", page);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("cList", cList);
		model.addAttribute("pageView", pageView);
	}

}
