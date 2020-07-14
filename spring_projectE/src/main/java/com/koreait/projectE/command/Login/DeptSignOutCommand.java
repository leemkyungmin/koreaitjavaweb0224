package com.koreait.projectE.command.Login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.LoginDAO;

public class DeptSignOutCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String dSaup_no = request.getParameter("dSaup_no");
		
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		
		lDAO.deptSignOut1(dSaup_no);
		lDAO.deptSignOut2(dSaup_no);
		lDAO.deptSignOut3(dSaup_no);
		lDAO.deptSignOut4(dSaup_no);
		lDAO.deptSignOut5(dSaup_no);
		

	}

}
