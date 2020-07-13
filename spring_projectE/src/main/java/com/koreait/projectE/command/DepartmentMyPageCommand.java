package com.koreait.projectE.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.LoginDAO;

public class DepartmentMyPageCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		String dSaup_no = (String) session.getAttribute("dSaup_no");
		
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		
		model.addAttribute("dDTO", lDAO.selectBydSaup_no(dSaup_no));
		
	}

}
