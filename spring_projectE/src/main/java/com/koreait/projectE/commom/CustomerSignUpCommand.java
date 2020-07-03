package com.koreait.projectE.commom;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.dao.DAO;

public class CustomerSignUpCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String cId = request.getParameter("cId");
		String cPw = request.getParameter("cPw");
		String cName = request.getParameter("cName");
		String cNickname = request.getParameter("cNickName");
		int cPhone = Integer.parseInt(request.getParameter("cPhone"));
		String cEmail = request.getParameter("cEmail");
		String cGender = request.getParameter("cGender");
		
		DAO dao = sqlSession.getMapper(DAO.class);
		
		dao.customerSignUp(cId, cPw, cName, cNickname, cPhone, cEmail, cGender);
		
		
	}

}
