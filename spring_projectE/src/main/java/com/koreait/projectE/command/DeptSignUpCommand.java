package com.koreait.projectE.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.LoginDAO;

public class DeptSignUpCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String dSaup_no = request.getParameter("dSaup_no");
		String dId = request.getParameter("dId");
		String dPw = request.getParameter("dPw");
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		
		dao.deptSignUp(dSaup_no, dId, dPw);
		    
	}

}
