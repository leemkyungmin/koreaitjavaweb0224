package com.koreait.projectE.command.Login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.LoginDAO;

public class CustomerLoginCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String cId = request.getParameter("cId");
		String cPw = request.getParameter("cPw");
		
		LoginDAO ldao = sqlSession.getMapper(LoginDAO.class);
		
		ldao.customerLogin(cId, cPw);
		
	}

}
