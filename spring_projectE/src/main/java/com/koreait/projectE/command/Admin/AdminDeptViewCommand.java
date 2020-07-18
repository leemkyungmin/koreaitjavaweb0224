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

public class AdminDeptViewCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// 회원정보 페이지 구현
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
		adminDAO adao = sqlSession.getMapper(adminDAO.class);
		ArrayList<DepartmentDTO> dList = adao.getDepartmentList(record);
		
		// 업체 아이디 가져오기
		
		// 전체 회원 수 구하기
		int totalRecord = adao.getTotelDept();
		
		// 페이지 뷰 생성
		String pageView = PageMaker.getPageView("departmentView", page, recordPerPage, totalRecord);
		
		// 데이터 MODEL에 담아 VIEW에 전달
		model.addAttribute("page", page);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("dList", dList);
		model.addAttribute("pageView", pageView);

	}

}
