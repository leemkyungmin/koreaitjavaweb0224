package com.koreait.projectE.command.Login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.LoginDAO;

public class CustomerSignOutCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String cNo = request.getParameter("cNo");
		
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		
		lDAO.customerSignOut1(cNo);
		lDAO.customerSignOut2(cNo);
		lDAO.customerSignOut3(cNo);
		
		
		
	}

}
