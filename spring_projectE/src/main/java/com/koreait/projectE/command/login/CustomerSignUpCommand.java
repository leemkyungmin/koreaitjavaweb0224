package com.koreait.projectE.command.login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.LoginDAO;

public class CustomerSignUpCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String cId = request.getParameter("cId");
		String cPw = request.getParameter("cPw");
		String cName = request.getParameter("cName");
		String cNickname = request.getParameter("cNickname");
		String cPhone = request.getParameter("cPhone");
		String cEmail = request.getParameter("cEmail");
		String cGender = request.getParameter("cGender");
		
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		
		dao.customerSignUp(cId, cPw, cName, cNickname, cPhone, cEmail, cGender);
		
		
	}

}
